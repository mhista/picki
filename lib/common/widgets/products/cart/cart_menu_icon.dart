import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/features/shop/controllers/cart_controller.dart';
import 'package:pickafrika/features/shop/screens/cart/cart.dart';

import '../../../../utils/constants/colors.dart';

class PCartCounterIcon extends StatelessWidget {
  const PCartCounterIcon({super.key, required this.iconColor});
  // final VoidCallback onPressed;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 3,
          top: 5,
          child: Badge(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            backgroundColor: PColors.dark.withOpacity(0.8),
            textColor: PColors.white,
            label: Obx(() {
              return Text(
                controller.noOfCartItems.value.toString(),
                style: const TextStyle(fontSize: 10),
              );
            }),
          ),
        )
      ],
    );
  }
}
