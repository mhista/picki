import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/styles/spacing_styles.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/constants/text_strings.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/signup_login/form_divider.dart';
import '../../../../common/widgets/signup_login/social_button.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo, Title, Subtitle,

              PLoginHeader(),

              // Form
              PLoginForm(),

              // Divider
              PFormeDivider(
                dividerText: PTexts.orSignInWith,
              ),
              SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              // Footer
              PSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
