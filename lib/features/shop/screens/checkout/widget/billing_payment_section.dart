import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pickafrika/common/widgets/texts/section_heading.dart';
import 'package:pickafrika/features/shop/controllers/checkout_controller.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = CheckoutController.instance;
    return Column(
      children: [
        PSectionHeading(
          title: 'Payment Method',
          showActionButton: true,
          buttonTitle: 'Change',
          onPressed: () => controller.selectPaymentModel(context),
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            Obx(() {
              return PRoundedContainer(
                width: 60,
                height: 60,
                backgroundColor: isDark ? PColors.light : PColors.white,
                padding: const EdgeInsets.all(PSizes.md),
                child: Image(
                  image:
                      AssetImage(controller.selectedPaymentModel.value.image),
                  fit: BoxFit.contain,
                ),
              );
            }),
            const SizedBox(
              width: PSizes.spaceBtwItems / 2,
            ),
            Text(
              controller.selectedPaymentModel.value.name,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}
