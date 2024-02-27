import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pickafrika/common/widgets/products/cart/cart_item.dart';
import 'package:pickafrika/common/widgets/success_screen/success_screen1.dart';
import 'package:pickafrika/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:pickafrika/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:pickafrika/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:pickafrika/navigation_menu.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appBar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'widget/billing_amount_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace - 4.0),
          child: Column(
            children: [
              const CartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),

              // COUPON FIELD
              const CouponCodeField(),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),

              // BILLING SECTION
              PRoundedContainer(
                padding: const EdgeInsets.all(PSizes.md),
                showBorder: true,
                backgroundColor: isDark ? PColors.black : PColors.white,
                child: const Column(
                  children: [
                    // pricing
                    BillingAmountSection(),
                    // divider
                    Divider(),
                    SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),
                    // payment methods
                    BillingPaymentSection(),
                    SizedBox(
                      height: PSizes.spaceBtwItems,
                    ),
                    // address
                    BillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // CHECKOUT BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen1(
                  image: PImages.orderSuccessful,
                  title: 'Payment Successful',
                  subtitle:
                      'Your product has been added for shipment. expect soon!',
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                )),
            child: const Text('Checkout \$2700')),
      ),
    );
  }
}
