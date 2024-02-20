import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/styles/spacing_styles.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            const PPrimaryHeaderContainer(
              child: Column(
                children: [
                  // APP BAR
                  PHomeAppbar(),
                  SizedBox(
                    height: PSizes.spaceBtwSections,
                  ),

                  // SEARCHBAR PART
                  PSearchContainer(
                    icon: Iconsax.search_normal,
                    text: 'Search in Market',
                  ),
                  SizedBox(
                    height: PSizes.defaultSpace,
                  ),

                  // CATEGORIES PART
                  Padding(
                    padding: EdgeInsets.only(
                      left: PSizes.defaultSpace,
                    ),
                    child: Column(
                      children: [
                        PSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: PColors.white,
                        ),
                        SizedBox(
                          height: PSizes.spaceBtwItems,
                        ),
                        PHomeCategories()
                      ],
                    ),
                  )
                ],
              ),
            ),
            // BODY PART
            Padding(
              padding: PSpacingStyle.carouselPadding,
              child: Column(
                children: [
                  CarouselSlider(
                    items: const [
                      PRoundedImage(
                        imageUrl: PImages.promoBanner1,
                      ),
                      PRoundedImage(
                        imageUrl: PImages.promoBanner2,
                      ),
                      PRoundedImage(
                        imageUrl: PImages.promoBanner3,
                      ),
                    ],
                    options: CarouselOptions(
                      viewportFraction: 1,
                    ),
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        const PCircularContainer(
                          margin: EdgeInsets.only(right: 10),
                          width: 20,
                          height: 4,
                          backgroundColor: Colors.green,
                        ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
