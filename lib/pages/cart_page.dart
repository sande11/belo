import 'package:belo/components/cart_item.dart';
import 'package:belo/models/cart.dart';
import 'package:belo/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Track selected items
  List<Product> selectedItems = [];

  // Callback to handle selection
  void handleSelection(bool isSelected, Product product) {
    setState(() {
      if (isSelected) {
        selectedItems.add(product);
      } else {
        selectedItems.remove(product);
      }
    });
  }

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
                  bool isSelected = selectedItems.contains(individualCartItem);
                  return CartItem(
                    product: individualCartItem,
                    isSelected: isSelected,
                    onSelected: handleSelection, // Pass the selection handler
                  );
                },
              ),
            ),
            // Conditionally show checkout button if any items are selected
            if (selectedItems.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      'Check Out',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
