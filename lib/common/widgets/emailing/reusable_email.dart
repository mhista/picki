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
    required this.doneOnpressed,
    required this.resendeOnpressed,
    this.email = '',
  });
  final String image, title, subtitle, elevatedaBtnText, textBtnText;
  final String email;
  final VoidCallback doneOnpressed, resendeOnpressed;

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
          email,
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
            onPressed: doneOnpressed,
            child: Text(elevatedaBtnText),
          ),
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: resendeOnpressed,
            child: Text(textBtnText),
          ),
        ),
      ],
    );
  }
}
