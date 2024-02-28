import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pickafrika/common/widgets/images/edge_rounded_images.dart';
import 'package:pickafrika/common/widgets/texts/brand_text_title_with_icon.dart';
import 'package:pickafrika/common/widgets/texts/product_price_text.dart';
import 'package:pickafrika/common/widgets/texts/product_title_text.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/favorite_icon.dart';
import 'add_to_cart_container.dart';
import 'sale_tag.dart';

class PProductCardHorizontal extends StatelessWidget {
  const PProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    // card with side paddings, edges, radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(PSizes.productImageRadius),
            color: isDark ? PColors.darkerGrey : PColors.light),
        child: Row(
          children: [
            // Thumbnail
            PRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(PSizes.sm),
              backgroundColor: isDark ? PColors.black : PColors.white,
              child: Stack(
                children: [
                  // THUMBNAIL IMAGE
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: PRoundedImage(
                      imageUrl: PImages.productShoe3,
                      applyImageRadius: true,
                      backgroundColor: isDark ? PColors.black : PColors.white,
                    ),
                  ),
                  const SaleTagWidget(
                    tag: '50',
                    top: 10,
                  ),
                  const FavoriteIcon(
                    top: -2,
                    right: 0,
                  ),
                ],
              ),
            ),
            // DETAILS
            const SizedBox(
              width: 172,
              child: Padding(
                padding: EdgeInsets.only(top: PSizes.sm, left: PSizes.sm),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        ProductTitleText(
                          title: 'White Air jordan wfjicuninc wjfoio iojriof',
                          smallSize: true,
                        ),
                        SizedBox(
                          height: PSizes.spaceBtwItems / 2,
                        ),
                        BrandTitleTextWithVerifiedIcon(title: 'Nike')
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // Pricing
                      children: [
                        Flexible(child: ProductPriceText(price: '300.0 ')),
                        // Add to cart
                        AddToCartContainer()
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
