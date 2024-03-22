class PPricingCalculator {
  /// -- calculate the price based on tax and shipping
  static double calculateTotalPrice(
      double subTotal, String location, int itemCount) {
    double taxRate = _getTaxRateForLocation(location);
    double taxAmount = subTotal * taxRate;

    double shippingCost = calculateShippingCost(subTotal, location, itemCount);

    double totalPrice = subTotal + taxAmount + shippingCost;
    return totalPrice;
  }

  /// -- calculate shipping cost
  static double calculateShippingCost(
      double subTotal, String location, int itemCount) {
    double shippingCost = getShippingCost(location);
    double eachItemsShippingCost = shippingCost * itemCount;

    return eachItemsShippingCost;
  }

  /// -- calculate tax
  static String calculateTax(double subTotal, String location) {
    double taxRate = _getTaxRateForLocation(location);
    double taxAmount = subTotal * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double _getTaxRateForLocation(String location) {
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
