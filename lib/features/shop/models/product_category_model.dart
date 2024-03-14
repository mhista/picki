import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String productId;
  final String categoryId;

  ProductCategoryModel({required this.productId, required this.categoryId});

// EMPTY BRANDCATEGORY MODEL
  static ProductCategoryModel empty() =>
      ProductCategoryModel(productId: '', categoryId: '');
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'productId': productId});
    result.addAll({'categoryId': categoryId});

    return result;
  }

  factory ProductCategoryModel.fromMap(Map<String, dynamic> map) {
    return ProductCategoryModel(
      productId: map['productId'] ?? '',
      categoryId: map['categoryId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCategoryModel.fromJson(String source) =>
      ProductCategoryModel.fromMap(json.decode(source));

  factory ProductCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final map = document.data()!;
    return ProductCategoryModel(
      productId: map['productId'] ?? '',
      categoryId: map['categoryId'] ?? '',
    );
  }
}
