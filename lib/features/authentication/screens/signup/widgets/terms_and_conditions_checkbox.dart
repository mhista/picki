import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/features/authentication/controllers/signup/signup_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class PTermsAndConditions extends StatelessWidget {
  const PTermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(
          width: PSizes.spaceBtwItems,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${PTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '${PTexts.privacyPolicy} ',
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: isDark ? PColors.white : PColors.primary,
                      decorationColor: isDark ? PColors.white : PColors.primary,
                      decoration: TextDecoration.underline)),
              TextSpan(
                  text: '${PTexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '${PTexts.termsOfUse} ',
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: isDark ? PColors.white : PColors.primary,
                      decorationColor: isDark ? PColors.white : PColors.primary,
                      decoration: TextDecoration.underline)),
            ],
          ),
        )
      ],
    );
  }
}
