import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/edge_rounded_images.dart';
import '../../texts/brand_text_title_with_icon.dart';
import '../../texts/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        // IMAGE
        PRoundedImage(
          imageUrl: PImages.productShoe3,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(PSizes.md),
          backgroundColor: isDark ? PColors.darkerGrey : PColors.light,
        ),
        const SizedBox(
          width: PSizes.spaceBtwItems,
        ),

        // TITLE , PRICE, SIZE
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleTextWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: ProductTitleText(
                  title: 'White Air jordan ',
                  maxLines: 1,
                ),
              ),
              // /ATTRIBUTES

              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: 'Green ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: 'UK 08 ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              )),
            ],
          ),
        )
      ],
    );
  }
}
