import 'package:belo/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // Controllers for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Boolean for loading state
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    // If the user is logged in, show a card with their name and a logout button
    if (user != null) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          // Allow scrolling if overflow occurs
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Profile Card
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                  child: Container(
                    width: double.infinity, // Full width
                    height: 400, // Specific height
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, ${user.displayName ?? 'User'}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Profile section links
                        ListTile(
                          leading: const Icon(Icons.history),
                          title: const Text('Order History'),
                          onTap: () {
                            // Navigate to Order History Page
                            Navigator.pushNamed(context, '/orderHistory');
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.account_circle),
                          title: const Text('Account Settings'),
                          onTap: () {
                            // Navigate to Account Settings Page
                            Navigator.pushNamed(context, '/accountSettings');
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.location_on),
                          title: const Text('Saved Addresses'),
                          onTap: () {
                            // Navigate to Saved Addresses Page
                            Navigator.pushNamed(context, '/savedAddresses');
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.payment),
                          title: const Text('Payment Methods'),
                          onTap: () {
                            // Navigate to Payment Methods Page
                            Navigator.pushNamed(context, '/paymentMethods');
                          },
                        ),

                        const SizedBox(height: 20),

                        // Logout Button
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              setState(() {
                                // Refresh UI after logout
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                            ),
                            child: const Text(
                              'Logout',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // If not logged in, display the login form
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        // Allow scrolling if overflow occurs
        child: Padding(
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
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email address',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                        ),
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });

                          String email = _emailController.text;
                          String password = _passwordController.text;

                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                                    email: email, password: password);

                            if (userCredential.user != null) {
                              setState(() {
                                // Refresh UI after login
                              });
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login failed: $e')),
                            );
                          }

                          setState(() {
                            _isLoading = false;
                          });
                        },
                        child: const Center(
                          child: Text(
                            'Log in',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  ).then((value) {
                    if (value != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(value)),
                      );
                    }
                  });
                },
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/forgotPassword');
                },
                child: const Center(
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
