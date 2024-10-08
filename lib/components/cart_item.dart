import 'package:belo/models/cart.dart';
import 'package:belo/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Product product;
  final Function(bool, Product)
      onSelected; // Callback to notify when an item is selected or unselected
  final bool isSelected; // Track if the item is selected

  const CartItem({
    super.key,
    required this.product,
    required this.onSelected,
    required this.isSelected,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked =
        widget.isSelected; // Initialize with the provided selection state
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
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });
                widget.onSelected(isChecked,
                    widget.product); // Notify parent of selection change
              },
              activeColor:
                  Colors.blue, // Color of the checkbox when it's active
              checkColor:
                  Colors.black, // Color of the checkmark inside the checkbox
            ),
            Image.network(
              widget.product.images[0],
              height: 100,
              width: 60,
              fit: BoxFit.cover,
            ),
          ],
        ),
        title: Text(widget.product.name),
        subtitle: Text('\$${widget.product.price.toStringAsFixed(2)}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            Provider.of<Cart>(context, listen: false)
                .removeItemFromCart(widget.product);
          },
        ),
      ),
    );
  }
}
