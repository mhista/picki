import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/data/dummy_data/dummy_data.dart';
import 'package:pickafrika/data/repositories/categories/category_repositories.dart';
import 'package:pickafrika/data/repositories/category_relationship/product_category_repository.dart';
import 'package:pickafrika/features/shop/models/category_model.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';
import 'package:pickafrika/navigation_menu.dart';

import '../../../common/loaders/loaders.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/fullscreen_loader.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final _productCategoryRepository = Get.put(ProductCategoryRepository());

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

// LOAD CATEGORY DATA
  Future<void> fetchCategories() async {
    try {
      // SHOW SHIMMER WHILE LOADING CATEGORIES
      isLoading.value = true;

      // FETCH CATEGORIES FROM DATA SOURCE(FIRESTORE, API etc)
      final categories = await _categoryRepository.getAllCategories();
      // UPDATE THE CATEGORIES LIST
      allCategories.assignAll(categories);
      // FILTER FEATURED CATEGORIES
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      // SHOW GENERIC ERROR TO THE USER
      // PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

// LOAD SUBCATEGORIES FORF A SELECTED CATEGORY
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      // FETCH SUBCATEGORIES FROM DATA SOURCE(FIRESTORE, API etc)
      final categories = await _categoryRepository.getSubCategories(categoryId);
      return categories;
    } catch (e) {
      // SHOW GENERIC ERROR TO THE USER
      // PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // LOAD SELECTED CATEGORY DATA
  // LOAD CATEGORY DATA
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    try {
      final products = await _productCategoryRepository.getProductsForCategory(
          categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      // SHOW GENERIC ERROR TO THE USER
      return [];
    }
  }

  // GET CATEGORY OR SUB-CATEGORY PRODUCTS
  // UPLOAD CATEGORIES
  void uploadDummyData() async {
    try {
      PFullScreenLoader.openLoadingDialog('Processing.... ', PImages.cloud);
      // CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }
      // UPLOAD CATEGORIES TO FIRESTORE
      debugPrint('creating');
      await _categoryRepository.uploadDummeyData(DummyData.categories);
      // debugPrint('done');

      fetchCategories();
      PFullScreenLoader.stopLoading();
      PLoaders.successSnackBar(
          title: 'Upload successfull',
          message: 'Categories have been updated successfully');
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
