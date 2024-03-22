import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pickafrika/common/widgets/images/edge_rounded_images.dart';
import 'package:pickafrika/common/widgets/products/product_pricing_row.dart';
import 'package:pickafrika/common/widgets/texts/brand_text_title_with_icon.dart';
import 'package:pickafrika/common/widgets/texts/product_title_text.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';
import 'package:pickafrika/features/shop/screens/product_details/product_detail.dart';
// ignore: unused_import
import 'package:pickafrika/utils/constants/image_strings.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/favorite_icon.dart';
import 'sale_tag.dart';

class PProductCardHorizontal extends StatelessWidget {
  const PProductCardHorizontal({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    // card with side paddings, edges, radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
          product: product)), //=> Get.to(() => const ProductDetailScreen()),
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
                      isNetworkImage: true,
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      backgroundColor: isDark ? PColors.black : PColors.white,
                    ),
                  ),
                  if (salePercentage != null)
                    const SaleTagWidget(
                      tag: '50',
                      top: 10,
                    ),
                  FavoriteIcon(
                    top: -2,
                    right: 0,
                    productId: product.id,
                  ),
                ],
              ),
            ),
            // DETAILS
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: PSizes.sm, left: PSizes.sm),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        ProductTitleText(
                          title: product.title,
                          smallSize: true,
                        ),
                        const SizedBox(
                          height: PSizes.spaceBtwItems / 2,
                        ),
                        BrandTitleTextWithVerifiedIcon(
                            title: product.brand!.name)
                      ],
                    ),
                    const Spacer(),
                    PricingRow(
                      product: product,
                      controller: controller,
                      isRow: true,
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
