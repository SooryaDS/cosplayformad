import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false, // Removes the back button
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'image/navia.jpg', // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white60, // Grey container color
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Blue container
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.pink[200], // Blue container color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // Logo
                          Image.asset(
                            'image/logo.png', // Path to your logo image
                            height: 100, // Adjust the height as needed
                          ),
                          SizedBox(height: 10),
                          // Welcome text
                          Text(
                            'Welcome to CosplayCove',
                            style: TextStyle(fontSize: 18, color: Colors.blue[500], fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          // Tagline
                          Text(
                            'Transform into Your Favorite Character with Ease',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          // Login and register buttons
                          ElevatedButton(
                            child: Text('Login'),
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            child: Text('Register'),
                            onPressed: () {
                              Navigator.pushNamed(context, 'register');
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
