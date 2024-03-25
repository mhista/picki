import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/loaders/animation_loader.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/common/widgets/icons/circular_icon.dart';
import 'package:pickafrika/common/widgets/layouts/gid_layout.dart';
import 'package:pickafrika/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:pickafrika/common/widgets/shimmer/product_vertical_shimmer.dart';
import 'package:pickafrika/features/shop/controllers/product/favourite_controller.dart';
import 'package:pickafrika/features/shop/screens/home/home.dart';
import 'package:pickafrika/navigation_menu.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/cloud_helper_function.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
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
              Obx(() {
                return FutureBuilder(
                    future: controller.favoriteProducts(),
                    builder: (context, snapshot) {
                      final emptyWidget = AnimationLoaderWidget(
                        text: 'Whoops! Your wishlist is empty!',
                        animation: PImages.whops,
                        showAction: true,
                        actionText: 'Let\'s add some',
                        onActionPressed: () =>
                            Get.off(() => const NavigationMenu()),
                      );
                      const loader = VerticalProductShimmer(
                        itemCount: 6,
                      );
                      final widget = KCloudHelperFunction.checkMultiRecordState(
                          loader: loader,
                          noDataFound: emptyWidget,
                          snapshot: snapshot);
                      if (widget != null) return widget;
                      final products = snapshot.data!;
                      return PGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => PProductCardVertical(
                                product: products[index],
                              ));
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
