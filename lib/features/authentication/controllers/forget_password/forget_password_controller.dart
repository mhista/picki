import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:pickafrika/features/authentication/screens/password_config/reset_password.dart';

import '../../../../common/loaders/loaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/device/network_manager.dart';
import '../../../../utils/popups/fullscreen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();
  // VARIABLE

  final email = TextEditingController();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      // START LOADING
      PFullScreenLoader.openLoadingDialog(
          'Processing Your Request.... ', PImages.lottie1);
      // CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }
      // FORM VALIDATION
      if (!resetPasswordFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // SEND RESET LINK
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // REMOVE THE LOADER
      PFullScreenLoader.stopLoading();
      // SHOW SUCCESS SCREEN
      PLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link has been sent to reset your password');

      // REDIRECT
      Get.to(() => ResetPasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: "Ooops!", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // START LOADING
      PFullScreenLoader.openLoadingDialog(
          'Processing Your Request.... ', PImages.lottie1);
      // CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }

      // SEND RESET LINK
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // REMOVE THE LOADER
      PFullScreenLoader.stopLoading();
      // SHOW SUCCESS SCREEN
      PLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link has been sent to reset your password');
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: "Ooops!", message: e.toString());
    }
  }
}
