import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import 'circular_icon.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    this.top,
    this.right,
    this.left,
    this.bottom,
    this.backgrondColor,
  });
  final double? top, right, left, bottom;
  final Color? backgrondColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: const PCircularIcon(
        // backgroundColor: PColors.white,
        icon: Iconsax.heart5,
        color: PColors.error,
      ),
    );
  }
}
