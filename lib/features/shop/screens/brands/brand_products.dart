import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/brands/brand_cards.dart';
import 'package:pickafrika/common/widgets/products/sorting/sortable_products.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appBar.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PAppBar(
        title: Text(
          'Nike',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(PSizes.defaultSpace - 4),
          child: Column(children: [
            // BRAND DETAILS
            BrandCard(showBorder: true),
            SizedBox(
              height: PSizes.spaceBtwSections,
            ),
            SortableProducts()
          ]),
        ),
      ),
    );
  }
}
