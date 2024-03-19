import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/common/widgets/images/edge_rounded_images.dart';
import 'package:pickafrika/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:pickafrika/common/widgets/shimmer/product_horizontal_shimmer.dart';
import 'package:pickafrika/common/widgets/shimmer/product_vertical_shimmer.dart';
import 'package:pickafrika/common/widgets/texts/section_heading.dart';
import 'package:pickafrika/features/shop/controllers/category_controller.dart';
import 'package:pickafrika/features/shop/models/category_model.dart';
import 'package:pickafrika/features/shop/screens/all_products/all_products.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/cloud_helper_function.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: PAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.spaceBtwSections),
          child: Column(
            children: [
              // BANNER
              const PRoundedImage(
                // isNetworkImage: true,
                imageUrl: PImages.promoBanner3,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              // SUB-CATEGORIES
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    const loader = HorizontalCardShimmer();
                    final widget = KCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: subCategories.length,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          final subCategory = subCategories[index];
                          return FutureBuilder(
                              future: controller.getCategoryProducts(
                                  categoryId: subCategory.id, limit: 4),
                              builder: (context, snapshot) {
                                const loader = HorizontalCardShimmer();
                                final widget =
                                    KCloudHelperFunction.checkMultiRecordState(
                                        snapshot: snapshot,
                                        loader: loader,
                                        noDataFound: const Text(''));
                                if (widget != null) return widget;
                                final products = snapshot.data!;
                                return Column(
                                  children: [
                                    // HEADING
                                    PSectionHeading(
                                      title: subCategory.name,
                                      onPressed: () => Get.to(() => AllProducts(
                                            title: category.name,
                                            futureMethod:
                                                controller.getCategoryProducts(
                                                    categoryId: subCategory.id,
                                                    limit: -1),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: PSizes.spaceBtwItems / 2,
                                    ),
                                    SizedBox(
                                      height: 120,
                                      child: ListView.separated(
                                        itemCount: products.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            PProductCardHorizontal(
                                          product: products[index],
                                        ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                          width: PSizes.spaceBtwItems,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              });
                        });
                    //   separatorBuilder: (BuildContext context, int index) =>
                    //       const SizedBox(),
                    // );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
