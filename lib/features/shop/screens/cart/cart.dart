import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/features/shop/controllers/cart_controller.dart';
import 'package:pickafrika/features/shop/screens/checkout/checkout.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../../common/loaders/animation_loader.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(() {
        final emptyAnimationWidget = AnimationLoaderWidget(
          text: 'Whoops! Your Cart is empty!',
          animation: PImages.whops,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );
        if (cartController.cartItems.isEmpty) {
          return emptyAnimationWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(PSizes.defaultSpace),
                child: CartItems()),
          );
        }
      }),
      bottomNavigationBar: cartController.cartItems.isEmpty
          ? const SizedBox(
              // height: PSizes.defaultSpace,
              )
          : Padding(
              padding: const EdgeInsets.all(PSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  child: Obx(() {
                    return Text(
                        'Checkout \$${cartController.totalCartPrice.value}');
                  })),
            ),
    );
  }
}
