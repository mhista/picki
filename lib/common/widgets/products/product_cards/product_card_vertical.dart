import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/styles/shadows.dart';
import 'package:pickafrika/common/widgets/icons/favorite_icon.dart';
import 'package:pickafrika/common/widgets/images/edge_rounded_images.dart';
import 'package:pickafrika/common/widgets/products/product_cards/sale_tag.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../texts/brand_text_title_with_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';
import 'add_to_cart_container.dart';

class PProductCardVertical extends StatelessWidget {
  const PProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    // card with side paddings, edges, radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [PShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(PSizes.productImageRadius),
            color: isDark ? PColors.darkerGrey : PColors.white),
        child: Column(
          //Thumbnail. wishlist button, discount tag
          children: [
            PRoundedContainer(
              height: 175,
              padding: const EdgeInsets.all(PSizes.sm),
              backgroundColor: isDark ? PColors.black : PColors.light,
              child: Stack(
                children: [
                  PRoundedImage(
                    imageUrl: PImages.productShoe3,
                    applyImageRadius: true,
                    backgroundColor: isDark ? PColors.black : PColors.light,
                  ),
                  const SaleTagWidget(
                    tag: '40',
                    top: 10,
                  ),
                  const FavoriteIcon(
                    top: 0,
                    right: 0,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems / 2,
            ),
            // Details of product
            const Padding(
              padding: EdgeInsets.only(left: PSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: 'White Air Jordan Shoes',
                    smallSize: true,
                  ),
                  SizedBox(
                    height: PSizes.spaceBtwItems / 2,
                  ),
                  BrandTitleTextWithVerifiedIcon(
                    title: 'Nike',
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // PRICE
                Padding(
                  padding: EdgeInsets.only(left: PSizes.sm),
                  child: ProductPriceText(
                    price: '50.0',
                  ),
                ),
                // ADD TO CAT BUTTON
                AddToCartContainer()
              ],
            )
          ],
        ),
      ),
    );
  }
}
