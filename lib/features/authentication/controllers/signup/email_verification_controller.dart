import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/loaders/loaders.dart';
import 'package:pickafrika/common/widgets/success_screen/success_screen1.dart';
import 'package:pickafrika/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/text_strings.dart';

class EmailVerificationController extends GetxController {
  static EmailVerificationController get instance => Get.find();

// VARIABLES

// SEND EMAIL VERIFICATION WHENEVER VERIFY SCREEN APPEARS AND SET TIMER FOR AUTO REDIRECT
  @override
  void onInit() {
    verifyUserEmail();
    autoRedirectTimer();
    super.onInit();
  }

// SEND EMAIL VERIFICATION LINK
  Future<void> verifyUserEmail() async {
    try {
      await AuthenticationRepository.instance.verifyUserEmail();
      PLoaders.successSnackBar(
          title: 'Account created successfully',
          message:
              'Verification email has been sent to ${FirebaseAuth.instance.currentUser?.email}');
    } catch (e) {
      PLoaders.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }

// TIMER TO AUTOMATE REDIRECT ON EMAIL VERIFICATION
  autoRedirectTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen1(
            image: PImages.successAnimation,
            title: PTexts.accountCreatedTitle,
            subtitle: PTexts.accountCreatedSubtitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

// MANUALLY CHEK IF EMAIL IS VERIFIED
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen1(
          image: PImages.successAnimation,
          title: PTexts.accountCreatedTitle,
          subtitle: PTexts.accountCreatedSubtitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }

}
