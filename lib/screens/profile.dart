import 'package:flutter/material.dart';
import 'welcome.dart'; // Import the welcome.dart file if it's in a different directory
import 'editprofile.dart'; // Import the editprofile.dart file for EditProfileScreen

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine if the device is in portrait mode
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    // Get the current theme mode (light or dark)
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Set the app bar color based on theme
    Color appBarColor = isDarkMode ? Colors.pink[900]! : Colors.purple[900]!; // Dark pink for dark mode, dark purple for light mode

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
        backgroundColor: appBarColor, // Set app bar color based on theme
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()), // Navigate to WelcomeScreen on logout
              );
            },
            icon: Icon(Icons.logout),
            color: Colors.blueGrey, // Add logout icon button
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40), // Padding above the profile picture
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 5),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('image/image5.png'), // Assuming image5.png is in the assets folder
                  radius: 100.0,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Lilly Grayson',
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileScreen()), // Navigate to EditProfileScreen
                  );
                },
                child: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline), // Styling
                ),
              ),
              SizedBox(height: 30),
              _buildInfoRow(context, Icons.phone_android, '0123456789', isDarkMode),
              SizedBox(height: 10),
              _buildInfoRow(context, Icons.email, 'lilly@gmail.com', isDarkMode),
              SizedBox(height: 10),
              _buildInfoRow(context, Icons.home, '123 Main St', isDarkMode),
              SizedBox(height: 20), // Additional spacing at the bottom
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, isPortrait, isDarkMode),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String infoText, bool isDarkMode) {
    // Use light blue for light mode and light pink for dark mode
    Color fieldColor = isDarkMode ? Colors.pink[100]! : Colors.lightBlue[100]!;

    return Container(
      width: 300, // Adjust container width
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(icon, size: 29), // Icon placed in the same container
          SizedBox(width: 7),  // Spacing between icon and text
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: fieldColor, // Set background color based on theme
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                infoText,
                style: TextStyle(fontSize: 18, color: Colors.black), // Set text color to black
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, bool isPortrait, bool isDarkMode) {
    // Set the bottom navigation bar color based on theme
    Color bottomNavBarColor = isDarkMode ? Colors.pink[900]! : Colors.purple[900]!; // Dark pink for dark mode, dark purple for light mode

    return isPortrait
        ? BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: 3, // Set to Profile tab
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.white60,
      backgroundColor: bottomNavBarColor, // Set bottom navigation bar color based on theme
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index != 3) {
          Navigator.pushReplacementNamed(context, ['home', 'explore', 'wishlist'][index]);
        }
      },
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
          icon: Icon(Icons.home),
          color: Colors.white60,
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'explore');
          },
          icon: Icon(Icons.search),
          color: Colors.white60,
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'wishlist');
          },
          icon: Icon(Icons.star),
          color: Colors.white60,
        ),
        IconButton(
          onPressed: () {
            // Already on Profile tab
          },
          icon: Icon(Icons.account_circle),
          color: Colors.yellow, // Highlight Profile tab
        ),
      ],
    );
  }
}
