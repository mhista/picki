import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/data/services/firebase_services/firebase_storage_services.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

// VARIABLES
  final selectedProductImage = ''.obs;
  // final isLoading = false.obs;

// GET ALL IMAGES FROM PRODUCT AND VARIATIONS
  List<String> getAllProductImage(ProductModel product) {
    // USE SET TO ADD UNIQUE URL
    Set<String> images = {};

// LOAD THUMBNAIL IMAGE
    images.add(product.thumbnail);
// ASSIGN THUMBNAIL AS SELECTED IMAGE
    selectedProductImage.value = product.thumbnail;

    // GET ALL IMAGES FROM THE PRODUCT IMAGES
    if (product.images != null && product.images!.isNotEmpty) {
      images.addAll(product.images!);
    }

    // GET ALL IMAGES FROM PRODUCT VARIATIONS IF NOT NULL
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image!));
    }

    // LIST OF IMAGAE
    return images.toList();
  }

  Future<ProductModel> uploadProductImages(
      ProductModel product, PFirebaseStorageServices storage) async {
    // GET IMAGEDATA LINK FROM THE LOCAL ASSETS;
    final assetImage = await storage.getImageDataFromAssets(product.thumbnail);

    // upload image and get its url
    final url = await storage.uploadImageData(
        'Products/Images', assetImage, product.thumbnail.toString());
    // Assign url to product.image attribute
    product.thumbnail = url;

    // PRODUCT LIST OF IMAGES
    if (product.images != null || product.images!.isNotEmpty) {
      List<String> imagesUrl = [];
      for (var image in product.images!) {
        // GET IMAGEDATA LINK FROM THE LOCAL ASSETS;
        final assetImage = await storage.getImageDataFromAssets(image);

        // upload image and get its url
        final url =
            await storage.uploadImageData('Products/Images', assetImage, image);
        imagesUrl.add(url);
      }
      product.images!.clear();
      product.images!.addAll(imagesUrl);
    }

    // GET ALL IMAGES FROM PRODUCT VARIATIONS IF NOT NULL
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      for (var variation in product.productVariations!) {
        // GET IMAGEDATA LINK FROM THE LOCAL ASSETS;
        final assetImage =
            await storage.getImageDataFromAssets(variation.image!);

        // upload image and get its url
        final url = await storage.uploadImageData(
            'Products/Images', assetImage, variation.image!);
        variation.image = url;
      }
    }

    // UPLOAD PROUCT BRAND IMAGE
    if (product.brand!.image.isNotEmpty) {
      // GET IMAGEDATA LINK FROM THE LOCAL ASSETS;
      final assetImage =
          await storage.getImageDataFromAssets(product.brand!.image);

      // upload image and get its url
      final url = await storage.uploadImageData(
          'Products/Images', assetImage, product.brand!.image);
      product.brand!.image = url;
    }
    // LIST OF IMAGAE
    debugPrint(product.toString());
    return product;
  }

  // SHOW IMAGE POPUP
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: PSizes.defaultSpace * 2,
                  horizontal: PSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Close'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
