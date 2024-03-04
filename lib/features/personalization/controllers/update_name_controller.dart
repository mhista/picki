import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/features/authentication/models/user_model.dart';
import 'package:pickafrika/features/personalization/controllers/user_controller.dart';
import 'package:pickafrika/features/personalization/screens/profile/profile.dart';

import '../../../common/loaders/loaders.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/device/network_manager.dart';
import '../../../utils/popups/fullscreen_loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> updateUserFormKey = GlobalKey<FormState>();

  @override
  onInit() {
    initializeNames();
    super.onInit();
  }

// SAVE USER RECORD
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

// FETCH USER RECORD
  Future<void> updateUserName() async {
    try {
      // START LOADING
      PFullScreenLoader.openLoadingDialog(
          'Updating your information.... ', PImages.lottie1);
      // CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }
      // FORM VALIDATION
      if (!updateUserFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // UPDATE USER FIRST AND LASTNAME IN THE FIREBASE FIRESTORE
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);
      // UPDATE THE RX USER VALUE
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // STOP THE LOADER
      PFullScreenLoader.stopLoading();
      // SHOW SUCCESS INFO
      PLoaders.successSnackBar(
          title: 'Update successfull', message: 'Your name has been updated');
      Get.off(() => const ProfileScreen());
    } catch (e) {
      PFullScreenLoader.stopLoading();

      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
