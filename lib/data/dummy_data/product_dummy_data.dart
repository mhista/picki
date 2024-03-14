import 'package:pickafrika/data/dummy_data/brand_dummy_data.dart';
import 'package:pickafrika/utils/constants/enums.dart';

import '../../features/shop/models/product_attribute_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../features/shop/models/product_variation_model.dart';
import '../../utils/constants/image_strings.dart';

class ProductDummyData {
  static final List<ProductModel> products = [
    // PRODUCT 1
    // NIKE SHOE
    ProductModel(
      id: '001',
      stock: 20,
      price: 500,
      salePrice: 400,
      title: 'White Air max sport',
      thumbnail: PImages.productShoe7,
      isFeatured: true,
      description: 'Embrace ',
      categoryId: '1',
      productType: ProductType.variable.name,
      images: [
        PImages.productShoe7,
        PImages.productShoe8,
        PImages.productShoe9,
        PImages.productShoe10,
        PImages.productShoe11,
        PImages.productShoe12,
        PImages.productShoe13,
        PImages.productShoe14,
        PImages.productShoe15,
      ],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Pink', 'Black', 'Red']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 32', 'EU 40', 'EU 24']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            attributeValues: {
              'Color': ['Black'],
              'Size': ['EU 32', 'EU 40']
            },
            stock: 5,
            price: 350,
            salePrice: 300,
            image: PImages.productShoe7,
            description: 'A product description for White Air max sports'),
        ProductVariationModel(
            id: '2',
            attributeValues: {
              'Color': ['Pink'],
              'Size': ['EU 24']
            },
            stock: 5,
            price: 300,
            salePrice: 250,
            image: PImages.productShoe10,
            description: 'A product description for Pink Air max sports'),
        ProductVariationModel(
            id: '3',
            attributeValues: {
              'Color': ['Brown'],
              'Size': ['EU 32', 'EU 24']
            },
            stock: 5,
            price: 350,
            salePrice: 290,
            image: PImages.productShoe13,
            description: 'A product description for Brown Air max sports'),
      ],
      brand: BrandDummyData.brandModels[1],
      sku: 'ABR4563',
    ),

    // PRODUCT 2
    ProductModel(
      id: '002',
      stock: 50,
      price: 1000,
      salePrice: 700,
      title: 'Womens pretty Jacket',
      thumbnail: PImages.productWomen10,
      isFeatured: true,
      description: 'Womens pretty Jacket',
      categoryId: '1',
      productType: ProductType.variable.name,
      images: [],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Pink']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '5',
            attributeValues: {
              'Color': ['Green']
            },
            stock: 20,
            price: 600,
            salePrice: 500,
            image: PImages.productWomen10,
            description: 'A product description for Womens pretty gown'),
        ProductVariationModel(
            id: '6',
            attributeValues: {
              'Color': ['Pink']
            },
            stock: 10,
            price: 700,
            salePrice: 600,
            image: PImages.productWomen8,
            description: 'A product description for Womens pretty gown'),
        ProductVariationModel(
            id: '7',
            attributeValues: {
              'Color': ['Blue']
            },
            stock: 20,
            price: 650,
            salePrice: 550,
            image: PImages.productWomen9,
            description: 'A product description forWomens pretty gown'),
      ],
      brand: BrandDummyData.brandModels[6],
      sku: 'ABR4563',
    ),

    // PRODUCT 4
    ProductModel(
      id: '003',
      stock: 40,
      price: 600,
      salePrice: 400,
      title: 'White Air Jordan sport',
      thumbnail: PImages.productShoe3,
      isFeatured: true,
      description: 'White Air max sport',
      categoryId: '1',
      productType: ProductType.single.name,
      images: [
        PImages.productShoe3,
        PImages.productShoe1,
        PImages.productShoe2
      ],
      productVariations: [
        // ProductVariationModel(id: '8', attributeValues: {'Size':[]})
      ],
      productAttributes: [
        ProductAttributeModel(
            name: 'Size', values: ['EU 32', 'EU 40', 'EU 24']),
      ],
      brand: BrandDummyData.brandModels[8],
      sku: 'ABR4563',
    ),
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
        PImages.productMen2,
      ],
      productVariations: [],
      productAttributes: [],
      brand: BrandDummyData.brandModels[0],
      sku: 'ABR4563',
    ),
    // PRODUCT 4
    ProductModel(
      id: '005',
      stock: 20,
      price: 200,
      salePrice: 150,
      title: 'Mens Black Jacket, ',
      thumbnail: PImages.productMen3,
      isFeatured: true,
      description: 'Mens Black Jacket suit, ',
      categoryId: '1',
      productType: ProductType.single.name,
      images: [
        PImages.productMen4,
      ],
      productVariations: [],
      productAttributes: [],
      brand: BrandDummyData.brandModels[0],
      sku: 'ABR4563',
    ),
    // PRODUCT 5
    ProductModel(
      id: '006',
      stock: 50,
      price: 1500,
      salePrice: 1200,
      title: 'iphone x',
      thumbnail: PImages.iphone3,
      isFeatured: true,
      description: '',
      categoryId: '1',
      productType: ProductType.variable.name,
      images: [PImages.iphone2, PImages.iphone4],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: [
          'Black',
          'White',
        ]),
        ProductAttributeModel(name: 'Type', values: [
          'Xmas',
          'Pro',
        ]),
      ],
      productVariations: [
        ProductVariationModel(
            id: '8',
            attributeValues: {
              'Color': ['Black'],
              'Type': ['Xmas']
            },
            stock: 20,
            price: 1500,
            salePrice: 1300,
            image: PImages.iphone3,
            description: ''),
        ProductVariationModel(
            id: '9',
            attributeValues: {
              'Color': ['White'],
              'Type': ['Pro']
            },
            stock: 10,
            price: 1400,
            salePrice: 1200,
            image: PImages.iphone1,
            description: ''),
      ],
      brand: BrandDummyData.brandModels[7],
      sku: 'ABR4563',
    ),
    // PRODUCT 6
    ProductModel(
      id: '007',
      stock: 50,
      price: 3500,
      salePrice: 3300,
      title: 'Macbook Air',
      thumbnail: PImages.macbook1,
      isFeatured: true,
      description: '',
      categoryId: '1',
      productType: ProductType.variable.name,
      images: [PImages.macbook2, PImages.macbook4],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: [
          'Grey',
          'White',
        ]),
      ],
      productVariations: [
        ProductVariationModel(
            id: '10',
            attributeValues: {
              'Color': ['Grey'],
            },
            stock: 20,
            price: 3500,
            salePrice: 3400,
            image: PImages.macbook1,
            description: ''),
        ProductVariationModel(
            id: '11',
            attributeValues: {
              'Color': ['White'],
            },
            stock: 10,
            price: 3400,
            salePrice: 3300,
            image: PImages.macbook3,
            description: ''),
      ],
      brand: BrandDummyData.brandModels[7],
      sku: 'ABR4563',
    ),
    // PRODUCT 7
    ProductModel(
      id: '008',
      stock: 50,
      price: 2000,
      salePrice: 1700,
      title: 'Dell superior',
      thumbnail: PImages.dell1,
      isFeatured: true,
      description: '',
      categoryId: '1',
      productType: ProductType.variable.name,
      images: [PImages.dell3, PImages.dell2],
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: [
          'Black',
          'White',
        ]),
      ],
      productVariations: [
        ProductVariationModel(
            id: '12',
            attributeValues: {
              'Color': ['Black']
            },
            stock: 20,
            price: 2000,
            salePrice: 1800,
            image: PImages.dell4,
            description: ''),
        ProductVariationModel(
            id: '13',
            attributeValues: {
              'Color': ['White']
            },
            stock: 10,
            price: 1900,
            salePrice: 1700,
            image: PImages.dell3,
            description: ''),
      ],
      brand: BrandDummyData.brandModels[7],
      sku: 'ABR4563',
    ),
    // PRODUCT 8
    ProductModel(
      id: '009',
      stock: 20,
      price: 200,
      salePrice: 150,
      title: 'Retractable Chair, ',
      thumbnail: PImages.productChair1,
      isFeatured: true,
      description: '',
      categoryId: '1',
      productType: ProductType.single.name,
      images: [
        PImages.productMen4,
      ],
      productVariations: [],
      productAttributes: [],
      brand: BrandDummyData.brandModels[4],
      sku: 'ABR4563',
    ),
    // PRODUCT 9
    ProductModel(
      id: '010',
      stock: 20,
      price: 200,
      salePrice: 150,
      title: 'Fancy Chair, ',
      thumbnail: PImages.productChair2,
      isFeatured: true,
      description: '',
      categoryId: '1',
      productType: ProductType.single.name,
      images: [
        PImages.productMen4,
      ],
      productVariations: [],
      productAttributes: [],
      brand: BrandDummyData.brandModels[4],
      sku: 'ABR4563',
    ),
    // PRODUCT 10
    ProductModel(
      id: '011',
      stock: 50,
      price: 500,
      salePrice: 300,
      title: 'Headset Xp',
      thumbnail: PImages.headphones1,
      isFeatured: true,
      description: '',
      categoryId: '1',
      productType: ProductType.variable.name,
      images: [],
      productAttributes: [],
      productVariations: [
        ProductVariationModel(
            id: '14',
            attributeValues: {},
            stock: 20,
            price: 3500,
            salePrice: 3400,
            image: PImages.headphones1,
            description: ''),
        ProductVariationModel(
            id: '15',
            attributeValues: {},
            stock: 10,
            price: 3400,
            salePrice: 3300,
            image: PImages.headphones2,
            description: ''),
        ProductVariationModel(
            id: '16',
            attributeValues: {},
            stock: 10,
            price: 3400,
            salePrice: 3300,
            image: PImages.headphones3,
            description: ''),
      ],
      brand: BrandDummyData.brandModels[7],
      sku: 'ABR4563',
    ),
    // PRODUCT 11
  ];
}
