import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/texts/section_heading.dart';
import 'package:pickafrika/features/personalization/controllers/address_controller.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PSectionHeading(
          title: 'Shipping Address',
          showActionButton: true,
          buttonTitle: 'Change',
          onPressed: () => controller.selectNewAddressPopup(context),
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 2,
        ),
        controller.selectedAddress.value.id.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Somtech',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(
                        width: PSizes.spaceBtwItems,
                      ),
                      Text(
                        '+234 70 6888 4102',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_history,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(
                        width: PSizes.spaceBtwItems,
                      ),
                      Text(
                        'No.93 Emmanuel college layout owerri',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              )
            : Text(
                'Select Address',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
      ],
    );
  }
}
