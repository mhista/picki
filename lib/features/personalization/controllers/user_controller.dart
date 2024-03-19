import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pickafrika/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:pickafrika/data/repositories/user/user_repository.dart';
import 'package:pickafrika/features/authentication/models/user_model.dart';
import 'package:pickafrika/features/authentication/screens/login/login.dart';
import 'package:pickafrika/features/personalization/screens/profile/widgets/re_authenticate_user.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../common/loaders/loaders.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/fullscreen_loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  // OBSERVABLE USERMODEL
  Rx<UserModel> user = UserModel.empty().obs;
  // LOADER NOTIFIER
  final profileLoading = false.obs;
  final imageUploading = false.obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  onInit() {
    super.onInit();
    fetchUserRecord();
  }

// FETCH USER RECORD
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;

      final user = await userRepository.fetchUserData();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

// SAVE USER RECORD
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        // CONVERT THE DISPLAY NAME TO FIRST AND LAST NAME
        if (userCredential != null) {
          final nameParts =
              UserModel.splitFullName(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          // MAP DATA
          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              username: username,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePicture: userCredential.user!.photoURL ?? '');

          await userRepository.saveUser(user);
        }
      }
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: "Ooops!", message: e.toString());
    }
  }

// DELETE ACCOUNT POPUP
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(PSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to dekete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: PSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

// REAUTHENTICATE USER BEFOR DELETING
  Future<void> reAuthenticateEmailAndPassword() async {
    // / START LOADING
    try {
      PFullScreenLoader.openLoadingDialog('Processing.... ', PImages.lottie1);
      // CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }
      // FORM VALIDATION
      if (!reAuthFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      debugPrint('reauthenticated');
      await AuthenticationRepository.instance.deleteAccount();
      PFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      PFullScreenLoader.stopLoading();

      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // DELETE USER ACCOUNT
  void deleteUserAccount() async {
    try {
      // FIRST REAUTHENTICATE USER
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          // REVERIFY AUTH EMAIL
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          PFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          PFullScreenLoader.stopLoading();
          Get.offAll(() => const ReAuthUserScreen());
        }
      }
    } catch (e) {
      PFullScreenLoader.stopLoading();

      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // UPLOAD USER PROFILE PICTURE
  void uploadUserProfilePics() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxWidth: 512,
          maxHeight: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile', image);

        // UPDATE USER IMAGE IN FIRESTORE
        Map<String, dynamic> map = {'profilePicture': imageUrl};
        await userRepository.updateSingleField(map);

        user.value.profilePicture = imageUrl;
        PLoaders.successSnackBar(
            title: 'Update successfull',
            message: 'Your profile image has been updated');
      }
    } catch (e) {
      PFullScreenLoader.stopLoading();

      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
