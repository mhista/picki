import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/layouts/gid_layout.dart';
import 'package:pickafrika/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:pickafrika/common/widgets/shimmer/product_vertical_shimmer.dart';
import 'package:pickafrika/features/shop/controllers/category_controller.dart';
import 'package:pickafrika/features/shop/models/category_model.dart';
import 'package:pickafrika/features/shop/screens/all_products/all_products.dart';
import 'package:pickafrika/features/shop/screens/store/widgets/category_brands.dart';
import 'package:pickafrika/utils/helpers/cloud_helper_function.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace),
          child: Column(
            children: [
              // BRANDS
              CategoryBrands(category: category),
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    final response = KCloudHelperFunction.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: const VerticalProductShimmer());
                    if (response != null) return response;
                    final product = snapshot.data!;
                    return Column(
                      children: [
                        PSectionHeading(
                          title: 'You Might Like',
                          onPressed: () => Get.to(AllProducts(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(
                                categoryId: category.id, limit: -1),
                          )),
                        ),
                        const SizedBox(
                          height: PSizes.spaceBtwItems,
                        ),
                        PGridLayout(
                            itemCount: 4,
                            itemBuilder: (_, index) => PProductCardVertical(
                                  product: product[index],
                                )),
                        const SizedBox(
                          height: PSizes.spaceBtwSections,
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
