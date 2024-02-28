import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class AddToCartContainer extends StatelessWidget {
  const AddToCartContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: PColors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(PSizes.cardRadiusMd),
          bottomRight: Radius.circular(PSizes.productImageRadius),
        ),
      ),
      child: const SizedBox(
        width: PSizes.iconLg * 1.2,
        height: PSizes.iconLg * 1.2,
        child: Center(
          child: Icon(
            Iconsax.add,
            color: PColors.white,
          ),
        ),
      ),
    );
  }
}
