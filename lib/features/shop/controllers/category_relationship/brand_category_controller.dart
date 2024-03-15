import 'package:get/get.dart';
import 'package:pickafrika/data/dummy_data/brand_category_dummy_data.dart';
import 'package:pickafrika/data/repositories/category_relationship/brand_category_repository.dart';

import '../../../../common/loaders/loaders.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/fullscreen_loader.dart';

class BrandCategoryController extends GetxController {
  static BrandCategoryController get instance => Get.find();

  final _brandCategoryRepository = Get.put(BrandCategoryRepository());
  // UPLOAD CATEGORIES
  void uploadData() async {
    try {
      PFullScreenLoader.openLoadingDialog('Processing.... ', PImages.lottie1);
      // CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }
      // UPLOAD CATEGORY BRAND RELATIONSHIP TO FIRESTORE

      await _brandCategoryRepository
          .createBrandCategory(BrandCategoryDummyData.brandCategories);
      PFullScreenLoader.stopLoading();
      PLoaders.successSnackBar(
          title: 'Upload successfull', message: 'Proceed to continue');
      Get.off(() => const NavigationMenu());
    } catch (e) {
      PFullScreenLoader.stopLoading();

      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
