import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/common/widgets/texts/product_price_text.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../utils/constants/colors.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (_, index) => Column(
                  children: [
                    const CartItem(),
                    const SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // extra space
                            const SizedBox(
                              width: 89,
                            ),
                            // ADD AND REMOVE BUTTONS
                            ProductAddAndRemove(
                              width: 32,
                              height: 32,
                              addColor: PColors.white,
                              addBgColor: PColors.primary,
                              minusColor:
                                  isDark ? PColors.white : PColors.black,
                              minusBgColor:
                                  isDark ? PColors.darkerGrey : PColors.light,
                              text: '2',
                              addOnPressed: () {},
                              minusOnPressed: () {},
                            ),
                          ],
                        ),
                        const ProductPriceText(price: '266')
                      ],
                    )
                  ],
                ),
            separatorBuilder: (_, __) => const SizedBox(
                  height: PSizes.spaceBtwSections,
                ),
            itemCount: 10),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {}, child: const Text('Checkout \$2700')),
      ),
    );
  }
}
