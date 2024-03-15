import 'package:pickafrika/features/shop/models/brand_model.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';

class BrandDummyData {
  static List<BrandModel> brandModels = [
    BrandModel(
        id: '1',
        name: 'Adidas',
        image: PImages.adidas,
        isFeatured: true,
        productsCount: 100),
    BrandModel(
        id: '2',
        name: 'Nike',
        image: PImages.nike,
        isFeatured: true,
        productsCount: 50),
    BrandModel(
        id: '3',
        name: 'Dell',
        image: PImages.dell,
        isFeatured: true,
        productsCount: 20),
    BrandModel(
        id: '4',
        name: 'hp',
        image: PImages.hp,
        isFeatured: true,
        productsCount: 0),
    BrandModel(
        id: '5',
        name: 'IKEA',
        image: PImages.ikea,
        isFeatured: true,
        productsCount: 60),
    BrandModel(
        id: '6',
        name: 'Puma',
        image: PImages.puma,
        isFeatured: true,
        productsCount: 90),
    BrandModel(
        id: '7',
        name: 'zara',
        image: PImages.zara,
        isFeatured: true,
        productsCount: 80),
    BrandModel(
        id: '8',
        name: 'Apple',
        image: PImages.apple,
        isFeatured: true,
        productsCount: 40),
    BrandModel(
        id: '9',
        name: 'Jordan',
        image: PImages.jordan,
        isFeatured: true,
        productsCount: 40),
  ];
}
