import 'package:get/get.dart';
import 'package:pickafrika/data/dummy_data/dummy_data.dart';
import 'package:pickafrika/data/repositories/banners/banner_repository.dart';
import 'package:pickafrika/features/shop/models/banner_model.dart';

import '../../../common/loaders/loaders.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/fullscreen_loader.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

// carousel index
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final bannerRepo = Get.put(BannerRepository());

// THE BANNER MODEL
  RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    getBanners();
    super.onInit();
  }

// UPDATE THE CURRENT INDEX
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  // LOAD CATEGORY DATA
  void getBanners() async {
    try {
      // SHOW LOADER WHILE LOADING CATEGORIES
      isLoading.value = true;

      // FETCH THE BANNERS FROM THE DATABASE
      final banners = await bannerRepo.getAllBanners();

      // ASSIGN TO THE BANNERS LIST
      this.banners.assignAll(banners);
    } catch (e) {
      PFullScreenLoader.stopLoading();

      // SHOW GENERIC ERROR TO THE USER
      PLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void uploadDummyData() async {
    try {
      PFullScreenLoader.openLoadingDialog('Processing.... ', PImages.lottie1);
      // CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }
      // UPLOAD CATEGORIES TO FIRESTORE

      await bannerRepo.uploadDummeyData(DummyData.banners);
      getBanners();
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
