import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/styles/shadows.dart';
import 'package:pickafrika/common/widgets/icons/favorite_icon.dart';
import 'package:pickafrika/common/widgets/images/edge_rounded_images.dart';
import 'package:pickafrika/common/widgets/products/product_cards/sale_tag.dart';
import 'package:pickafrika/features/shop/controllers/product/product_controller.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/enums.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../texts/brand_text_title_with_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';
import 'add_to_cart_container.dart';

class PProductCardVertical extends StatelessWidget {
  const PProductCardVertical({super.key, this.product});
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final salePercentage =
        controller.calculateSalePercentage(product!.price, product!.salePrice);
    final isDark = PHelperFunctions.isDarkMode(context);
    // card with side paddings, edges, radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            product: product!,
          )),
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
              width: 175,
              padding: const EdgeInsets.all(PSizes.sm),
              backgroundColor: isDark ? PColors.black : PColors.light,
              child: Stack(
                children: [
                  // THUMBNAIL IMAGE
                  Center(
                    child: PRoundedImage(
                      backgroundColor: isDark ? PColors.black : PColors.light,
                      isNetworkImage: true,
                      imageUrl: product!.thumbnail,
                      applyImageRadius: true,
                    ),
                  ),
                  SaleTagWidget(
                    tag: salePercentage,
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
            Padding(
              padding: const EdgeInsets.only(left: PSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: product!.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems / 2,
                  ),
                  BrandTitleTextWithVerifiedIcon(
                    title: product!.brand!.name,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // PRICE
                Flexible(
                  child: Column(
                    children: [
                      if (product!.productType == ProductType.single.name &&
                          product!.salePrice! > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: PSizes.sm),
                          child: Text(
                            product!.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      // PRICE, SHOW SALE PRICE AS MAIN PRICE IF SALE EXIST
                      Padding(
                        padding: const EdgeInsets.only(left: PSizes.sm),
                        child: ProductPriceText(
                          price: controller.getProductPrice(product!),
                        ),
                      ),
                    ],
                  ),
                ),
                // ADD TO CAT BUTTON
                const AddToCartContainer()
              ],
            )
          ],
        ),
      ),
    );
  }
}
