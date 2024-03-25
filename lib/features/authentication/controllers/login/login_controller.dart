import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pickafrika/common/loaders/loaders.dart';
import 'package:pickafrika/data/repositories/authentication_repository/authentication_repository.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/fullscreen_loader.dart';
import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  // VARIABLE
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() async {
    email.text = localStorage.read('remember_me_email');
    password.text = localStorage.read('remember_me_password');
    super.onInit();
  }

  Future<void> emailAndPassworSignIn() async {
    try {
      // START LOADING
      PFullScreenLoader.openLoadingDialog('Logging in.... ', PImages.loading);
      // CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // FORM VALIDATION
      if (!loginFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }
      // STORE REMEMBER ME
      if (rememberMe.value) {
        // localStorage.writeIfNull('remember_me', true);
        localStorage.writeIfNull('remember_me_email', email.text.trim());
        localStorage.writeIfNull('remember_me_password', password.text.trim());
      }
      // LOGIN USER
      await AuthenticationRepository.instance
          .loginWitheEmailAndPassword(email.text.trim(), password.text.trim());

      // REMOVE LOADER
      PFullScreenLoader.stopLoading();

      // REDIRECT TO HOME
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: "Ooops!", message: e.toString());
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      // START LOADING
      PFullScreenLoader.openLoadingDialog('Logging in.... ', PImages.loading);
      // CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);
      // remove loader
      PFullScreenLoader.stopLoading();

      // SHOW SUCCES MESSAGE
      PLoaders.successSnackBar(title: 'Welcome back!');
      // MOVE TO VERIFY HOME SCREEN
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: "Ooops!", message: e.toString());
    }
  }
}
