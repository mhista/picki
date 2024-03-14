import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/features/shop/models/brand_model.dart';
import 'package:pickafrika/features/shop/screens/brands/brand_products.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../shimmer/shimmer.dart';
import 'brand_cards.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });
  final List<String> images;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return InkWell(
      onTap: () => Get.to(
        () => BrandProduct(brand: brand),
      ),
      child: PRoundedContainer(
        padding: const EdgeInsets.all(PSizes.md),
        showBorder: true,
        borderColor: PColors.darkGrey,
        backgroundColor: PColors.transparent,
        margin: const EdgeInsets.only(
          bottom: PSizes.spaceBtwItems,
        ),
        child: Column(
          children: [
            // BRAND WITH PRODUTC COUNT
            BrandCard(
              showBorder: false,
              brand: brand,
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),

            // BRAND TOP THREE PRODUCT IMAGES
            Row(
                children: images
                    .map((image) =>
                        BrandProductShowcaseImage(isDark, image, context))
                    .toList())
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BrandProductShowcaseImage(bool isDark, String image, context) {
    return Expanded(
      child: PRoundedContainer(
        height: 100,
        backgroundColor: isDark ? PColors.darkerGrey : PColors.light,
        margin: const EdgeInsets.only(right: PSizes.sm),
        padding: const EdgeInsets.all(PSizes.md),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const PShimmerEffect(
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
