import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // Set light theme
      darkTheme: ThemeData.dark(), // Set dark theme
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      'image/logo.png', // Ensure this path is correct
                      height: 100,
                      width: 200, // Adjust the size as needed
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Welcome to CosplayCove',
                    style: TextStyle(
                      color: Colors.pinkAccent, // Use theme color
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Full Name field
                  _buildTextField(label: 'Fll Name'),
                  const SizedBox(height: 10),

                  // Email field
                  _buildTextField(label: 'Email', keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 10),

                  // Phone Number field
                  _buildTextField(label: 'Phone Number', keyboardType: TextInputType.phone),
                  const SizedBox(height: 10),

                  // Address field
                  _buildTextField(label: 'Address'),
                  const SizedBox(height: 10),

                  // Date of Birth field
                  _buildTextField(label: 'Date of Birth', keyboardType: TextInputType.datetime),
                  const SizedBox(height: 10),

                  // Password field
                  _buildTextField(label: 'Password', isPassword: true),
                  const SizedBox(height: 10),

                  // Confirm Password field
                  _buildTextField(label: 'Confirm Password', isPassword: true),
                  const SizedBox(height: 20),

                  // Register button
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      child: const Text('Register'),
                      onPressed: () {
                        Navigator.pushNamed(context, 'home');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build text fields
  Widget _buildTextField({required String label, TextInputType keyboardType = TextInputType.text, bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
        keyboardType: keyboardType,
        obscureText: isPassword,
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }
}

void main() {
  runApp(const RegisterScreen());
}
