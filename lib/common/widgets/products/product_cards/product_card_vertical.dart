import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/styles/shadows.dart';
import 'package:pickafrika/common/widgets/images/edge_rounded_images.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/enums.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../texts/brand_text_title_with_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class PProductCardVertical extends StatelessWidget {
  const PProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    // card with side paddings, edges, radius and shadow
    return GestureDetector(
      onTap: () {},
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
              backgroundColor: isDark ? PColors.black : PColors.white,
              child: Stack(
                children: [
                  PRoundedImage(
                    imageUrl: PImages.productShoe3,
                    applyImageRadius: true,
                    backgroundColor: isDark ? PColors.black : PColors.white,
                  ),
                  Positioned(
                    top: 10,
                    child: PRoundedContainer(
                      radius: PSizes.sm,
                      backgroundColor: PColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: PSizes.sm, vertical: PSizes.xs),
                      child: Text(
                        '50%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: PColors.black),
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 0,
                    top: 0,
                    child: PCircularIcon(
                      icon: Iconsax.heart5,
                      color: PColors.error,
                    ),
                  ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // PRICE
                const Padding(
                  padding: EdgeInsets.only(left: PSizes.sm),
                  child: ProductPriceText(
                    price: '50.0',
                  ),
                ),
                // ADD TO CAT BUTTON
                Container(
                  decoration: const BoxDecoration(
                    color: PColors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(PSizes.cardRadiusMd),
                      bottomRight: Radius.circular(PSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: PSizes.iconLg * 1.2,
                    height: PSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: PColors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
