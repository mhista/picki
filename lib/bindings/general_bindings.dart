import 'package:get/get.dart';
import 'package:pickafrika/utils/helpers/network_manager.dart';

class GeneralBindiings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
