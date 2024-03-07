import 'package:get/get.dart';
import 'package:pickafrika/data/repositories/banners/banner_repository.dart';
import 'package:pickafrika/features/shop/models/banner_model.dart';

import '../../../common/loaders/loaders.dart';
import '../../../utils/popups/fullscreen_loader.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

// carousel index
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;

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
      final bannerRepo = Get.put(BannerRepository());
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
}
