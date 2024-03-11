import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class SaleTagWidget extends StatelessWidget {
  const SaleTagWidget({
    super.key,
    this.top,
    this.right,
    this.left,
    this.bottom,
    this.backgrondColor = PColors.secondary,
    this.tag = '',
  });
  final double? top, right, left, bottom;
  final Color backgrondColor;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: PRoundedContainer(
        radius: PSizes.sm,
        backgroundColor: backgrondColor.withOpacity(0.8),
        padding: const EdgeInsets.symmetric(
            horizontal: PSizes.sm, vertical: PSizes.xs),
        child: Text(
          '$tag%',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .apply(color: PColors.black),
        ),
      ),
    );
  }
}
