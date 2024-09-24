import 'package:belo/models/cart.dart';
import 'package:belo/pages/account_page.dart';
import 'package:belo/pages/intro_page.dart';
import 'package:belo/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
         routes: {
        AccountPage.routeName: (context) => const AccountPage(),
        LoginScreen.routeName: (context) => const LoginScreen(),
      },
      ),
    );
  }
}
