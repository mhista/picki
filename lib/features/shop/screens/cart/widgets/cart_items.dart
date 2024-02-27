import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButton = true});
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) => Column(
              children: [
                const CartItem(),
                if (showAddRemoveButton)
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                // ADD AND REMOVE BUTTONS

                if (showAddRemoveButton)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // extra space
                          const SizedBox(
                            width: 89,
                          ),
                          // ADD REMOVE BUTTON
                          ProductAddAndRemove(
                            width: 32,
                            height: 32,
                            addColor: PColors.white,
                            addBgColor: PColors.primary,
                            minusColor: isDark ? PColors.white : PColors.black,
                            minusBgColor:
                                isDark ? PColors.darkerGrey : PColors.light,
                            text: '2',
                            addOnPressed: () {},
                            minusOnPressed: () {},
                          ),
                        ],
                      ),
                      // PRODUCT TOTAL PRICE
                      const ProductPriceText(price: '266')
                    ],
                  )
              ],
            ),
        separatorBuilder: (_, __) => const SizedBox(
              height: PSizes.spaceBtwSections,
            ),
        itemCount: 2);
  }
}
