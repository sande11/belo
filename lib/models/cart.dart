import 'package:belo/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeList = [
    Shoe(
      name: 'Air Jordan',
      price: 'K54,000',
      imagePath: 'assets/images/air jordan green.jpg',
      description: 'Cool shoe',
    ),
    Shoe(
      name: 'Nike Air Max',
      price: 'K65,000',
      imagePath: 'assets/images/air jordan red.jpg',
      description: 'Stylish shoe',
    ),
    // Add more shoes...
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList() {
    return shoeList;
  }

  List<Shoe> getShopList() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
