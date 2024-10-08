import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'product.dart';

class Cart with ChangeNotifier {
  // Hive box for storing cart items
  final Box<Product> _cartBox = Hive.box<Product>('cartBox');

  var size_;

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

  void removeItemFromCart(Product product, String size, String color) {
    // Construct the unique key using product ID, size, and color
    String key = '${product.id}_$size_$color';

    print('Removing item with key: $key'); // Debugging

    // Remove the item directly from the cart using the key
    _cartBox.delete(key);

    // Notify listeners to update the UI
    notifyListeners();
  }
}
