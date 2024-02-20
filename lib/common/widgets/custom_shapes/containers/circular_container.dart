import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class PCircularContainer extends StatelessWidget {
  const PCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.margin,
    this.backgroundColor = PColors.white,
    this.child,
  });
  final double? width, height;
  final double radius, padding;
  final Color backgroundColor;
  final Widget? child;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor == PColors.white
              ? backgroundColor.withOpacity(0.1)
              : backgroundColor),
      child: child,
    );
  }
}
