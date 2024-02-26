import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/products/cart/add_remove_button.dart';
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
              ProductAddAndRemove(
                  width: 40,
                  height: 40,
                  addColor: PColors.white,
                  addBgColor: PColors.black,
                  minusColor: PColors.white,
                  minusBgColor: PColors.darkGrey,
                  text: '2',
                  addOnPressed: () {},
                  minusOnPressed: () {}),
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
