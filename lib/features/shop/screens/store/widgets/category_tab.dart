import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/layouts/gid_layout.dart';
import 'package:pickafrika/common/widgets/products/product_cards/product_card_vertical.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PSizes.defaultSpace),
      child: Column(
        children: [
          // BRANDS
          const BrandShowcase(
            images: [
              PImages.productShoe3,
              PImages.productMen2,
              PImages.productWomen1
            ],
          ),
          PSectionHeading(
            title: 'You Might Like',
            onPressed: () {},
          ),
          const SizedBox(
            height: PSizes.spaceBtwItems,
          ),
          PGridLayout(
              itemCount: 4,
              itemBuilder: (_, index) => const PProductCardVertical())
        ],
      ),
    );
  }
}
