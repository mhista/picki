import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:pickafrika/features/authentication/controllers/signup/email_verification_controller.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/constants/text_strings.dart';

import '../../../../common/widgets/emailing/reusable_email.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;

// The close icon logs out the user and redirects to the login screen
// this is to hhandle scenerios where the user enters the registration process
// and the data is stored, upon reopening the app, checks if the email is verified
// if not, the app will go back to the verification screen
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmailVerificationController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: ReusableEmailWidget(
              email: email ?? '',
              image: PImages.emailDeliveredImage,
              title: PTexts.confirmEmail,
              subtitle: PTexts.confirmEmailSubtitle,
              elevatedaBtnText: PTexts.acontinue,
              textBtnText: PTexts.resendEmail,
              eOnpressed: () =>
                  Get.to(() => controller.checkEmailVerificationStatus()),
              tOnpressed: () => controller.verifyUserEmail()),
        ),
      ),
    );
  }
}
