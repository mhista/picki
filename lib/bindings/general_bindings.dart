import 'package:get/get.dart';
import 'package:pickafrika/features/personalization/controllers/address_controller.dart';
import 'package:pickafrika/features/shop/controllers/checkout_controller.dart';
import 'package:pickafrika/features/shop/controllers/product/favourite_controller.dart';
import 'package:pickafrika/features/shop/controllers/product/variation_controller.dart';
import 'package:pickafrika/utils/helpers/network_manager.dart';

class GeneralBindiings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(FavouritesController());
    Get.put(CheckoutController());
    Get.put(AddressController());
  }
}
