import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/common/widgets/appbar/tapBar.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:pickafrika/common/widgets/layouts/gid_layout.dart';
import 'package:pickafrika/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:pickafrika/common/widgets/shimmer/brand_shimmer.dart';
import 'package:pickafrika/features/shop/controllers/brand_controller.dart';
import 'package:pickafrika/features/shop/controllers/category_controller.dart';
import 'package:pickafrika/features/shop/screens/brands/all_brands.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brands/brand_cards.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../brands/brand_products.dart';
import 'widgets/category_tab.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final brands = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    final isDark = PHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: PAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            PCartCounterIcon(
              // onPressed: () {},
              iconColor: isDark ? PColors.light : PColors.dark,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: isDark ? PColors.black : PColors.white,
                expandedHeight: 400,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(PSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      const PSearchContainer(
                        text: 'Search In Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: PSizes.spaceBtwSections,
                      ),

                      // featured brands
                      PSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(
                        height: PSizes.spaceBtwItems / 2,
                      ),
                      Obx(() {
                        if (brands.isLoading.value) return const BrandShimmer();
                        if (brands.featuredBrands.isEmpty)
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
                            itemCount: brands.featuredBrands.length,
                            itemBuilder: (_, index) {
                              final brand = brands.featuredBrands[index];
                              return BrandCard(
                                  showBorder: false,
                                  brand: brand,
                                  onTap: () => Get.to(() => BrandProduct(
                                        brand: brand,
                                      )));
                            });
                      })
                    ],
                  ),
                ),
                // TABS
                bottom: PTabBar(
                    tabs: categories
                        .map((category) => Tab(
                              child: Text(category.name),
                            ))
                        .toList()),
              )
            ];
          },
          body: TabBarView(
            children: categories
                .map(
                  (category) => CategoryTab(
                    category: category,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
