import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/loaders/loaders.dart';
import 'package:pickafrika/data/repositories/address_repository/address_repository.dart';
import 'package:pickafrika/features/personalization/models/address_model.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/helpers/network_manager.dart';
import 'package:pickafrika/utils/popups/fullscreen_loader.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final _addressRepository = Get.put(AddressRepository());

  // CONTROLLERS
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  // FORM KEY
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  // REFRESH DATA
  RxBool refreshData = true.obs;

  Future<void> createAddress() async {
    try {
      // START LOADING
      PFullScreenLoader.openLoadingDialog(
          'Storing Address.....', PImages.lottie1);
      // CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        PFullScreenLoader.stopLoading();
        return;
      }
      // FORM VALIDATION
      if (!addressFormKey.currentState!.validate()) {
        PFullScreenLoader.stopLoading();
        return;
      }

      final addressModel = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim());
      final id = await _addressRepository.createUserAddress(addressModel);

      //  UPDATE SELECTED ADDRESS STATUS
      addressModel.id = id;
      await selectAddress(addressModel);

      // STOP THE FULL SCREEN LOADER
      PFullScreenLoader.stopLoading();
      // SHOW SUCCESS MESSAGE
      PLoaders.successSnackBar(
          title: "Address added", message: 'Your address has been saved!!');

      // REFRESH ADDRESSES DATA
      refreshData.toggle();

      // RESET FIELD
      resetFormFields();

      // GO BACK
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // SHOW ERROR MESSAGE
      PFullScreenLoader.stopLoading();

      PLoaders.errorSnackBar(title: "Ooops!", message: e.toString());
    }
  }

  // FETCH ALL USER SPECIFIC ADDRESSES
  Future<List<AddressModel>> allUserAddress() async {
    try {
      final addresses = await _addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      PLoaders.errorSnackBar(title: 'Address Not Found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
          title: '',
          onWillPop: () async {
            return false;
          },
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: const CircularProgressIndicator.adaptive());
      // clear the selected field
      if (selectedAddress.value.id.isNotEmpty) {
        await _addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }
      // assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // set the selected field to true for the newly selected address
      await _addressRepository.updateSelectedField(
          selectedAddress.value.id, true);
      Get.back();
    } catch (e) {
      PLoaders.errorSnackBar(title: 'Address Not Found', message: e.toString());
    }
  }

  // Function to reset form field
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
