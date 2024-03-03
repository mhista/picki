import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

// variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when page scrolls
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // jump to specifi dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // update current index & jump to next page
  void nextPage() {
    final storage = GetStorage();

    if (currentPageIndex.value == 2) {
      storage.write('isFirstTime', false);
      if (kDebugMode) {
        print(
            '---------------------------- GET STORAGE NEXT BUTTON ----------------------------');
        print(storage.read('isFirstTime'));
      }
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // update currrent index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
