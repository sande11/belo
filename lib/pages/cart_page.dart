import 'package:belo/components/cart_item.dart';
import 'package:belo/models/cart.dart';
import 'package:belo/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const Text(
                    'My Cart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Expanded(
                      child: ListView.builder(
                    itemCount: value.getShoeList().length,
                    itemBuilder: (context, index) {
                      Shoe individualCartItem = value.getShoeList()[index];
                      return CartItem(shoe: individualCartItem);
                    },
                  )),
                ],
              ),
            ));
  }
}
