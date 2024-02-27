import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pickafrika/common/widgets/texts/section_heading.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        const PSectionHeading(
          title: 'Payment Method',
          showActionButton: true,
          buttonTitle: 'Change',
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            PRoundedContainer(
              width: 60,
              height: 60,
              backgroundColor: isDark ? PColors.light : PColors.white,
              padding: const EdgeInsets.all(PSizes.md),
              child: const Image(
                image: AssetImage(PImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: PSizes.spaceBtwItems / 2,
            ),
            Text(
              'PayPal',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}
