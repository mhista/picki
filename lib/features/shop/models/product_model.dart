import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:pickafrika/features/shop/models/product_attribute_model.dart';
import 'package:pickafrika/features/shop/models/product_variation_model.dart';

import 'brand_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel> productAttributes;
  List<ProductVariationModel> prooductVariations;
  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    required this.description,
    required this.categoryId,
    this.images,
    required this.productType,
    required this.productAttributes,
    required this.prooductVariations,
  });

  ProductModel copyWith({
    String? id,
    int? stock,
    String? sku,
    double? price,
    String? title,
    DateTime? date,
    String? thumbnail,
    bool? isFeatured,
    BrandModel? brand,
    String? description,
    String? categoryId,
    List<String>? images,
    String? productType,
    List<ProductAttributeModel>? productAttributes,
    List<ProductVariationModel>? prooductVariations,
  }) {
    return ProductModel(
      id: id ?? this.id,
      stock: stock ?? this.stock,
      sku: sku ?? this.sku,
      price: price ?? this.price,
      title: title ?? this.title,
      date: date ?? this.date,
      thumbnail: thumbnail ?? this.thumbnail,
      isFeatured: isFeatured ?? this.isFeatured,
      brand: brand ?? this.brand,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      images: images ?? this.images,
      productType: productType ?? this.productType,
      productAttributes: productAttributes ?? this.productAttributes,
      prooductVariations: prooductVariations ?? this.prooductVariations,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'stock': stock});
    if (sku != null) {
      result.addAll({'sku': sku});
    }
    result.addAll({'price': price});
    result.addAll({'title': title});
    if (date != null) {
      result.addAll({'date': date!.millisecondsSinceEpoch});
    }
    result.addAll({'thumbnail': thumbnail});
    if (isFeatured != null) {
      result.addAll({'isFeatured': isFeatured});
    }
    if (brand != null) {
      result.addAll({'brand': brand!.toMap()});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (categoryId != null) {
      result.addAll({'categoryId': categoryId});
    }
    if (images != null) {
      result.addAll({'images': images});
    }
    result.addAll({'productType': productType});
    result.addAll({
      'productAttributes': productAttributes.map((x) => x.toMap()).toList()
    });
    result.addAll({
      'prooductVariations': prooductVariations.map((x) => x.toMap()).toList()
    });

    return result;
  }

// MAP JSON ORIENTED DOCUMENT SNAPSHOT FROM FIREBASE TO MODEL
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final map = document.data()!;
    return ProductModel(
      id: document.id,
      stock: map['stock']?.toInt() ?? 0,
      sku: map['sku'],
      price: map['price']?.toDouble() ?? 0.0,
      title: map['title'] ?? '',
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'])
          : null,
      thumbnail: map['thumbnail'] ?? '',
      isFeatured: map['isFeatured'],
      brand: map['brand'] != null ? BrandModel.fromMap(map['brand']) : null,
      description: map['description'],
      categoryId: map['categoryId'],
      images: map['images'] != null ? List<String>.from(map['images']) : [],
      productType: map['productType'] ?? '',
      productAttributes: List<ProductAttributeModel>.from(
          map['productAttributes']
              ?.map((x) => ProductAttributeModel.fromMap(x))),
      prooductVariations: List<ProductVariationModel>.from(
          map['prooductVariations']
              ?.map((x) => ProductVariationModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromSnapshot(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, stock: $stock, sku: $sku, price: $price, title: $title, date: $date, thumbnail: $thumbnail, isFeatured: $isFeatured, brand: $brand, description: $description, categoryId: $categoryId, images: $images, productType: $productType, productAttributes: $productAttributes, prooductVariations: $prooductVariations)';
  }

// MAP JSON ORIENTED DOCUMENT SNAPSHOT FROM FIREBASE TO MODEL

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final map = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      stock: map['stock']?.toInt() ?? 0,
      sku: map['sku'],
      price: map['price']?.toDouble() ?? 0.0,
      title: map['title'] ?? '',
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'])
          : null,
      thumbnail: map['thumbnail'] ?? '',
      isFeatured: map['isFeatured'],
      brand: map['brand'] != null ? BrandModel.fromMap(map['brand']) : null,
      description: map['description'],
      categoryId: map['categoryId'],
      images: map['images'] != null ? List<String>.from(map['images']) : [],
      productType: map['productType'] ?? '',
      productAttributes: List<ProductAttributeModel>.from(
          map['productAttributes']
              ?.map((x) => ProductAttributeModel.fromMap(x))),
      prooductVariations: List<ProductVariationModel>.from(
          map['prooductVariations']
              ?.map((x) => ProductVariationModel.fromMap(x))),
    );
  }
}
