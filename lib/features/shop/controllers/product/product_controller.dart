import 'package:get/get.dart';
import 'package:pickafrika/data/dummy_data/product_dummy_data.dart';
import 'package:pickafrika/data/repositories/products/product_repository.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';
import 'package:pickafrika/utils/constants/enums.dart';

import '../../../../common/loaders/loaders.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/fullscreen_loader.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;

  RxList<ProductModel> productModels = <ProductModel>[].obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  RxList<ProductModel> recommendedProducts = <ProductModel>[].obs;

  final _productRepository = Get.put(ProductRepository());

  @override
  void onInit() {
    fetchFeaturedProducts();
    fetchRecommendedProducts();
    super.onInit();
  }

// FETCH LIMITED FUTURE PRODUCTS
  void fetchFeaturedProducts() async {
    try {
      // SHOW SHIMMER WHILE LOADING CATEGORIES
      isLoading.value = true;
      // FETCH PRODUCTS FROM THE DATABASE
      final products = await _productRepository.getFeaturedProducts();
      // ASSIGN THEM TO THE LIST
      featuredProducts.assignAll(products);
    } catch (e) {
      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

// FETCH ALL FEATURED PRODUCTS
  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // FETCH PRODUCTS FROM THE DATABASE
      final products = await _productRepository.getAllFeaturedProducts();
      return products;
    } catch (e) {
      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

// FETCH LIMITED FUTURE PRODUCTS
  void fetchRecommendedProducts() async {
    try {
      // SHOW SHIMMER WHILE LOADING CATEGORIES
      isLoading.value = true;
      // FETCH PRODUCTS FROM THE DATABASE
      final products = await _productRepository.getRecommendedProducts();
      // ASSIGN THEM TO THE LIST
      recommendedProducts.assignAll(products);
    } catch (e) {
      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

// FETCH ALL RECOMMENDED PRODUCTS
  Future<List<ProductModel>> fetchAllRecommendedProducts() async {
    try {
      // FETCH PRODUCTS FROM THE DATABASE
      final products = await _productRepository.getAllRecommendedProducts();
      return products;
    } catch (e) {
      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // UPLOAD DUMMY PRODUCTS
  void uploadDummyData() async {
    try {
      PFullScreenLoader.openLoadingDialog('Processing.... ', PImages.cloud);
      // CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }
      // UPLOAD PRODUCTS TO FIRESTORE

      await _productRepository.uploadDummeyData(ProductDummyData.products);
      PFullScreenLoader.stopLoading();
      fetchFeaturedProducts();
      PLoaders.successSnackBar(
          title: 'Upload successfull',
          message: '  Products have been updated successfully');
      Get.off(() => const NavigationMenu());
    } catch (e) {
      PFullScreenLoader.stopLoading();

      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // IF NO VARIATION, RETURN THE SINGLE PRICE OR SALE PRICE
    if (product.productType == ProductType.single.name) {
      return (product.salePrice! > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // CALCULATE THE SMALLEST AND LARGEST PRICES AMONG VARIATIONS
      for (var variation in product.productVariations!) {
        double priceToConsider = variation.salePrice! > 0.0
            ? variation.salePrice!
            : variation.price!;
        // UPDATE THE SMALLEST AND LARGEST PRICES
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      // IF SMALLEST AND LARGEST PRICES ARE THE SAME, RETURN A SINGLE PRICE
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        // RETURN A PRICE RANGE
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

// CALCULATE THE DISCOUNT PERCENTAGE
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

// CHECK IF PRODUCT IS IN STOCK
  String getStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
