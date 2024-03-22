import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pickafrika/features/personalization/models/address_model.dart';
import 'package:pickafrika/utils/constants/enums.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import 'cart_item_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;
  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.address,
    this.deliveryDate,
    required this.items,
  });

  String get formattedOrderDate => PHelperFunctions.getFormattedDate(orderDate);
  String get formattedDeliveryOrderDate => deliveryDate != null
      ? PHelperFunctions.getFormattedDate(deliveryDate!)
      : '';
  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'userId': userId});
    result.addAll({'status': status.name});
    result.addAll({'totalAmount': totalAmount});
    result.addAll({'orderDate': orderDate.millisecondsSinceEpoch});
    result.addAll({'paymentMethod': paymentMethod});
    address != null
        ? result.addAll({'address': address!.toMap()})
        : AddressModel.empty();
    deliveryDate != null
        ? result.addAll({'deliveryDate': deliveryDate!.millisecondsSinceEpoch})
        : '';
    result.addAll({'items': items.map((x) => x.toMap()).toList()});

    return result;
  }

  factory OrderModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final map = document.data()!;
    return OrderModel(
      id: document.id,
      userId: map['userId'] ?? '',
      status: OrderStatus.values
          .firstWhere((element) => element.name == map['status']),
      totalAmount: map['totalAmount']?.toDouble() ?? 0.0,
      orderDate: DateTime.fromMillisecondsSinceEpoch(map['orderDate']),
      paymentMethod: map['paymentMethod'] ?? '',
      address:
          map['address'] != null ? AddressModel.fromMap(map['address']) : null,
      deliveryDate: map['deliveryDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['deliveryDate'])
          : null,
      items: List<CartItemModel>.from(
          map['items']?.map((x) => CartItemModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromSnapshot(json.decode(source));
}
