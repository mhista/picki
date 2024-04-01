import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_text_title.dart';

class BrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const BrandTitleTextWithVerifiedIcon({
    super.key,
    required this.title,
    this.brandTextSize = TextSizes.small,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.textColor,
    this.iconColor = PColors.primary,
  });

  final String title;
  final TextSizes? brandTextSize;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? textColor, iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(
          width: PSizes.xs,
        ),
        const Icon(
          Iconsax.verify5,
          color: PColors.primary,
          size: PSizes.iconXs,
        )
      ],
    );
  }
}
