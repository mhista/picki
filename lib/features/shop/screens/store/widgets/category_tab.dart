import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/layouts/gid_layout.dart';
import 'package:pickafrika/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:pickafrika/features/shop/models/category_model.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
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
                  itemBuilder: (_, index) => const PProductCardVertical()),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
