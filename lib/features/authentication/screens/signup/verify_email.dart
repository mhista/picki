import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/success_screen/success_screen1.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/constants/text_strings.dart';

import '../../../../common/widgets/emailing/reusable_email.dart';
import '../login/login.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: ReusableEmailWidget(
              image: PImages.emailDeliveredImage,
              title: PTexts.confirmEmail,
              subtitle: PTexts.confirmEmailSubtitle,
              elevatedaBtnText: PTexts.acontinue,
              textBtnText: PTexts.resendEmail,
              eOnpressed: () => Get.to(
                    () => SuccessScreen1(
                      image: PImages.successImage,
                      title: PTexts.accountCreatedTitle,
                      subtitle: PTexts.accountCreatedSubtitle,
                      onPressed: () => Get.to(() => const LoginScreen()),
                    ),
                  ),
              tOnpressed: () {}),
        ),
      ),
    );
  }
}
