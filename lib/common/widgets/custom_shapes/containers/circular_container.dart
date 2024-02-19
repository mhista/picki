import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class PCircularContainer extends StatelessWidget {
  const PCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = PColors.white,
    this.child,
  });
  final double? width, height;
  final double radius, padding;
  final Color backgroundColor;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor.withOpacity(0.1)),
      child: child,
    );
  }
}
