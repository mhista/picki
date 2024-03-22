import 'package:flutter/material.dart';
import 'package:pickafrika/features/shop/controllers/cart_controller.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/pricing_calculator.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    final itemCount = controller.noOfCartItems.value;
    return Column(
      children: [
        // SUBTOTAL
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$$subTotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 2,
        ),
        // SHIPPING FEE
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${PPricingCalculator.calculateShippingCost(subTotal, 'Nigeria', itemCount)}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 2,
        ),
        // TAX FEE
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${PPricingCalculator.calculateTax(subTotal, 'Nigeria')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 2,
        ),
        // SHIPPING FEE
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${PPricingCalculator.calculateTotalPrice(subTotal, 'Nigeria', itemCount)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        )
      ],
    );
  }
}
