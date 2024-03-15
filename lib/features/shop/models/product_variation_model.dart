import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductVariationModel {
  final String id;
  String? sku;
  String? image;
  String? description;
  double? price;
  double? salePrice;
  int stock;
  Map<String, String> attributeValues;
  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });
// EMPTY PRODUCT VARIATION
  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        attributeValues: {},
      );
  ProductVariationModel copyWith({
    String? id,
    String? sku,
    String? image,
    String? description,
    double? price,
    double? salePrice,
    int? stock,
    Map<String, String>? attributeValues,
  }) {
    return ProductVariationModel(
      id: id ?? this.id,
      sku: sku ?? this.sku,
      image: image ?? this.image,
      description: description ?? this.description,
      price: price ?? this.price,
      salePrice: salePrice ?? this.salePrice,
      stock: stock ?? this.stock,
      attributeValues: attributeValues ?? this.attributeValues,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'sku': sku});
    result.addAll({'image': image});
    if (description != null) {
      result.addAll({'description': description});
    }
    result.addAll({'price': price});
    result.addAll({'salePrice': salePrice});
    result.addAll({'stock': stock});
    result.addAll({'attributeValues': attributeValues});

    return result;
  }

  factory ProductVariationModel.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: map['id'] ?? '',
      sku: map['sku'] ?? '',
      image: map['image'] ?? '',
      description: map['description'],
      price: map['price']?.toDouble() ?? 0.0,
      salePrice: map['salePrice']?.toDouble() ?? 0.0,
      stock: map['stock']?.toInt() ?? 0,
      attributeValues: Map<String, String>.from(map['attributeValues']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductVariationModel.fromJson(String source) =>
      ProductVariationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductVariationModel(id: $id, sku: $sku, image: $image, description: $description, price: $price, salePrice: $salePrice, stock: $stock, attributeValues: $attributeValues)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductVariationModel &&
        other.id == id &&
        other.sku == sku &&
        other.image == image &&
        other.description == description &&
        other.price == price &&
        other.salePrice == salePrice &&
        other.stock == stock &&
        mapEquals(other.attributeValues, attributeValues);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sku.hashCode ^
        image.hashCode ^
        description.hashCode ^
        price.hashCode ^
        salePrice.hashCode ^
        stock.hashCode ^
        attributeValues.hashCode;
  }
}
