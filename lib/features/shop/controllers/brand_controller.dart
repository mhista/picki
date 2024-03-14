import 'package:get/get.dart';
import 'package:pickafrika/data/dummy_data/brand_dummy_data.dart';
import 'package:pickafrika/data/repositories/brands/brand_repository.dart';
import 'package:pickafrika/data/repositories/category_relationship/brand_category_repository.dart';
import 'package:pickafrika/data/repositories/products/product_repository.dart';
import 'package:pickafrika/features/shop/models/brand_model.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';

import '../../../common/loaders/loaders.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/fullscreen_loader.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();
  final isLoading = false.obs;
  final _brandRepository = Get.put(BrandRepository());
  final _brandCategoryRepository = Get.put(BrandCategoryRepository());

  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  RxList<BrandModel> allBrands = <BrandModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedBrands();
    super.onInit();
  }

  Future<void> fetchFeaturedBrands() async {
    try {
      // SHOW SHIMMER WHILE LOADING CATEGORIES
      isLoading.value = true;

      // FETCH CATEGORIES FROM DATA SOURCE(FIRESTORE, API etc)
      final brands = await _brandRepository.getAllBrands();
      // UPDATE THE CATEGORIES LIST
      allBrands.assignAll(brands);
      // FILTER FEATURED CATEGORIES
      featuredBrands.assignAll(allBrands
          .where((brand) => brand.isFeatured ?? false)
          .take(4)
          .toList());
    } catch (e) {
      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

// GET BRAND FOR CATEGORIES
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final products =
          await _brandCategoryRepository.getBrandsForCategory(categoryId);
      return products;
    } catch (e) {
      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // GET BRAND SPECIFIC PRODUCTS
  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsByBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void createBrand() async {
    try {
      PFullScreenLoader.openLoadingDialog('Processing.... ', PImages.lottie1);
      // CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }
      await _brandRepository.uploadData(BrandDummyData.brandModels);
      fetchFeaturedBrands();
      PFullScreenLoader.stopLoading();
      PLoaders.successSnackBar(
          title: 'Upload successfull!', message: 'Your Brand have been saved');
      Get.off(() => const NavigationMenu());
    } catch (e) {
      PFullScreenLoader.stopLoading();

      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
