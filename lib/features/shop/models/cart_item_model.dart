import 'dart:convert';

// import 'package:flutter/foundation.dart';

class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;
  CartItemModel({
    required this.productId,
    this.title = '',
    this.price = 0.0,
    this.image,
    required this.quantity,
    this.variationId = '',
    this.brandName,
    this.selectedVariation,
  });

  CartItemModel copyWith({
    String? productId,
    String? title,
    double? price,
    String? image,
    int? quantity,
    String? variationId,
    String? brandName,
    Map<String, String>? selectedVariation,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      variationId: variationId ?? this.variationId,
      brandName: brandName ?? this.brandName,
      selectedVariation: selectedVariation ?? this.selectedVariation,
    );
  }

  static CartItemModel empty() => CartItemModel(
      productId: '', title: '', price: 0.0, quantity: 0, variationId: '');
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'productId': productId});
    result.addAll({'title': title});
    result.addAll({'price': price});
    if (image != null) {
      result.addAll({'image': image});
    }
    result.addAll({'quantity': quantity});
    result.addAll({'variationId': variationId});
    if (brandName != null) {
      result.addAll({'brandName': brandName});
    }
    if (selectedVariation != null) {
      result.addAll({'selectedVariation': selectedVariation});
    } else {
      result.addAll({'selectedVariation': {}});
    }

    return result;
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      productId: map['productId'] ?? '',
      title: map['title'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'],
      quantity: map['quantity']?.toInt() ?? 0,
      variationId: map['variationId'] ?? '',
      brandName: map['brandName'],
      selectedVariation:
          Map<String, String>.from(map['selectedVariation'] ?? {}),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartItemModel(productId: $productId, title: $title, price: $price, image: $image, quantity: $quantity, variationId: $variationId, brandName: $brandName, selectedVariation: $selectedVariation)';
  }
}
