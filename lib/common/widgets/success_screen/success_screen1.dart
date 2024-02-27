import 'package:flutter/material.dart';
import 'package:pickafrika/common/styles/spacing_styles.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen1 extends StatelessWidget {
  const SuccessScreen1(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});
  final String image, title, subtitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PSpacingStyle.successScreenPadding * 1.5,
          child: Column(
            children: [
              // IMAGE
              Image(
                image: AssetImage(image),
                width: PHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              // TITLE
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),

              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              // BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(PTexts.acontinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
