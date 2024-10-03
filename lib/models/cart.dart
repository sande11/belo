import 'package:belo/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Product> shoeList = [];
  List<Product> userCart = [];

  // Fetch products from Firestore
  Future<void> fetchProducts() async {
    CollectionReference products = FirebaseFirestore.instance.collection('products');

    QuerySnapshot snapshot = await products.get();

    shoeList = snapshot.docs.map((doc) {
      return Product(
        name: doc['name'],
        price: doc['price'],
        description: doc['description'],
        imageUrls: List<String>.from(doc['images']),
        availability: doc['availability'],
      );
    }).toList();
    notifyListeners();
  }

  List<Product> getShoeList() {
    return shoeList;
  }

  List<Product> getCartList() {
    return userCart;
  }

  // Add item to cart
  void addItemToCart(Product product) {
    userCart.add(product);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Product product) {
    userCart.remove(product);
    notifyListeners();
  }
}
