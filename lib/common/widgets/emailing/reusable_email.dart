import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class ReusableEmailWidget extends StatelessWidget {
  const ReusableEmailWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.elevatedaBtnText,
    required this.textBtnText,
    required this.eOnpressed,
    required this.tOnpressed,
  });
  final String image, title, subtitle, elevatedaBtnText, textBtnText;
  final VoidCallback eOnpressed, tOnpressed;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          'diweesomchi@gmail.com',
          style: Theme.of(context).textTheme.labelLarge,
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
        // BUTTON
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: eOnpressed,
            child: Text(elevatedaBtnText),
          ),
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: tOnpressed,
            child: Text(textBtnText),
          ),
        ),
      ],
    );
  }
}
