import 'package:belo/components/cart_item.dart';
import 'package:belo/models/cart.dart';
import 'package:belo/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'My Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Total: K${cart.getTotalPrice()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cart.getCartItems().length,
                itemBuilder: (context, index) {
                  Product individualCartItem = cart.getCartItems()[index];
                  return CartItem(product: individualCartItem);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
