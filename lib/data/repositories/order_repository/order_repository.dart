import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pickafrika/data/repositories/authentication_repository/authentication_repository.dart';

import '../../../features/shop/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  // /FIREBASE INSTANCE
  final _db = FirebaseFirestore.instance;

  // GET ALL ORDER RELATED TO CURRENT ORDER
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes';
      }
      final result =
          await _db.collection('User').doc(userId).collection('Orders').get();
      return result.docs.map((e) => OrderModel.fromSnapshot(e)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching Order informmation. Try again later';
    }
  }

  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toMap());
    } catch (e) {
      throw 'Something went wrong while Saving Order informmation. Try again later';
    }
  }
}
