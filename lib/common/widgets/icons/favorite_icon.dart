import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/shop/controllers/product/favourite_controller.dart';
import '../../../utils/constants/colors.dart';
import 'circular_icon.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    this.top,
    this.right,
    this.left,
    this.bottom,
    this.backgrondColor,
    required this.productId,
  });
  final double? top, right, left, bottom;
  final Color? backgrondColor;
  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Obx(() {
        return PCircularIcon(
          color: controller.isFavorite(productId) ? PColors.error : null,
          onPressed: () => controller.toggleFavoriteProducts(productId),
          icon:
              controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,

          // color: PColors.error,
        );
      }),
    );
  }
}
