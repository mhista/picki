import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/icons/circular_icon.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: PSizes.spaceBtwSections,
          vertical: PSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDark ? PColors.darkerGrey : PColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(PSizes.cardRadiusLg),
          topRight: Radius.circular(PSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const PCircularIcon(
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                backgroundColor: PColors.darkGrey,
                color: PColors.white,
              ),
              const SizedBox(
                width: PSizes.spaceBtwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: PSizes.spaceBtwItems,
              ),
              const PCircularIcon(
                icon: Iconsax.add,
                width: 40,
                height: 40,
                backgroundColor: PColors.black,
                color: PColors.white,
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(PSizes.md),
                backgroundColor: PColors.black,
                side: const BorderSide(color: PColors.black)),
            onPressed: () {},
            child: const Text('Add To Cart'),
          )
        ],
      ),
    );
  }
}
