import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'product.dart';

class Cart with ChangeNotifier {
  // Hive box for storing cart items
  final Box<Product> _cartBox = Hive.box<Product>('cartBox');

 // Add product with size and color to the cart
void addItemToCart(Product product, String size, String color) {
  // Create a new Product object with the selected size and color
  Product newProduct = Product(
    id: product.id,
    availability: product.availability,
    category: product.category,
    description: product.description,
    images: product.images,
    name: product.name,
    price: product.price,
    quantityAvailable: product.quantityAvailable,
    section: product.section,
    variants: product.variants,
    selectedSize: size,
    selectedColor: color,
  );

  // Add the new product to Hive
  var size_;
  String key = '${product.id}_$size_$color';
  _cartBox.put(key, newProduct);

  notifyListeners(); // Notify listeners that the cart has changed
}

  // Get list of products in the cart
  List<Product> getCartItems() {
    return _cartBox.values.toList();
  }


  // Get total price
  double getTotalPrice() {
    return _cartBox.values.fold(0, (total, product) => total + product.price);
  }

  // Remove product from the cart
void removeFromCart(String id, String size, String color) {
  var size_;
  String key = '${id}_$size_$color'; 
  _cartBox.delete(key);
  notifyListeners();
}
}
