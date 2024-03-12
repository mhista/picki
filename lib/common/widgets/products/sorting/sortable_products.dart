import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';

import '../../../../features/shop/controllers/product/all_product_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../layouts/gid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          dropdownColor: isDark ? PColors.black : PColors.white,
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
            'Name',
            'High Price',
            'Low Price',
            'Sale',
            'New Products',
            // 'Popular products'
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // Sort products based on the selected option
            controller.sortProducts(value!);
          },
        ),
        const SizedBox(
          height: PSizes.spaceBtwSections,
        ),
        Obx(() {
          return PGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => PProductCardVertical(
                    product: controller.products[index],
                  ));
        })
      ],
    );
  }
}
