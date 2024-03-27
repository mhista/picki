import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/shimmer/product_vertical_shimmer.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../common/widgets/layouts/gid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../controllers/product/product_controller.dart';
import '../all_products/all_products.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/home_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    // final cartController = Get.put(CartController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER
            const Column(
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
                  height: PSizes.spaceBtwItems,
                ),
              ],
            ),
            // BODY PART
            Padding(
              padding: const EdgeInsets.all(PSizes.buttonWidth),
              child: Column(
                children: [
                  const PPromoSlider(),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),

                  // CATEGORIES PART
                  Column(
                    children: [
                      PSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: true,
                        onPressed: () {},
                        // textColor: PColors.white,
                      ),
                      const SizedBox(
                        height: PSizes.spaceBtwItems,
                      ),
                      const PHomeCategories()
                    ],
                  ),
                  const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  // Popular Products

                  // HEADING SECTION
                  // POPULAR PRODUCTS
                  Column(
                    children: [
                      PSectionHeading(
                        title: 'Popular Products',
                        onPressed: () => Get.to(() => AllProducts(
                              title: 'Popular Products',
                              // query: FirebaseFirestore.instance
                              //     .collection('Products')
                              //     .where('isFeatured', isEqualTo: true)
                              //     .limit(6),
                              futureMethod:
                                  controller.fetchAllFeaturedProducts(),
                            )),
                      ),
                      const SizedBox(
                        height: PSizes.spaceBtwItems,
                      ),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const VerticalProductShimmer();
                        }
                        if (controller.featuredProducts.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found!',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        } else {
                          return PGridLayout(
                            itemCount: controller.featuredProducts.length,
                            itemBuilder: (_, index) => PProductCardVertical(
                              product: controller.featuredProducts[index],
                            ),
                          );
                        }
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: PSizes.defaultSpace,
                  ),
                  // RECOMMENDED PRODUCTS
                  Column(
                    children: [
                      const PPromoSlider(),
                      const SizedBox(
                        height: PSizes.spaceBtwItems,
                      ),
                      PSectionHeading(
                        title: 'Recommended',
                        onPressed: () => Get.to(() => AllProducts(
                              title: 'Recommended',
                              // query: FirebaseFirestore.instance
                              //     .collection('Products')
                              //     .where('isFeatured', isEqualTo: true)
                              //     .limit(6),
                              futureMethod:
                                  controller.fetchAllRecommendedProducts(),
                            )),
                      ),
                      const SizedBox(
                        height: PSizes.spaceBtwItems / 2,
                      ),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const VerticalProductShimmer();
                        }
                        if (controller.recommendedProducts.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found!',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        } else {
                          return PGridLayout(
                            itemCount: controller.recommendedProducts.length,
                            itemBuilder: (_, index) => PProductCardVertical(
                              product: controller.recommendedProducts[index],
                            ),
                          );
                        }
                      }),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// (_, index) => const PProductCardVertical()