import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/features/shop/controllers/cart_controller.dart';
import 'package:pickafrika/features/shop/controllers/product/image_controller.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';
import 'package:pickafrika/features/shop/models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  // SELECT ATTRIBUTE AND VARIATION
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    // when attribute is selected we first add that attribute to the selectedAttributes.
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    // debugPrint(selectedAttributes.toString());
    this.selectedAttributes[attributeName] = attributeValue;
    // debugPrint(this.selectedAttributes.toString());

    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    // show the selected variation imagee as a main image
    if (selectedVariation.image!.isNotEmpty) {
      ImageController.instance.selectedProductImage.value =
          selectedVariation.image!;
    }

    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController
          .getVariationQuantityInCart(product.id, selectedVariation.id);
    }
    // Assign selected variation
    this.selectedVariation.value = selectedVariation;

// update selected product variation status
    getProductVariationStockStatus();
  }

  bool _isSameAttributeValues(
    Map<String, dynamic> variationAttributes,
    Map<String, dynamic> selectedAttributes,
  ) {
    // if selected attribute contains 3 attributes and currrent variation contains 2, then return
    if (variationAttributes.length != selectedAttributes.length) return false;
    // if any of the attributes is different then return. e.g [Green, Large] x [Green, small]
    for (final key in variationAttributes.keys) {
      // Attribute[Key] = value which could be there [Green, Small, Cotton] etc
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  // CHECK ATTRIBUTE AVAILABILITY / STOCK IN VARIATION
  Set<String?> getAttributeAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
// pass the variations to check attributes are available and stock is not 0
    final availableVariationAttributeValues = variations
        .where((variation) =>
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

// GET VARIATION PRICE
  String getVariationPrice(ProductModel product) {
    return (selectedVariation.value.salePrice! > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price! > 0
                ? selectedVariation.value.price
                : product.salePrice! > 0
                    ? product.salePrice
                    : product.price)
        .toString();
  }

// CHECK PRODUCT VARIATION STOCK STATUS
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

// RESET SELECTED ATTRIBUTES WHEN SWITCHING PRODUCTS
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
