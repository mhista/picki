import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_cards.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return PRoundedContainer(
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
          const BrandCard(showBorder: false),
          const SizedBox(
            height: PSizes.spaceBtwItems,
          ),

          // BRAND TOP THREE PRODUCT IMAGES
          Row(
              children: images
                  .map((image) =>
                      BrandProductShocaseImage(isDark, image, context))
                  .toList())
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BrandProductShocaseImage(bool isDark, String image, context) {
    return Expanded(
      child: PRoundedContainer(
        height: 100,
        backgroundColor: isDark ? PColors.darkerGrey : PColors.light,
        margin: const EdgeInsets.only(right: PSizes.sm),
        padding: const EdgeInsets.all(PSizes.md),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
