import 'package:belo/models/cart.dart';
import 'package:belo/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseOptionsForm extends StatefulWidget {
  final Product product;

  const PurchaseOptionsForm({super.key, required this.product});

  @override
  _PurchaseOptionsFormState createState() => _PurchaseOptionsFormState();
}

class _PurchaseOptionsFormState extends State<PurchaseOptionsForm> {
  String? selectedSize;
  String? selectedColor;
  List<String> availableSizes = [];
  List<String> availableColors = [];
  String? selectedImage;

  @override
  void initState() {
    super.initState();
    // Initialize the first variant's sizes and colors
    if (widget.product.variants.isNotEmpty) {
      availableSizes =
          widget.product.variants.map((v) => v.size).toSet().toList();
      availableColors =
          widget.product.variants.map((v) => v.color).toSet().toList();
      // Display the image of the first variant
      selectedImage =
          widget.product.images.isNotEmpty ? widget.product.images[0] : '';
    }
  }

  void updateSelectedImage() {
    if (selectedSize == null || selectedColor == null) return;

    for (var variant in widget.product.variants) {
      if (variant.size == selectedSize &&
          variant.color == selectedColor &&
          variant.images.isNotEmpty) {
        setState(() {
          selectedImage = variant.images[0];
        });
        break;
      }
    }
  }

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
          // Display product image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              selectedImage ?? '',
              height: 250,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Choose Size & Color',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),

          // Dropdown for selecting size
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Select Size'),
            value: selectedSize,
            items: availableSizes
                .map((size) => DropdownMenuItem(value: size, child: Text(size)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedSize = value;
                updateSelectedImage(); // Update the image based on selection
              });
            },
          ),
          const SizedBox(height: 10),

          // Dropdown for selecting color
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Select Color'),
            value: selectedColor,
            items: availableColors
                .map((color) =>
                    DropdownMenuItem(value: color, child: Text(color)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedColor = value;
                updateSelectedImage(); // Update the image based on selection
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
                  if (selectedSize != null && selectedColor != null) {
                    Provider.of<Cart>(context, listen: false).addItemToCart(
                      widget.product,
                      selectedSize!,
                      selectedColor!,
                    );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('${widget.product.name} added to cart!')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select both size and color'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement Buy Now functionality
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  'Buy Now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
