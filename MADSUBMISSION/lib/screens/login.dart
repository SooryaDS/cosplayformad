import 'package:flutter/material.dart';
import 'register.dart'; // Ensure this is the correct path to your register.dart file

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;
    var orientation = mediaQuery.orientation;

    return MaterialApp(
      theme: ThemeData.light(), // Set light theme
      darkTheme: ThemeData.dark(), // Set dark theme
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Loginn Page'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            width: orientation == Orientation.portrait
                ? screenWidth * 0.9
                : screenWidth * 0.6,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'image/logo.png', // Ensure this path is correct
                    height: 100,
                    width: 500, // Adjust the height as needed
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Welcome to CosplayCove',
                      style: TextStyle(
                        fontFamily: "SpicyRice-Regular", // Ensure you have this font added to your pubspec.yaml
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: InputBorder.none,
                      ),
                      obscureText: true,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      child: Text('Login'),
                      onPressed: () {
                        Navigator.pushNamed(context, 'home');
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child: Text("Don't have an account?"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      routes: {
        'register': (context) => RegisterScreen(), // Add your RegisterScreen route here
      },
    );
  }
}

void main() {
  runApp(LoginScreen());
}

