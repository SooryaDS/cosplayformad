import 'package:flutter/material.dart';
import 'register.dart'; // Ensure this is the correct path to your register.dart file
import 'package:flutter/services.dart'; // Import the services.dart for controlling system UI

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setSystemUIMode(); // Call the UI mode setter on dependencies change
  }

  @override
  void didUpdateWidget(LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setSystemUIMode(); // Call the UI mode setter on widget update
  }

  // Function to handle UI mode changes based on orientation
  void _setSystemUIMode() {
    var orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: MediaQuery.of(context).orientation == Orientation.portrait
          ? AppBar(
        title: const Text('Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      )
          : null, // No AppBar in landscape mode
      body: Center(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? _buildPortraitLayout(isDarkMode)
            : _buildLandscapeLayout(isDarkMode),
      ),
    );
  }

  // Portrait layout
  Widget _buildPortraitLayout(bool isDarkMode) {
    return Container(
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
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Welcome to CosplayCove',
              style: TextStyle(
                color: isDarkMode ? const Color(0xFF6A0DAD) : const Color(0xFFFFC1E3),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            _buildTextField(label: 'Email', isDarkMode: isDarkMode, keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 8),
            _buildTextField(label: 'Password', isDarkMode: isDarkMode, isPassword: true),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              child: const Text("Don't have an account?"),
            ),
          ],
        ),
      ),
    );
  }

  // Landscape layout
  Widget _buildLandscapeLayout(bool isDarkMode) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 400, // Set the height for landscape mode
      child: Row(
        children: [
          Expanded(
            flex: 1, // Set the flex to 1 to allow the logo to occupy more space
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(
                    'image/logo.png', // Ensure this path is correct
                    height: 150, // Increase the height of the logo
                    width: 300, // Increase the width of the logo
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Welcome to CosplayCove',
                  style: TextStyle(
                    color: isDarkMode ? const Color(0xFF6A0DAD) : const Color(0xFFFFC1E3),
                    fontWeight: FontWeight.bold,
                    fontSize: 28, // Slightly larger text for landscape
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 80), // Add space between columns
          Expanded(
            flex: 2, // Set the flex to 2 to balance the text fields and logo
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTextField(label: 'Email', isDarkMode: isDarkMode, keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 8),
                  _buildTextField(label: 'Password', isDarkMode: isDarkMode, isPassword: true),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 180,
                    height: 40,
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        Navigator.pushNamed(context, 'home');
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child: const Text("Don't have an account?"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build text fields with conditional color based on theme
  Widget _buildTextField({
    required String label,
    required bool isDarkMode,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.pink[100] : Colors.blue[100], // Light pink in dark mode, light blue in light mode
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          border: InputBorder.none,
        ),
        keyboardType: keyboardType,
        obscureText: isPassword,
        style: const TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.pink[200],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.purple[900],
      ),
      themeMode: ThemeMode.system,
      home: const LoginScreen(),
    ),
  );
}
