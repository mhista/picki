import 'package:get/get.dart';
import 'package:pickafrika/data/repositories/categories/category_repositories.dart';
import 'package:pickafrika/features/shop/models/category_model.dart';

import '../../../common/loaders/loaders.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/device/network_manager.dart';
import '../../../utils/popups/fullscreen_loader.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

// LOAD CATEGORY DATA
  void fetchCategories() async {
    try {
      // SHOW LOADER WHILE LOADING CATEGORIES
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
      PFullScreenLoader.stopLoading();

      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // LOAD SELECTED CATEGORY DATA

  // GET CATEGORY OR SUB-CATEGORY PRODUCTS
  // UPLOAD CATEGORIES
  void uploadCategories() async {
    try {
      PFullScreenLoader.openLoadingDialog('Processing.... ', PImages.lottie1);
      // CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }
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
      PFullScreenLoader.stopLoading();

      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
