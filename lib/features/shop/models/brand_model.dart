import 'dart:convert';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;
  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  // EMPTY HELPER FUNCTION
  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  BrandModel copyWith({
    String? id,
    String? name,
    String? image,
    bool? isFeatured,
    int? productsCount,
  }) {
    return BrandModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      isFeatured: isFeatured ?? this.isFeatured,
      productsCount: productsCount ?? this.productsCount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'image': image});
    if (isFeatured != null) {
      result.addAll({'isFeatured': isFeatured});
    }
    if (productsCount != null) {
      result.addAll({'productsCount': productsCount});
    }

    return result;
  }

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      isFeatured: map['isFeatured'],
      productsCount: map['productsCount']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandModel.fromJson(String source) =>
      BrandModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BrandModel(id: $id, name: $name, image: $image, isFeatured: $isFeatured, productsCount: $productsCount)';
  }
}
