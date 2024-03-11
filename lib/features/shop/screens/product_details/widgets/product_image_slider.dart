import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:pickafrika/features/shop/controllers/product/image_controller.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';

import '../../../../../common/widgets/appbar/appBar.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/edge_rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImage(product);
    final isDark = PHelperFunctions.isDarkMode(context);
    return PCurvedEdgesWidget(
      child: Container(
        color: isDark ? PColors.darkerGrey : PColors.light,
        child: Stack(
          children: [
            // MAIN LARGE IMAGE
            SizedBox(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.all(PSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, progress) =>
                            CircularProgressIndicator(
                          value: progress.progress,
                          color: PColors.primary,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            //  IMAGE SLIDER
            Positioned(
              right: 0,
              left: PSizes.spaceBtwSections,
              bottom: 30,
              child: SizedBox(
                height: 75,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return PRoundedImage(
                      isNetworkImage: true,
                      fit: BoxFit.contain,
                      padding: const EdgeInsets.all(PSizes.sm),
                      border: Border.all(
                        color: imageSelected
                            ? PColors.primary
                            : Colors.transparent,
                      ),
                      width: 75,
                      backgroundColor: isDark ? PColors.dark : PColors.white,
                      imageUrl: images[index],
                      onPressed: () =>
                          controller.selectedProductImage.value = images[index],
                    );
                  }),
                  separatorBuilder: (_, __) => const SizedBox(),
                ),
              ),
            ),
            // APPBAR ICONS
            const PAppBar(
              showBackArrow: true,
              actions: [
                PCircularIcon(
                  icon: Iconsax.heart5,
                  color: PColors.error,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
