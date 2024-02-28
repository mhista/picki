import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../layouts/gid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

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
            'Popular products'
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        const SizedBox(
          height: PSizes.spaceBtwSections,
        ),
        PGridLayout(
            itemCount: 8,
            itemBuilder: (_, index) => const PProductCardVertical())
      ],
    );
  }
}
