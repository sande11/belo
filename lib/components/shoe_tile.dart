import 'package:belo/components/purchase_option_form.dart';
import 'package:belo/models/product.dart';
import 'package:flutter/material.dart';

class ShoeTile extends StatelessWidget {
  final Product product;
  const ShoeTile({super.key, required this.product});

  // Function to display bottom sheet for adding to cart or buying now
  void showPurchaseOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return PurchaseOptionsForm(
            product: product); // Pass the shoe details to the form
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
      margin: const EdgeInsets.only(left: 25, right: 5),
      width: 280,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.images.isNotEmpty ? product.images[0] : '',
              height: 247,
              width: 280,
              fit: BoxFit.cover,
            )),
        Text(
          product.description,
          style: TextStyle(color: Colors.grey[600]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'K${product.price}',
                    style: const TextStyle(color: Colors.black),
                  )
                ],
              ),
              GestureDetector(
                onTap: () => showPurchaseOptions(context),
                child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        )
      ]),
    );
  }
}
