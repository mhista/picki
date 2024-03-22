import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/loaders/loaders.dart';
import 'package:pickafrika/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:pickafrika/features/personalization/controllers/address_controller.dart';
import 'package:pickafrika/features/shop/controllers/cart_controller.dart';
import 'package:pickafrika/features/shop/controllers/checkout_controller.dart';
import 'package:pickafrika/utils/constants/enums.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/popups/fullscreen_loader.dart';

import '../../../common/widgets/success_screen/success_screen1.dart';
import '../../../data/repositories/order_repository/order_repository.dart';
import '../../../navigation_menu.dart';
import '../models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  // FETCH USERS ORDER HISTORY
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      PLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void processOrder(double total) async {
    // START LOADER
    PFullScreenLoader.openLoadingDialog(
        'Processing your order', PImages.lottie1);
    // GET USER AUTH ID
    final userId = AuthenticationRepository.instance.authUser!.uid;
    if (userId.isEmpty) return;

    // ADD DETAILS
    final order = OrderModel(
        id: UniqueKey().toString(),
        status: OrderStatus.processing,
        userId: userId,
        totalAmount: total,
        orderDate: DateTime.now(),
        items: cartController.cartItems.toList(),
        address: addressController.selectedAddress.value,
        paymentMethod: checkoutController.selectedPaymentModel.value.name,
        deliveryDate: DateTime.now());
    // SAVE THE ORDER TO FIRESTORE
    await orderRepository.saveOrder(order, userId);
    // UPDATE CART STATUS
    cartController.clearCart();

    // SHOW SUCCESSS SCREEN

    () => Get.off(() => SuccessScreen1(
          image: PImages.orderSuccessful,
          title: 'Payment Successful',
          subtitle: 'Your product has been added for shipment. expect soon!',
          onPressed: () => Get.offAll(() => const NavigationMenu()),
        ));
  }
}
