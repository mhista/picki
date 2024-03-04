import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/emailing/reusable_email.dart';
import 'package:pickafrika/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:pickafrika/features/authentication/screens/login/login.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/constants/text_strings.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;

  const ResetPasswordScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              // IMAGE WITH 60% OF SCREEN WIDTH
              // TITLE AND AND SUBTITLE
              // BUTTONS
              ReusableEmailWidget(
                  email: email,
                  image: PImages.emailDeliveredImage,
                  title: PTexts.changePasswordTitle,
                  subtitle: PTexts.changePasswordSubtitle,
                  elevatedaBtnText: PTexts.done,
                  textBtnText: PTexts.resendEmail,
                  doneOnpressed: () => Get.offAll(() => const LoginScreen()),
                  resendeOnpressed: () => ForgetPasswordController.instance
                      .resendPasswordResetEmail(email))
            ],
          ),
        ),
      ),
    );
  }
}
