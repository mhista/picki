import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:pickafrika/data/repositories/authentication_repository/authentication_repository.dart';

import '../../../features/personalization/models/address_model.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

// FETCH THE USERS ADDRESS
  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in five minutes.';
      }
      final result = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .get();
      return result.docs
          .map((documentSnapshot) =>
              AddressModel.fromDocumentSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong while fetching Addres Information. Try again later';
    }
  }

// UPDATE THE SELECTED ADDRESS FIELD
  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in five minutes.';
      }
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .update({'selectedAddress': selected});
    } catch (e) {
      throw 'Unable to update your address selection. Try again later';
    }
  }

// CERATE A USER ADDRESS
  Future<String> createUserAddress(AddressModel addressModel) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in five minutes.';
      }
      final currentAddress = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .add(addressModel.toMap());
      return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong while saving the address information. Try again later';
    }
  }
}
