import 'package:flutter/material.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class PRoundedContainer extends StatelessWidget {
  const PRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = PSizes.cardRadiusLg,
    this.backgroundColor = PColors.white,
    this.borderColor = PColors.borderPrimary,
    this.child,
    this.margin,
    this.padding,
    this.showBorder = false,
  });
  final double? width, height;
  final double radius;
  final Color backgroundColor, borderColor;
  final Widget? child;
  final EdgeInsetsGeometry? margin, padding;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
