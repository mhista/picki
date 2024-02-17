class TPricingCalculator {
  /// -- calculate the price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = productPrice * taxRate;

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// -- calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// -- calculate tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // lookup the tax rate for the given location rom tax rate datebase or API
    // return the appropriate tax rate
    return 0.10; //example tax rate of 10%
  }

  static double getShippingCost(String location) {
    // lookup the shipping cost for the given location rom shipping rate  API
    // return the appropriate tax rate
    return 5.00; //example cost at $5
  }

  /// -- sum all cart values and return total amount
  // static double calculateCartTotal(CartModel cart) {
  //   return cart.item.map((e) => e.price).fold(0,
  //       (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }
}
