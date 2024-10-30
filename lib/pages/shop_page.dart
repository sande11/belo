import 'package:belo/components/grid_tile.dart';
import 'package:belo/components/shoe_tile.dart';

import 'package:belo/models/product.dart';
import 'package:belo/pages/search_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  ShopPage({super.key});

  // referencing to the Firestore collection
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to the Search Page
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SearchPage(product: Product)),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search'),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Fashions fade, style is eternal',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                // Top Picks
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Top Picks',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'see all',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Horizontal List of Products
                SizedBox(
                  height: 331,
                  child: StreamBuilder(
                    stream: productCollection.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      // Convert Firestore data to List of Products
                      List<Product> products = snapshot.data!.docs.map((doc) {
                        return Product.fromMap(
                            doc.data() as Map<String, dynamic>, doc.id);
                      }).toList();

                      return ListView.builder(
                        itemCount: products.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Product product = products[index];
                          return ShoeTile(product: product);
                        },
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                // All products
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'All Products',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: StreamBuilder(
                      stream: productCollection.snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        // Convert Firestore data to List of Products
                        List<Product> products = snapshot.data!.docs.map((doc) {
                          return Product.fromMap(
                              doc.data() as Map<String, dynamic>, doc.id);
                        }).toList();

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 10,
                            childAspectRatio:
                                0.95, // Adjust for tile dimensions
                          ),
                          itemBuilder: (context, index) {
                            Product product = products[index];
                            return GridTiles(product: product);
                          },
                        );
                      },
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
