import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class PProductImageSlider extends StatelessWidget {
  const PProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Positioned(
      right: 0,
      left: PSizes.spaceBtwSections,
      bottom: 30,
      child: SizedBox(
        height: 75,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (_, index) => PRoundedImage(
                padding: const EdgeInsets.all(PSizes.sm),
                border: Border.all(color: PColors.primary),
                width: 75,
                backgroundColor: isDark ? PColors.dark : PColors.white,
                imageUrl: PImages.productWomen8),
            separatorBuilder: (_, __) => const SizedBox(),
            itemCount: 8),
      ),
    );
  }
}
