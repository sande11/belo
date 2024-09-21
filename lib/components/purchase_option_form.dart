import 'package:belo/models/cart.dart';
import 'package:belo/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseOptionsForm extends StatefulWidget {
  final Shoe shoe;

  const PurchaseOptionsForm({super.key, required this.shoe});

  @override
  _PurchaseOptionsFormState createState() => _PurchaseOptionsFormState();
}

class _PurchaseOptionsFormState extends State<PurchaseOptionsForm> {
  String? selectedSize;
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Choose Size & Color',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),

          // Dropdown for selecting size
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Select Size'),
            value: selectedSize,
            items: ['7', '8', '9', '10', '11']
                .map((size) => DropdownMenuItem(value: size, child: Text(size)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedSize = value;
              });
            },
          ),
          const SizedBox(height: 10),

          // Dropdown for selecting color
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Select Color'),
            value: selectedColor,
            items: ['Red', 'Black', 'Blue', 'White']
                .map((color) =>
                    DropdownMenuItem(value: color, child: Text(color)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedColor = value;
              });
            },
          ),
          const SizedBox(height: 20),

          // Add to Cart and Buy Now buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Ensure both size and color are selected
                  if (selectedSize != null && selectedColor != null) {
                    Provider.of<Cart>(context, listen: false).addItemToCart(
                      widget.shoe, 
                      // selectedSize!, 
                      // selectedColor!,
                    );
                    Navigator.pop(context); // Close the modal after adding to cart
                  } else {
                    // Show an alert if the user hasn't selected size and color
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select both size and color'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Add to Cart'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Buy now logic
                  Navigator.pop(context); // Close the modal after action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Buy Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
