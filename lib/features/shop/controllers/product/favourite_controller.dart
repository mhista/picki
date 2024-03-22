import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/loaders/loaders.dart';
import 'package:pickafrika/data/repositories/products/product_repository.dart';
import 'package:pickafrika/utils/local_storage/storage_utility.dart';

import '../../models/product_model.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  final favorites = <String, bool>{}.obs;
  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  // METHOD TO INITIALIZE BY READING FROM STORAGE
  void initFavourites() async {
    final json = await PLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProducts(String productId) {
    debugPrint(productId);

    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoriteToStorage();
      PLoaders.customToast(
          message: 'Products have been added to your Wishlist');
      debugPrint(favorites.toString());
    } else {
      PLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoriteToStorage();
      PLoaders.customToast(
          message: 'Products have been removed from your Wishlist');
      favorites.refresh();
      debugPrint(favorites.toString());
    }
  }

  void saveFavoriteToStorage() {
    final encodedFavorites = json.encode(favorites);
    PLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance
        .getFavoriteProducts(favorites.keys.toList());
  }
}
