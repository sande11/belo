import 'package:belo/models/cart.dart';
import 'package:belo/pages/account_page.dart';
import 'package:belo/pages/forget_password_page.dart';

import 'package:belo/pages/intro_page.dart';
import 'package:belo/pages/signup_page.dart';

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
          '/forgotPassword': (context) => const ForgetPassword(),
          '/signup': (context) => const SignupPage(),
          '/myaccount': (context) => const AccountPage()
        },
      ),
    );
  }
}
