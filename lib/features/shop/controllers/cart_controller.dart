import 'package:get/get.dart';
import 'package:pickafrika/common/loaders/loaders.dart';
import 'package:pickafrika/features/shop/controllers/product/variation_controller.dart';
import 'package:pickafrika/features/shop/models/cacrt_item_model.dart';
import 'package:pickafrika/features/shop/models/product_model.dart';
import 'package:pickafrika/utils/constants/enums.dart';
import 'package:pickafrika/utils/local_storage/storage_utility.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // VARIABLES
  final noOfCartItems = 0.obs;
  final totalCartPrice = 0.0.obs;
  final productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  // /ADD ITEMS TO CART
  void addToCart(ProductModel product) {
    try {
      if (productQuantityInCart.value < 1) {
        PLoaders.customToast(message: 'Select Quantity');
        return;
      }

      if (product.productType == ProductType.variable.name &&
          variationController.selectedVariation.value.id.isEmpty) {
        PLoaders.customToast(message: 'Choose Variation');
        return;
      }
      if (product.productType == ProductType.variable.name) {
        if (variationController.selectedVariation.value.stock < 1) {
          PLoaders.warningSnackBar(
              message: 'Selected variation is out of stock',
              title: 'Oh Snap!!');
          return;
        }
      } else {
        if (product.stock < 1) {
          PLoaders.warningSnackBar(
              message: 'Selected variation is out of stock',
              title: 'Oh Snap!!');
          return;
        }
      }

      // CONVERT PRODUCTMODEL TO CARTMODEL
      final selectedCartItem =
          convertToCartItem(product, productQuantityInCart.value);

      // CHECK IF PRODUCT IS ALREADY IN THE CART
      int index = cartItems.indexWhere((cartItem) =>
          cartItem.productId == selectedCartItem.productId &&
          cartItem.variationId == selectedCartItem.variationId);
      if (index >= 0) {
        // THIS QUANTITY IS AREADY ADDED OR UPDATED/REMOVED FROM THE CART
        cartItems[index].quantity = selectedCartItem.quantity;
      } else {
        cartItems.add(selectedCartItem);
      }

      // UPDATE THE USER CART
      updateCart();
      // TRIGGER A SUCCESS MESSAGE
      PLoaders.customToast(message: 'Your Product has been added to Cart');
    } catch (e) {}
  }

// CONVERT PRODUCT TO CARTMMODELITEM
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.name) {
      // RESET VARIATION IN CASE OF SINGLE PODUCT TYPE ,
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;

    final price = isVariation
        ? variation.salePrice! > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice! > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      price: price!,
      variationId: variation.id,
      title: product.title,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  // UPDATE THE LOCAL STORAGE OF SPECIFIC USER
  void updateCart() {
    updateCartTotals();
    saveCartItem();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;
    for (var item in cartItems) {
      calculatedTotalPrice = (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

// SAVE CATITEMS IN LOCAL STORAGE
  void saveCartItem() {
    final cartItemStrings = cartItems.map((item) => item.toMap()).toList();
    PLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

// GET CARTITEMS FROM LOCAL STORAGE
  void loadCartItems() {
    final cartItemsString =
        PLocalStorage.instance().readData<List<dynamic>>('cartItem');
    if (cartItemsString != null) {
      cartItems.assignAll(cartItemsString
          .map((item) => CartItemModel.fromMap(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  // GET PRODUCT QUANTITY
  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (item) =>
            item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());

    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
