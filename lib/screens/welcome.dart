import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.height > screenSize.width; // Check orientation
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark; // Check for dark mode

    return Scaffold(
      appBar: isPortrait // Show AppBar only in portrait mode
          ? AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        title: Text(''), // Optional: You can also set a blank title
      )
          : null, // Set to null to remove AppBar in landscape mode
      body: isPortrait // Portrait mode layout
          ? Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'image/navia.jpg', // Path to your background image
              fit: BoxFit.cover,
              alignment: Alignment.topCenter, // Align the image to the top center
            ),
          ),
          Center(
            child: Container(
              width: screenSize.width * 0.8, // Fixed width for portrait
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.purple[800]?.withOpacity(0.8) // Dark purple with transparency
                    : Colors.pink[100]?.withOpacity(0.8), // Light pink with transparency
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: Offset(0, 5), // Shadow position
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset(
                      'image/logo.png', // Path to your logo image
                      height: 100, // Fixed height for portrait
                    ),
                    SizedBox(height: 20),
                    // Welcome text
                    Text(
                      'Welcome to CosplayCove',
                      style: TextStyle(
                        fontSize: 22, // Fixed font size for portrait
                        color: isDarkMode ? Colors.white : Colors.pink[800], // Change text color based on theme
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    // Tagline
                    Text(
                      'Transform into Your Favorite Character with Ease',
                      style: TextStyle(
                        fontSize: 16, // Fixed font size for portrait
                        color: isDarkMode ? Colors.grey[300] : Colors.pink[600], // Change text color based on theme
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    // Login button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[400], // Button color
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // Rounded corners
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 16, color: Colors.white), // Text color
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                    ),
                    SizedBox(height: 10),
                    // Register button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[400], // Button color
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // Rounded corners
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 16, color: Colors.white), // Text color
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                      },
                    ),
                    SizedBox(height: 30),
                    // Footer or additional info
                    Text(
                      '© 2024 CosplayCove. All rights reserved.',
                      style: TextStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.grey[300] : Colors.grey[600], // Change footer color based on theme
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
          : Row(
        children: [
          // Background image
          Expanded(
            flex: 1, // Adjusted flex for the image to take up less space
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('image/navia.jpg'), // Path to your background image
                  fit: BoxFit.cover, // Ensure the image covers the space
                  alignment: Alignment.topCenter, // Align the image to the top center
                ),
              ),
            ),
          ),
          // Main content container
          Expanded(
            flex: 1, // Make the container take up half the screen
            child: Center(
              child: Container(
                width: screenSize.width * 0.5, // Make the container wider
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? Colors.purple[800]
                      : Colors.pink[100], // Dark purple for dark mode, light pink for light mode
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(0, 5), // Shadow position
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      Image.asset(
                        'image/logo.png', // Path to your logo image
                        height: 80, // Adjust height based on orientation
                      ),
                      SizedBox(height: 20),
                      // Welcome text
                      Text(
                        'Welcome to CosplayCove',
                        style: TextStyle(
                          fontSize: 20, // Adjusted font size for landscape
                          color: isDarkMode ? Colors.white : Colors.pink[800], // Change text color based on theme
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      // Tagline
                      Text(
                        'Transform into Your Favorite Character with Ease',
                        style: TextStyle(
                          fontSize: 14, // Adjusted font size for landscape
                          color: isDarkMode ? Colors.grey[300] : Colors.pink[600], // Change text color based on theme
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      // Login button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[400], // Button color
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12), // Padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Rounded corners
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 16, color: Colors.white), // Text color
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        },
                      ),
                      SizedBox(height: 10),
                      // Register button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[400], // Button color
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12), // Padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Rounded corners
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 16, color: Colors.white), // Text color
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'register');
                        },
                      ),
                      SizedBox(height: 30),
                      // Footer or additional info
                      Text(
                        '© 2024 CosplayCove. All rights reserved.',
                        style: TextStyle(
                          fontSize: 12,
                          color: isDarkMode ? Colors.grey[300] : Colors.grey[600], // Change footer color based on theme
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
