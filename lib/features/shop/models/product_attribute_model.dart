import 'dart:convert';

class ProductAttributeModel {
  String? name;
  final List<String>? values;
  ProductAttributeModel({
    this.name,
    this.values,
  });

  ProductAttributeModel copyWith({
    String? name,
    List<String>? values,
  }) {
    return ProductAttributeModel(
      name: name ?? this.name,
      values: values ?? this.values,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (values != null) {
      result.addAll({'values': values});
    }

    return result;
  }

  factory ProductAttributeModel.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: map['name'],
      values: List<String>.from(map['values']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductAttributeModel.fromJson(String source) =>
      ProductAttributeModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProductAttributeModel(name: $name, values: $values)';
}
