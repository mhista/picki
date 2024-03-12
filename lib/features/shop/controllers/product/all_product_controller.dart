import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/loaders/loaders.dart';
import 'package:pickafrika/data/repositories/products/product_repository.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final repository = ProductRepository.instance;
  final Rx<String> selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await repository.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      PLoaders.errorSnackBar(title: 'Ohps!', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOptions) {
    selectedSortOption.value = sortOptions;
    switch (sortOptions) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'New Products':
        products.sort((a, b) {
          if (a.date != null && b.date != null) {
            return a.date!.compareTo(b.date!);
          }
          return 0;
        });
        break;
      case 'Sale':
        products.sort((a, b) {
          if (b.salePrice! > 0) {
            return b.salePrice!.compareTo(a.salePrice!);
          } else if (a.salePrice! > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;

      default:
        // default sorting option : name
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
// Assign products to the 'products list
    this.products.assignAll(products);
    sortProducts('Name');
  }
}
