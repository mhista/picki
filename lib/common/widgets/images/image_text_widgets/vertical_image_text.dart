import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../shimmer/shimmer.dart';

class PVerticalImageText extends StatelessWidget {
  const PVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = PColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
    this.fit = BoxFit.fitWidth,
    this.overlayColor,
  });
  final BoxFit? fit;
  final String image, title;
  final Color textColor;
  final Color? backgroundColor, overlayColor;
  final bool isNetworkImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: PSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(PSizes.sm),
                decoration: BoxDecoration(
                  color: backgroundColor ??
                      (isDark ? PColors.black : PColors.white),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: isNetworkImage
                      ? CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          imageUrl: image,
                          color: overlayColor,
                          fit: fit,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  const PShimmerEffect(
                            height: 55,
                            width: 55,
                            radius: 55,
                          ),
                        )
                      : Image(
                          image: AssetImage(image),
                          color: overlayColor,
                          fit: fit,
                        ),
                )),
            const SizedBox(height: PSizes.spaceBtwItems / 2),
            SizedBox(
              width: 49,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
