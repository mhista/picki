import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return PRoundedContainer(
      padding: const EdgeInsets.all(PSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? PColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : isDark
              ? PColors.darkerGrey
              : PColors.grey,
      margin: const EdgeInsets.only(bottom: PSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? isDark
                      ? PColors.light
                      : PColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Deo ',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
              ),
              const SizedBox(
                height: PSizes.sm / 2,
              ),
              const Text(
                '+234 70 6888 4102',
                overflow: TextOverflow.ellipsis,
                // style: Theme.of(context).textTheme.titleLarge,
                maxLines: 1,
              ),
              const SizedBox(
                height: PSizes.sm / 2,
              ),
              const Text(
                'No.93 Emmanuel college layout, Owerri, Imo state, Nigeria',
                softWrap: true,
              ),
              const SizedBox(
                height: PSizes.sm / 2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
