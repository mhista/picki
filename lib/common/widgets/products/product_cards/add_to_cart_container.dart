import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/features/shop/controllers/cart_controller.dart';
import 'package:pickafrika/features/shop/screens/product_details/product_detail.dart';
import 'package:pickafrika/utils/constants/enums.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class AddToCartContainer extends StatelessWidget {
  const AddToCartContainer({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return InkWell(
      onTap: () {
        // if the product has variation, open the product detail for variation selection
        // else add product to cart
        if (product.productType == ProductType.single.name) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addItemToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? PColors.primary : PColors.dark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(PSizes.cardRadiusMd),
              bottomRight: Radius.circular(PSizes.productImageRadius),
            ),
          ),
          child: SizedBox(
            width: PSizes.iconLg * 1.2,
            height: PSizes.iconLg * 1.2,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(
                      productQuantityInCart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: PColors.white),
                    )
                  : const Icon(
                      Iconsax.add,
                      color: PColors.white,
                    ),
            ),
          ),
        );
      }),
    );
  }
}
