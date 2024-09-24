import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  static String routeName = '/account';

  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;
    false; // Dummy condition to check if the user is logged in

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Check if the user is logged in

            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'email',
                          hintText:
                              'Enter valid email address as abc@gmail.com'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter secure password'),
                    ),
                  ),
                  SizedBox(
                    height: 65,
                    width: 280,
                    child: Container(
                      color: Colors
                          .grey[300], // Set your desired background color here
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.black, // Button background color
                          ),
                          child: const Text(
                            'Log in',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            // Add your onPressed logic here
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(child: Text('Sign Up')),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text('Forgot your password ? '),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
