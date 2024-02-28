import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/brands/brand_cards.dart';
import 'package:pickafrika/common/widgets/layouts/gid_layout.dart';
import 'package:pickafrika/common/widgets/texts/section_heading.dart';
import 'package:pickafrika/features/shop/screens/brands/brand_products.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appBar.dart';
import '../../../../utils/helpers/helper_functions.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const PAppBar(
        title: Text(
          'Brand',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace - 4),
          child: Column(
            children: [
              // HEADING
              const PSectionHeading(
                title: 'Brands',
                showActionButton: true,
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),

              // BRANDS
              PGridLayout(
                  mainAxisExtent: 80,
                  itemCount: 10,
                  itemBuilder: (contex, index) => BrandCard(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProduct()),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
