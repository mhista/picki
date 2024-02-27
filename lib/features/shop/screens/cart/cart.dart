import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/common/widgets/texts/product_price_text.dart';
import 'package:pickafrika/features/shop/screens/checkout/checkout.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../utils/constants/colors.dart';
import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
          padding: EdgeInsets.all(PSizes.defaultSpace), child: CartItems()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: const Text('Checkout \$2700')),
      ),
    );
  }
}
