import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/common/widgets/shimmer/product_vertical_shimmer.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/products/sorting/sortable_products.dart';
import '../../controllers/product/all_product_controller.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: PAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace - 4),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductQuery(query),
              builder: (context, snapshot) {
                const loader = VerticalProductShimmer();
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loader;
                }
                if (snapshot.hasData ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No Data Found!'),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
// PRODUCTS AVAILABLE
                return SortableProducts(
                  products: snapshot.data!,
                );
              }),
        ),
      ),
    );
  }
}
