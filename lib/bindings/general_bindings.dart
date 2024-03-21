import 'package:get/get.dart';
import 'package:pickafrika/features/shop/controllers/product/variation_controller.dart';
import 'package:pickafrika/utils/helpers/network_manager.dart';

class GeneralBindiings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}
