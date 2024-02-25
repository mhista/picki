import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';

import '../../../../../common/widgets/appbar/appBar.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return PCurvedEdgesWidget(
      child: Container(
        color: isDark ? PColors.darkerGrey : PColors.light,
        child: Stack(
          children: [
            // MAIN LARGE IMAGE
            const SizedBox(
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(PSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(PImages.productShoe3),
                  ),
                ),
              ),
            ),

            //  IMAGE SLIDER
            Positioned(
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
                        imageUrl: PImages.productShoe5),
                    separatorBuilder: (_, __) => const SizedBox(),
                    itemCount: 8),
              ),
            ),
            // APPBAR ICONS
            const PAppBar(
              showBackArrow: true,
              actions: [
                PCircularIcon(
                  icon: Iconsax.heart5,
                  color: PColors.error,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
