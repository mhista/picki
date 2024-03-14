import 'package:flutter/material.dart';
import '../../../../../common/widgets/shimmer/boxed_shimmer.dart';
import 'package:pickafrika/features/shop/controllers/brand_controller.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/cloud_helper_function.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/shimmer/list_tile_shimmer.dart';
import '../../../models/category_model.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              ListTileShimmer(),
              SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              BoxesShimmer(),
              SizedBox(
                height: PSizes.spaceBtwItems,
              )
            ],
          );
          final widget = KCloudHelperFunction.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;
          final brands = snapshot.data!;
          return ListView.builder(
              itemCount: brands.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                final brand = brands[index];
                return FutureBuilder(
                    future: controller.getBrandProducts(
                        brandId: brand.id, limit: 3),
                    builder: (context, snapshot) {
                      final widget = KCloudHelperFunction.checkMultiRecordState(
                          snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;
                      final products = snapshot.data!;
                      return BrandShowcase(
                        images: products.map((e) => e.thumbnail).toList(),
                        brand: brand,
                      );
                    });
              });
        });
  }
}
