import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pickafrika/common/widgets/texts/product_price_text.dart';
import 'package:pickafrika/common/widgets/texts/product_title_text.dart';
import 'package:pickafrika/common/widgets/texts/section_heading.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/pchoice_chip.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // SELECTED ATTRIBUTE PRICING
        PRoundedContainer(
          padding: const EdgeInsets.all(PSizes.md),
          backgroundColor: isDark ? PColors.darkerGrey : PColors.grey,
          child: Column(
            children: [
              // TITLE , PRICE AND STOCK STATUS
              Row(
                children: [
                  const PSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: PSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Price',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: PSizes.spaceBtwItems / 4,
                          ),
                          // ACCOUNT PRICE
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: PSizes.spaceBtwItems / 3,
                          ),
                          const ProductPriceText(
                            price: '20',
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Stock',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: PSizes.spaceBtwItems / 3,
                          ),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              // VARIATION
              const ProductTitleText(
                title:
                    'This is the description of the product and it can be upto 4 lines',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems,
        ),
        // ATTRIBUTES
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PSectionHeading(
                          title: attribute.name ?? '',
                          showActionButton: false,
                        ),
                        const SizedBox(
                          height: PSizes.spaceBtwItems,
                        ),
                        Wrap(
                            spacing: 8,
                            children: attribute.values!
                                .map((val) => PChoiceChip(
                                      text: val,
                                      selected: true,
                                      onSelected: (value) {},
                                    ))
                                .toList()),
                      ],
                    ))
                .toList())
      ],
    );
  }
}
