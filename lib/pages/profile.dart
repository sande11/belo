import 'package:belo/logic/auth.dart';
import 'package:belo/pages/account_page.dart';
import 'package:belo/pages/cart_page.dart';
import 'package:belo/pages/favorites_page.dart';
import 'package:belo/pages/shop_page.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    ShopPage(),
    const CartPage(),
    const AccountPage(),
    const FavoritesPage(),
    const Profile(), // Add Profile page to navigation
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[900],
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                    // color: Colors.black, // Header with contrast
                    ),
                child: Image.asset(
                  'assets/images/technology.png',
                  color: Colors.white,
                  width: 150,
                ),
              ),
              // Home Item
              ListTile(
                leading: const Icon(Icons.home, color: Colors.white),
                title:
                    const Text('Home', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              // Cart Item
              ListTile(
                leading: const Icon(Icons.shopping_cart, color: Colors.white),
                title:
                    const Text('Cart', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              // Profile Item
              ListTile(
                leading: const Icon(Icons.person, color: Colors.white),
                title: const Text('Profile',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              // Support Item
              ListTile(
                leading: const Icon(Icons.support, color: Colors.white),
                title: const Text('Support',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              // Logout Item
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title:
                    const Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('Name'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await AuthService().signOut(); // Calling sign-out from auth.dart
            Navigator.pushReplacementNamed(context,
                '/myaccount'); // After sign-out, navigate to the login screen
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.logout),
        ));
  }
}
