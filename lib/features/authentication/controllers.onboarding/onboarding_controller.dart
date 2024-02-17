import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Update Current Index when page scrolls
  void updatePageIndicator(index) {}

  // jump to specifi dot selected page
  void dotNavigationClick(index) {}

  // update current index & jump to next page
  void nextPage() {}

  // update currrent index & jump to the last page
  void skipPage() {}
}
