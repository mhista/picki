import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/loaders/loaders.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pickafrika/features/shop/controllers/order_controller.dart';
import 'package:pickafrika/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:pickafrika/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:pickafrika/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appBar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/helpers/pricing_calculator.dart';
import '../../controllers/cart_controller.dart';
import 'widget/billing_amount_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    final orderController = Get.put(OrderController());
    final subTotal = controller.totalCartPrice.value;
    final itemCount = controller.noOfCartItems.value;
    final total =
        PPricingCalculator.calculateTotalPrice(subTotal, 'Nigeria', itemCount);

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
            onPressed: subTotal > 0
                ? () => orderController.processOrder(total)
                : PLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart in order to proceed'),
            child: Text('Checkout \$$total')),
      ),
    );
  }
}
