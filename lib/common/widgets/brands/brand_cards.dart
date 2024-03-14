import 'package:flutter/material.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/circular_images.dart';
import '../texts/brand_text_title_with_icon.dart';

class BrandCard extends StatelessWidget {
  const BrandCard(
      {super.key, required this.showBorder, this.onTap, required this.brand});
  final bool showBorder;
  final void Function()? onTap;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: PRoundedContainer(
        padding: const EdgeInsets.all(PSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: PCircularImage(
                imageUrl: brand.image,
                isNetworkImage: true,
                backgroundColor: PColors.transparent,
                overLayColor: isDark ? PColors.white : PColors.dark,
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwItems / 2,
            ),

            // TEXT
            Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BrandTitleTextWithVerifiedIcon(
                      title: brand.name,
                      brandTextSize: TextSizes.large,
                    ),
                    Text(
                      '${brand.productsCount ?? 0} products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
