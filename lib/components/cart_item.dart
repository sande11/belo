import 'package:belo/models/cart.dart';
import 'package:belo/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Product product; // Mark this as final and required
  const CartItem({super.key, required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // Method to remove an item from the cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false)
        .removeItemFromCart(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: SizedBox(
          width: 100, // Set a fixed width for the leading widget
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Checkbox(value: false, onChanged: null),
              Expanded(
                // Use Expanded to prevent overflow
                child: Image.asset(
                  widget
                      .product.images[0], // Access the first image in the list
                  height: 100,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        title: Text(widget.product.name), // Correctly access the product name
        subtitle: Text(
            '\$${widget.product.price.toStringAsFixed(2)}'), // Format price
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
