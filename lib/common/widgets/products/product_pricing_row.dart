import 'package:flutter/material.dart';

import '../../../features/shop/controllers/product/product_controller.dart';
import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../texts/product_price_text.dart';
import 'product_cards/add_to_cart_container.dart';

class PricingRow extends StatelessWidget {
  const PricingRow({
    super.key,
    required this.product,
    required this.controller,
    this.isRow = false,
  });

  final ProductModel product;
  final ProductController controller;
  final bool isRow;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // PRICE
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: !isRow
                ? [
                    if (product.productType == ProductType.single.name &&
                        product.salePrice! > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: PSizes.sm),
                        child: Text(
                          product.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(decoration: TextDecoration.lineThrough),
                        ),
                      ),
                    // PRICE, SHOW SALE PRICE AS MAIN PRICE IF SALE EXIST
                    Padding(
                      padding: const EdgeInsets.only(left: PSizes.sm),
                      child: ProductPriceText(
                        price: controller.getProductPrice(product),
                      ),
                    ),
                  ]
                : [
                    ProductPriceText(
                      price: controller.getProductPrice(product),
                    ),
                  ],
          ),
        ),
        // ADD TO CAT BUTTON
        AddToCartContainer(
          product: product,
        )
      ],
    );
  }
}
