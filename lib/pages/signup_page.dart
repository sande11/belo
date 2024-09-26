import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;
    false; // Dummy condition to check if the user is logged in

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                leading: const Icon(Icons.home, color: Colors.white),
                title:
                    const Text('Home', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            // Cart Item
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                leading: const Icon(Icons.shopping_cart, color: Colors.white),
                title:
                    const Text('Cart', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            // Profile Item
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.white),
                title: const Text('Profile',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),

            // Support Item (at the bottom)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                leading: const Icon(Icons.support, color: Colors.white),
                title: const Text('Support',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Navigate to Support
                  Navigator.pop(context);
                },
              ),
            ),

            // Logout Item (at the bottom)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title:
                    const Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle Logout action
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Text(
            //   'My Account',
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 24,
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            // Check if the user is logged in
            const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'name',
                          hintText: 'Enter your name'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
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
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                          hintText: 'Comfirm password'),
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
                            'Sign Up',
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
                  GestureDetector(
                    onTap: () {
                     Navigator.pop(context);
                    },
                    child: const Center(
                        child: Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                  const SizedBox(
                    height: 20,
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
