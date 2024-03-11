import 'package:pickafrika/utils/constants/enums.dart';

import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/product_attribute_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../features/shop/models/product_variation_model.dart';
import '../../utils/constants/image_strings.dart';

class ProductDummyData {
  static final List<ProductModel> products = [
    // PRODUCT 1
    // ProductModel(
    //   id: '001',
    //   stock: 20,
    //   price: 500,
    //   salePrice: 400,
    //   title: 'White Air max sport',
    //   thumbnail: PImages.productShoe1,
    //   isFeatured: true,
    //   description: 'White Air max sport',
    //   categoryId: '1',
    //   productType: ProductType.variable.name,
    //   images: [],
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
    //     ProductAttributeModel(
    //         name: 'Size', values: ['EU 32', 'EU 40', 'EU 24']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //         id: '1',
    //         attributeValues: {'Color': 'White', 'Size': 'EU 32'},
    //         stock: 5,
    //         price: 350,
    //         salePrice: 300,
    //         image: PImages.productShoe4,
    //         description: 'A product description for White Air max sports'),
    //     ProductVariationModel(
    //         id: '2',
    //         attributeValues: {'Color': 'Black', 'Size': 'EU 40'},
    //         stock: 5,
    //         price: 300,
    //         salePrice: 250,
    //         image: PImages.productShoe7,
    //         description: 'A product description for Black Air max sports'),
    //     ProductVariationModel(
    //         id: '3',
    //         attributeValues: {'Color': 'Pink', 'Size': 'EU 24'},
    //         stock: 5,
    //         price: 350,
    //         salePrice: 290,
    //         image: PImages.productShoe9,
    //         description: 'A product description for Pink Air max sports'),
    //     ProductVariationModel(
    //         id: '4',
    //         attributeValues: {'Color': 'Brown', 'Size': 'EU 32'},
    //         stock: 5,
    //         price: 350,
    //         salePrice: 300,
    //         image: PImages.productShoe11,
    //         description: 'A product description for Brown Air max sports')
    //   ],
    //   brand: BrandModel(
    //       id: '1',
    //       name: 'Air Jordan',
    //       image: PImages.applePay,
    //       productsCount: 300,
    //       isFeatured: true),
    //   sku: 'ABR4563',
    // ),

    // // PRODUCT 2
    // ProductModel(
    //   id: '002',
    //   stock: 50,
    //   price: 1000,
    //   salePrice: 700,
    //   title: 'Womens pretty gown',
    //   thumbnail: PImages.productWomen1,
    //   isFeatured: true,
    //   description: 'Womens pretty gown',
    //   categoryId: '1',
    //   productType: ProductType.variable.name,
    //   images: [],
    //   productAttributes: [
    //     ProductAttributeModel(
    //         name: 'Color', values: ['Green', 'Blue', 'Purple']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //         id: '5',
    //         attributeValues: {'Color': 'Green'},
    //         stock: 20,
    //         price: 600,
    //         salePrice: 500,
    //         image: PImages.productShoe4,
    //         description: 'A product description for Womens pretty gown'),
    //     ProductVariationModel(
    //         id: '6',
    //         attributeValues: {'Color': 'Blue'},
    //         stock: 10,
    //         price: 700,
    //         salePrice: 600,
    //         image: PImages.productShoe7,
    //         description: 'A product description for Womens pretty gown'),
    //     ProductVariationModel(
    //         id: '7',
    //         attributeValues: {'Color': 'Purple'},
    //         stock: 20,
    //         price: 650,
    //         salePrice: 550,
    //         image: PImages.productShoe9,
    //         description: 'A product description forWomens pretty gown'),
    //   ],
    //   brand: BrandModel(
    //       id: '2',
    //       name: 'Versace',
    //       image: PImages.applePay,
    //       productsCount: 200,
    //       isFeatured: true),
    //   sku: 'ABR4563',
    // ),

    // // PRODUCT 4
    // ProductModel(
    //   id: '003',
    //   stock: 40,
    //   price: 600,
    //   salePrice: 400,
    //   title: 'White Air max sport',
    //   thumbnail: PImages.productShoe4,
    //   isFeatured: true,
    //   description: 'White Air max sport',
    //   categoryId: '1',
    //   productType: ProductType.single.name,
    //   images: [],
    //   productVariations: [],
    //   productAttributes: [
    //     ProductAttributeModel(
    //         name: 'Size', values: ['EU 32', 'EU 40', 'EU 24']),
    //   ],
    //   brand: BrandModel(
    //       id: '4',
    //       name: 'Gucci',
    //       image: PImages.applePay,
    //       productsCount: 50,
    //       isFeatured: true),
    //   sku: 'ABR4563',
    // ),
    // PRODUCT 3
    ProductModel(
      id: '004',
      stock: 20,
      price: 500,
      salePrice: 400,
      title: 'Mens kellini suit, ',
      thumbnail: PImages.productMen1,
      isFeatured: true,
      description: 'Mens kellini suit, ',
      categoryId: '1',
      productType: ProductType.single.name,
      images: [
        PImages.productMen3,
        PImages.productMen2,
      ],
      productVariations: [],
      productAttributes: [
        ProductAttributeModel(
            name: 'Size', values: ['EU 32', 'EU 40', 'EU 24']),
      ],
      brand: BrandModel(
          id: '3',
          name: 'Nike',
          image: PImages.applePay,
          productsCount: 300,
          isFeatured: true),
      sku: 'ABR4563',
    ),
  ];
}
