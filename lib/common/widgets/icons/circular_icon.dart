import 'package:flutter/material.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class PCircularIcon extends StatelessWidget {
  // Custom circular icon with a backgrund

  // properties
  //Container [width, height and backgroundColor]
// Icon [size, color and onPressed]
  const PCircularIcon({
    super.key,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.width,
    this.height,
    this.onPressed,
    this.size = PSizes.lg,
    this.animate = true,
    this.productId,
  });

  final IconData icon;
  final Color? color, backgroundColor;

  final double? width, height, size;
  final VoidCallback? onPressed;
  final bool animate;
  final String? productId;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor ??
              (isDark
                  ? PColors.dark.withOpacity(0.9)
                  : PColors.light.withOpacity(0.9)),
          borderRadius: BorderRadius.circular(100)),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
            size: size,
          )),
    );
  }
}
