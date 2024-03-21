import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/features/shop/controllers/cart_controller.dart';

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
    final cartController = CartController.instance;
    return ListView.separated(
      itemCount: cartController.cartItems.length,
      shrinkWrap: true,
      itemBuilder: (_, index) => Obx(() {
        debugPrint(index.toString());
        final item = cartController.cartItems[index];
        return Column(
          children: [
            CartItem(
              cartItem: item,
            ),
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
                        text: item.quantity.toString(),
                        addOnPressed: () => cartController.addItemToCart(item),
                        minusOnPressed: () =>
                            cartController.removeItemFromCart(item),
                      ),
                    ],
                  ),
                  // PRODUCT TOTAL PRICE
                  ProductPriceText(
                      price: (item.price * item.quantity).toStringAsFixed(1))
                ],
              )
          ],
        );
      }),
      separatorBuilder: (_, __) => const SizedBox(
        height: PSizes.spaceBtwSections,
      ),
    );
  }
}
