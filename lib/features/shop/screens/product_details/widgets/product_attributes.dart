import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pickafrika/common/widgets/texts/product_price_text.dart';
import 'package:pickafrika/common/widgets/texts/product_title_text.dart';
import 'package:pickafrika/common/widgets/texts/section_heading.dart';
import 'package:pickafrika/features/shop/controllers/product/variation_controller.dart';
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
    final controller = Get.put(VariationController());
    final isDark = PHelperFunctions.isDarkMode(context);
    return Obx(() => Column(
          children: [
            // SELECTED ATTRIBUTE PRICING
            if (controller.selectedVariation.value.id.isNotEmpty)
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
                                if (controller
                                        .selectedVariation.value.salePrice >
                                    0)
                                  Text(
                                    '\$${controller.selectedVariation.value.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                const SizedBox(
                                  width: PSizes.spaceBtwItems / 2,
                                ),
                                ProductPriceText(
                                    price: controller.getVariationPrice())
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
                                Text(controller.variationStockStatus.value,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    // VARIATION
                    ProductTitleText(
                      title: controller.selectedVariation.value.description!,
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
                            Obx(() {
                              return Wrap(
                                  spacing: 8,
                                  children: attribute.values!.map((val) {
                                    final isSelected =
                                        controller.selectedAttributes[
                                                attribute.name] ==
                                            val;
                                    debugPrint(isSelected.toString());
                                    final available = controller
                                        .getAttributeAvailabilityInVariation(
                                            product.productVariations!,
                                            attribute.name!)
                                        .contains(val);
                                    return PChoiceChip(
                                      text: val,
                                      selected: isSelected,
                                      onSelected: available
                                          ? (selected) {
                                              if (selected && available) {
                                                controller.onAttributeSelected(
                                                    product,
                                                    attribute.name ?? '',
                                                    val);
                                              }
                                            }
                                          : null,
                                    );
                                  }).toList());
                            }),
                          ],
                        ))
                    .toList())
          ],
        ));
  }
}
