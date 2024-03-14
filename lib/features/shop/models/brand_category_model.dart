import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  final String brandId;
  final String categoryId;

  BrandCategoryModel({required this.brandId, required this.categoryId});

// EMPTY BRANDCATEGORY MODEL
  static BrandCategoryModel empty() =>
      BrandCategoryModel(brandId: '', categoryId: '');
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'brandId': brandId});
    result.addAll({'categoryId': categoryId});

    return result;
  }

  factory BrandCategoryModel.fromMap(Map<String, dynamic> map) {
    return BrandCategoryModel(
      brandId: map['brandId'] ?? '',
      categoryId: map['categoryId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandCategoryModel.fromJson(String source) =>
      BrandCategoryModel.fromMap(json.decode(source));

  factory BrandCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final map = document.data()!;
    return BrandCategoryModel(
      brandId: map['brandId'] ?? '',
      categoryId: map['categoryId'] ?? '',
    );
  }
}
