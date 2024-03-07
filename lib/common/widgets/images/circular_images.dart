import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/shimmer/shimmer.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class PCircularImage extends StatelessWidget {
  const PCircularImage({
    super.key,
    required this.imageUrl,
    this.width = 56,
    this.height = 56,
    this.padding = PSizes.xs,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.overLayColor,
  });

  final String imageUrl;
  final double width, height, padding;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final BoxFit? fit;
  final Color? overLayColor;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color:
              backgroundColor ?? (isDark ? PColors.dark : PColors.transparent),
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  color: overLayColor,
                  fit: fit,
                  height: height,
                  width: width,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const PShimmerEffect(
                    height: 100,
                    width: 100,
                    radius: 100,
                  ),
                )
              : Image(
                  height: height,
                  width: width,
                  image: AssetImage(imageUrl),
                  color: overLayColor,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
