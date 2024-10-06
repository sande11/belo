import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
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

@override
Widget build(BuildContext context) {
  // Retrieve the cart items
  var cartItems = Provider.of<Cart>(context).getCartList();

  return Scaffold(
    appBar: AppBar(
      title: const Text('Your Cart'),
    ),
    body: cartItems.isEmpty
        ? const Center(
            child: Text("Your cart is empty"),
          )
        : ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              Product product = cartItems[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Remove item from the cart
                    Provider.of<Cart>(context, listen: false)
                        .removeItemFromCart(product);
                  },
                ),
              );
            },
          ),
  );
}
