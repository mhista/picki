import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/images/circular_images.dart';
import 'package:pickafrika/common/widgets/texts/brand_text_title_with_icon.dart';
import 'package:pickafrika/common/widgets/texts/product_price_text.dart';
import 'package:pickafrika/common/widgets/texts/product_title_text.dart';
import 'package:pickafrika/utils/constants/enums.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // PRICE AND SALE PRICE
        Row(
          children: [
            PRoundedContainer(
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
            const SizedBox(
              width: PSizes.spaceBtwItems / 2,
            ),
            // PRICE
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: PSizes.spaceBtwItems / 2,
            ),
            const ProductPriceText(
              price: '180',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 1.5,
        ),

        // TITLE
        const ProductTitleText(
          title: 'Red Jacket with shimmerings',
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 1.5,
        ),

        // STOCK STATUS
        Row(
          children: [
            const ProductTitleText(title: 'Status:'),
            const SizedBox(
              width: PSizes.spaceBtwItems / 1.5,
            ),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium!),
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 1.5,
        ),
        // BRAND
        Row(
          children: [
            PCircularImage(
              imageUrl: PImages.shoeIcon,
              width: 32,
              height: 32,
              overLayColor: isDark ? PColors.white : PColors.dark,
            ),
            const Flexible(
              child: BrandTitleTextWithVerifiedIcon(
                title: 'Nike',
                brandTextSize: TextSizes.medium,
              ),
            ),
          ],
        )
      ],
    );
  }
}
