import 'package:belo/components/purchase_option_form.dart';
import 'package:belo/models/product.dart';
import 'package:flutter/material.dart';

class GridTiles extends StatelessWidget {
  final Product product;
  const GridTiles({super.key, required this.product});

  void showPurchaseOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return PurchaseOptionsForm(product: product);
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // Ensures the Column takes only required space
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.images.isNotEmpty ? product.images[0] : '',
              height: 102, // Fixed height to maintain uniformity
              width: 170, // Fixed width for consistency
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 110,
                width: 170,
                color: Colors.grey[300],
                child: const Icon(Icons.error, color: Colors.red),
              ), // Displays a placeholder if the image fails to load
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: Text(
              product.description,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // Prevents overflow of the Column content
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'K${product.price}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => showPurchaseOptions(context),
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
