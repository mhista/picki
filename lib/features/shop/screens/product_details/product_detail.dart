import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:pickafrika/common/widgets/icons/circular_icon.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/product_image_slider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: PCurvedEdgesWidget(
          child: Column(
            children: [
              // PRODUCT IMAGE SLIDER
              Container(
                color: isDark ? PColors.darkerGrey : PColors.light,
                child: const Stack(
                  children: [
                    // MAIN LARGE IMAGE
                    SizedBox(
                      height: 370,
                      child: Padding(
                        padding: EdgeInsets.all(PSizes.productImageRadius * 2),
                        child: Center(
                          child: Image(
                            image: AssetImage(PImages.productWomen8),
                          ),
                        ),
                      ),
                    ),

                    //  IMAGE SLIDER
                    PProductImageSlider(),
                    // APPBAR ICONS
                    PAppBar(
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
            ],
          ),
        ),
      ),
    );
  }
}
