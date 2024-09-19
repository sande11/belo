import 'package:belo/models/shoe.dart';
import 'package:flutter/material.dart';

class PurchaseOptionsForm extends StatefulWidget {
  final Shoe shoe;
  const PurchaseOptionsForm({required this.shoe});

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
        bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
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
          SizedBox(height: 20),

          // Add to Cart and Buy Now buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add to cart logic
                  Navigator.pop(context); // Close the modal after action
                },
                child: Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Buy now logic
                  Navigator.pop(context); // Close the modal after action
                },
                child: Text('Buy Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
