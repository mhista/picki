import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class ProductAddAndRemove extends StatelessWidget {
  const ProductAddAndRemove({
    super.key,
    required this.width,
    required this.height,
    this.size,
    required this.addColor,
    required this.addBgColor,
    required this.minusColor,
    required this.minusBgColor,
    required this.text,
    required this.addOnPressed,
    required this.minusOnPressed,
  });
  final double width, height;
  final double? size;
  final Color addColor, addBgColor;
  final Color minusColor, minusBgColor;
  final String text;
  final Function() addOnPressed;
  final Function() minusOnPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PCircularIcon(
          icon: Iconsax.minus,
          height: height,
          width: width,
          size: PSizes.md,
          color: minusColor,
          backgroundColor: minusBgColor,
          onPressed: minusOnPressed,
        ),
        const SizedBox(
          width: PSizes.spaceBtwItems,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: PSizes.spaceBtwItems,
        ),
        PCircularIcon(
          icon: Iconsax.add,
          height: height,
          width: width,
          size: PSizes.md,
          color: addColor,
          backgroundColor: addBgColor,
          onPressed: addOnPressed,
        ),
      ],
    );
  }
}
