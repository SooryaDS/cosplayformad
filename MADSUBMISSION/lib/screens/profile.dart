import 'package:flutter/material.dart';
import 'welcome.dart'; // Import the welcome.dart file if it's in a different directory
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // Set light theme
      darkTheme: ThemeData.dark(), // Set dark theme
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          centerTitle: true,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40), // Add padding above the profile picture
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
                Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.phone_android, size: 24),
                          SizedBox(width: 5),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: 250,
                      height: 50, // Adjust the height and width as needed
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          '0123456789',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.email, size: 24),
                          SizedBox(width: 5),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: 250,
                      height: 50, // Adjust the width as needed
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'lilly@gmail.com',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Add additional spacing at the bottom
              ],
            ),
          ),
        ),
        bottomNavigationBar: MediaQuery.of(context).orientation == Orientation.portrait
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
          currentIndex: 3, // Set the initial selected index to the Profile tab
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white60,
          backgroundColor: Colors.brown, // Set the background color to brown
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == 3) {
              // Do nothing if already on Profile tab
            } else if (index == 2) {
              Navigator.pushReplacementNamed(context, 'wishlist');
            } else if (index == 1) {
              Navigator.pushReplacementNamed(context, 'explore');
            } else if (index == 0) {
              Navigator.pushReplacementNamed(context, 'home');
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
              color: Colors.white60, // Set the star icon to white
            ),
            IconButton(
              onPressed: () {
                // Do nothing if already on Profile tab
              },
              icon: Icon(Icons.account_circle),
              color: Colors.yellow, // Set the profile icon to yellow
            ),
          ],
        ),
      ),
    );
  }
}
