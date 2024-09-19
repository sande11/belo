import 'package:belo/components/shoe_tile.dart';
import 'package:belo/models/shoe.dart';
import 'package:belo/pages/search_page.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  ShopPage({super.key});
  // Sample shoe list defined within the page
  final List<Shoe> shoeList = [
    Shoe(
      name: 'Air Jordan',
      price: 'K54,000',
      imagePath: 'assets/images/air jordan green.jpg',
      description: 'Cool shoe',
    ),
    Shoe(
      name: 'Nike Air Max',
      price: 'K65,000',
      imagePath: 'assets/images/air jordan red.jpg',
      description: 'Stylish shoe',
    ),
    // Add more shoes...
  ];

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
                  builder: (context) => SearchPage(shoeList: shoeList)),
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Fashions fade, style is eternal',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),

        // top picks
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
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        Expanded(
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Shoe shoe = Shoe(
                      name: 'Air Jordan',
                      price: 'K54,000',
                      imagePath: 'assets/images/air jordan red.jpg',
                      description: 'cool shoe');

                  return ShoeTile(
                    // create a shoe
                    shoe: shoe,
                  );
                })),
        const Padding(
          padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
          child: Divider(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
