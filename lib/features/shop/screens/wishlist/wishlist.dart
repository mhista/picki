import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/common/widgets/icons/circular_icon.dart';
import 'package:pickafrika/common/widgets/layouts/gid_layout.dart';
import 'package:pickafrika/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:pickafrika/features/shop/screens/home/home.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PAppBar(
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          PCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(() => const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.spaceBtwSections),
          child: Column(
            children: [
              PGridLayout(
                  itemCount: 6,
                  itemBuilder: (_, index) => const PProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
