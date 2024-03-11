import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../shimmer/shimmer.dart';

class PRoundedImage extends StatelessWidget {
  const PRoundedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.applyImageRadius = true,
    this.isNetworkImage = false,
    this.backgroundColor = PColors.light,
    this.fit = BoxFit.fill,
    this.padding,
    this.onPressed,
    this.border,
    this.borderRadius = PSizes.md,
  });
  final String imageUrl;
  final double? width, height;
  final bool applyImageRadius, isNetworkImage;
  final Color backgroundColor;
  final BoxFit? fit;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PSizes.sm),
        child: Container(
          padding: padding,
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: fit,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => PShimmerEffect(
                      color: backgroundColor,
                      height: 100,
                      width: double.infinity,
                      radius: borderRadius,
                    ),
                  )
                : Image(
                    image: AssetImage(imageUrl),
                    fit: fit,
                  ),
          ),
        ),
      ),
    );
  }
}
