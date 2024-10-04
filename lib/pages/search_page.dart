import 'package:belo/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required Type product,});


  @override
  SearchPageState createState() => SearchPageState();
}
class SearchPageState extends State<SearchPage> {
  String searchQuery = '';
  List<Product> productList = [];
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  // Fetch products from Firestore
  Future<void> fetchProducts() async {
    CollectionReference products = FirebaseFirestore.instance.collection('products');

    // Get all products
    QuerySnapshot snapshot = await products.get();
    
    // setState(() {
    //   productList = snapshot.docs.map((doc) {
    //     return Product(
    //       name: doc['name'],
    //       price: doc['price'],
    //       description: doc['description'],
    //       images: List<String>.from(doc['images']),
    //     );
    //   }).toList();
    //   filteredProducts = productList; // Initially, display all products
    // });
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredProducts = productList.where((product) {
        return product.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Find your next fashion statement...',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) => updateSearchQuery(query),
            ),
          ),
          // Display search results
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(child: Text('No products found.'))
                : ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      Product product = filteredProducts[index];

                      return ListTile(
                        title: Text(product.name),
                        subtitle: Text(product.price.toString()),
                        leading: Image.network(product.images[0],
                            width: 120, height: 120, fit: BoxFit.cover),
                        onTap: () {
                          // Add action for clicking the product
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
