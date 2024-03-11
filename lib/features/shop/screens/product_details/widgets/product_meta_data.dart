import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/images/circular_images.dart';
import 'package:pickafrika/common/widgets/texts/brand_text_title_with_icon.dart';
import 'package:pickafrika/common/widgets/texts/product_price_text.dart';
import 'package:pickafrika/common/widgets/texts/product_title_text.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';
import 'package:pickafrika/utils/constants/enums.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/product_controller.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salesPercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // PRICE AND SALE PRICE
        Row(
          children: [
            PRoundedContainer(
              radius: PSizes.sm,
              backgroundColor: PColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: PSizes.sm, vertical: PSizes.xs),
              child: Text(
                '- $salesPercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: PColors.black),
              ),
            ),
            const SizedBox(
              width: PSizes.spaceBtwItems / 2,
            ),
            // PRICE
            if (product.productType == ProductType.single.name &&
                product.salePrice! > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.name &&
                product.salePrice! > 0)
              const SizedBox(
                width: PSizes.spaceBtwItems / 2,
              ),
            ProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 1.5,
        ),

        // TITLE
        ProductTitleText(
          title: product.title,
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 1.5,
        ),

        // STOCK STATUS
        Row(
          children: [
            const ProductTitleText(title: 'Status:'),
            const SizedBox(
              width: PSizes.spaceBtwItems / 1.5,
            ),
            Text(controller.getStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium!),
          ],
        ),
        const SizedBox(
          height: PSizes.spaceBtwItems / 1.5,
        ),
        // BRAND
        Row(
          children: [
            PCircularImage(
              imageUrl: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overLayColor: isDark ? PColors.white : PColors.dark,
            ),
            Flexible(
              child: BrandTitleTextWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSize: TextSizes.medium,
              ),
            ),
          ],
        )
      ],
    );
  }
}
