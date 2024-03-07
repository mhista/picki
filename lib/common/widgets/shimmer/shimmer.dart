import 'package:flutter/material.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class PShimmerEffect extends StatelessWidget {
  const PShimmerEffect(
      {super.key,
      required this.height,
      required this.width,
      this.radius = 15,
      this.color});

  final double height, width, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (isDark ? PColors.darkerGrey : PColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
