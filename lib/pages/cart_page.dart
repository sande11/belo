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
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns children to the start
          children: [
            const Align(
              alignment: Alignment
                  .centerLeft, // Aligns text to the start of the screen
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'My Cart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    'Total: K0',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: value.getShoeList().length,
                itemBuilder: (context, index) {
                  Product individualCartItem = value.getShoeList()[index];
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
