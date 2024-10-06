import 'package:hive/hive.dart';
import 'product.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final Box<Product> cartBox = Hive.box<Product>('cartBox');

  // Get cart items
  List<Product> getCartList() {
    return cartBox.values.toList();
  }

  // Add item to cart
  void addItemToCart(Product product) {
    cartBox.put(product.id, product); // Save the product to the box
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Product product) {
    cartBox.delete(product.id); // Remove the product from the box
    notifyListeners();
  }

  // Clear the cart
  void clearCart() {
    cartBox.clear();
    notifyListeners();
  }
}
