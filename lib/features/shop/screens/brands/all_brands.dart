import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/brands/brand_cards.dart';
import 'package:pickafrika/common/widgets/layouts/gid_layout.dart';
import 'package:pickafrika/common/widgets/texts/section_heading.dart';
import 'package:pickafrika/features/shop/controllers/brand_controller.dart';
import 'package:pickafrika/features/shop/screens/brands/brand_products.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appBar.dart';
import '../../../../common/widgets/shimmer/brand_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
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
              Obx(() {
                if (controller.isLoading.value) return const BrandShimmer();
                if (controller.allBrands.isEmpty)
                  // ignore: curly_braces_in_flow_control_structures
                  return Center(
                    child: Text(
                      'No Data!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.white),
                    ),
                  );
                return PGridLayout(
                    mainAxisExtent: 80,
                    itemCount: controller.allBrands.length,
                    itemBuilder: (_, index) {
                      final brand = controller.allBrands[index];
                      return BrandCard(
                        showBorder: false,
                        brand: brand,
                        onTap: () => Get.to(() => BrandProduct(
                              brand: brand,
                            )),
                      );
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
