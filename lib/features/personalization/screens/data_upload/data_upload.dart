import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/common/widgets/list_tiles/settings_menu_tiles.dart';
import 'package:pickafrika/common/widgets/texts/section_heading.dart';
import 'package:pickafrika/features/shop/controllers/banner_controllers.dart';
import 'package:pickafrika/features/shop/controllers/category_controller.dart';
import 'package:pickafrika/features/shop/controllers/product/product_controller.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance;
    final banners = BannerController.instance;
    final products = ProductController.instance;

    return Scaffold(
      appBar: const PAppBar(
        title: Text('Upload Data'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PSizes.defaultSpace - 8),
          child: Column(
            children: [
              // UPLOAD STORE RELATED DATA
              const PSectionHeading(
                title: 'Main Record',
                showActionButton: false,
              ),
              PSettingsMenuTile(
                addSpacing: true,
                icon: Iconsax.category,
                title: 'Upload Category',
                addSubtitle: false,
                trailing: IconButton(
                    onPressed: () => categories.uploadDummyData(),
                    icon: const Icon(Icons.arrow_circle_up)),
              ),
              PSettingsMenuTile(
                addSpacing: true,
                icon: Iconsax.shop,
                title: 'Upload Brand',
                addSubtitle: false,
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_circle_up)),
              ),
              PSettingsMenuTile(
                addSpacing: true,
                icon: Iconsax.shopping_cart,
                title: 'Upload Products',
                addSubtitle: false,
                trailing: IconButton(
                    onPressed: () => products.uploadDummyData(),
                    icon: const Icon(Icons.arrow_circle_up)),
              ),
              PSettingsMenuTile(
                addSpacing: true,
                icon: Iconsax.cloud_add,
                title: 'Upload Banners',
                addSubtitle: false,
                trailing: IconButton(
                    onPressed: () => banners.uploadDummyData(),
                    icon: const Icon(Icons.arrow_circle_up)),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Relationships',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Make sure all related uploads for above contents have been uploaded',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              const SizedBox(
                height: PSizes.spaceBtwItems,
              ),
              PSettingsMenuTile(
                addSpacing: true,
                icon: Iconsax.repeat,
                title: 'Upload Brands & Categories Relational Data',
                addSubtitle: false,
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_circle_up)),
              ),
              PSettingsMenuTile(
                addSpacing: true,
                icon: Iconsax.repeat,
                title: 'Upload Product Categories Relational Data',
                addSubtitle: false,
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_circle_up)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
