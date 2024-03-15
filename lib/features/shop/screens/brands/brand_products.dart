import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/brands/brand_cards.dart';
import 'package:pickafrika/common/widgets/products/sorting/sortable_products.dart';
import 'package:pickafrika/features/shop/controllers/brand_controller.dart';
import 'package:pickafrika/features/shop/models/brand_model.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appBar.dart';
import '../../../../common/widgets/shimmer/product_vertical_shimmer.dart';
import '../../../../utils/helpers/cloud_helper_function.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key, required this.brand});

  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: PAppBar(
        title: Text(
          brand.name,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace - 4),
          child: Column(children: [
            // BRAND DETAILS
            if (brand.productsCount! > 0)
              BrandCard(
                showBorder: true,
                brand: brand,
              ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),
            FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  const loader = VerticalProductShimmer();
                  final widget = KCloudHelperFunction.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;
                  // PRODUCTS AVAILABLE
                  return SortableProducts(
                    products: snapshot.data!,
                  );
                })
          ]),
        ),
      ),
    );
  }
}
