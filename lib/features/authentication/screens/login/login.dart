import 'package:flutter/material.dart';
import 'package:pickafrika/common/styles/spacing_styles.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/constants/text_strings.dart';

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
