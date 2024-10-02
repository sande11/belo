import 'package:belo/models/product.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.shoeList});

  final List<Shoe> shoeList;

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  String searchQuery = '';
  List<Shoe> filteredShoes = [];

  @override
  void initState() {
    super.initState();
    filteredShoes = widget.shoeList;
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredShoes = widget.shoeList.where((shoe) {
        return shoe.name.toLowerCase().contains(query.toLowerCase());
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
          // Search input field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Find your next fashion statement...',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) =>
                  updateSearchQuery(query), // Update search query
            ),
          ),
          // Search results
          Expanded(
            child: ListView.builder(
              itemCount: filteredShoes.length,
              itemBuilder: (context, index) {
                Shoe shoe = filteredShoes[index];

                return ListTile(
                  title: Text(shoe.name),
                  subtitle: Text(shoe.price),
                  leading: Image.asset(shoe.imagePath,
                      width: 120, height: 120, fit: BoxFit.cover),
                  onTap: () {
                    // Navigate to shoe details or take some action
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
