import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/styles/shadows.dart';
import 'package:pickafrika/common/widgets/icons/favorite_icon.dart';
import 'package:pickafrika/common/widgets/images/edge_rounded_images.dart';
import 'package:pickafrika/common/widgets/products/product_cards/sale_tag.dart';
import 'package:pickafrika/features/shop/controllers/product/product_controller.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../texts/brand_text_title_with_icon.dart';
import '../../texts/product_title_text.dart';
import '../product_pricing_row.dart';

class PProductCardVertical extends StatelessWidget {
  const PProductCardVertical({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final isDark = PHelperFunctions.isDarkMode(context);
    // card with side paddings, edges, radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            product: product,
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
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                    ),
                  ),
                  if (salePercentage != null)
                    SaleTagWidget(
                      tag: salePercentage,
                      top: 10,
                    ),
                  FavoriteIcon(
                    top: 0,
                    right: 0,
                    productId: product.id,
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
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems / 2,
                  ),
                  BrandTitleTextWithVerifiedIcon(
                    title: product.brand!.name,
                  ),
                ],
              ),
            ),
            const Spacer(),
            PricingRow(product: product, controller: controller)
          ],
        ),
      ),
    );
  }
}
