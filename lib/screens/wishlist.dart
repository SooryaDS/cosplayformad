import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<String> imagePaths = [
    'image/jjk.jpg', 'image/furiwig.jpg', 'image/narutoheadband.jpg',
    'image/item4.jpg', 'image/item5.jpg', 'image/item6.jpg'
  ];

  final List<String> titles = [
    'Yuuji Cosplay', 'Furina Wig', 'Naruto Headband',
    'Item 4', 'Item 5', 'Item 6'
  ];

  final List<String> prices = [
    '\$50', '\$30', '\$5',
    '\$40', '\$25', '\$35'
  ];

  final List<String> descriptions = [
    'Full Costume for Yuuji. Return within 3 months', 'Furina Wig, please return within 6 months', 'Headband from Naruto',
    'A wonderful item from show/game 4', 'An awesome product from show/game 5', 'A cool thing from show/game 6'
  ];

  final List<String> fromShows = [
    'Jujutsu Kaisen', 'Genshin Impact', 'Naruto',
    'Show/Game 4', 'Show/Game 5', 'Show/Game 6'
  ];

  final List<String> availability = [
    'Available now', 'Available in 2 weeks', 'Available next month',
    'Out of stock', 'Available now', 'Available next week'
  ];

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    // Define colors for the app bar and bottom nav bar based on theme
    Color appBarColor = Theme.of(context).brightness == Brightness.light
        ? Colors.purple[800]! // Dark Purple in Light Mode
        : Colors.pink[800]!; // Dark Pink in Dark Mode

    Color bottomNavBarColor = Theme.of(context).brightness == Brightness.light
        ? Colors.purple[800]! // Dark Purple in Light Mode
        : Colors.pink[800]!; // Dark Pink in Dark Mode

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: Text('Wishlist'),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: GridView.builder(
          padding: const EdgeInsets.all(15.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: orientation == Orientation.portrait ? 0.75 : 0.8,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.grey[300]!, width: 1.0),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: orientation == Orientation.portrait ? 230 : 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                          image: DecorationImage(
                            image: AssetImage(imagePaths[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titles[index],
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              prices[index],
                              style: TextStyle(fontSize: 14.0, color: Colors.green),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              descriptions[index],
                              style: TextStyle(fontSize: 12.0, color: Colors.blueAccent),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              fromShows[index],
                              style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              availability[index],
                              style: TextStyle(fontSize: 12.0, color: Colors.redAccent),
                            ),
                            SizedBox(height: 2.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle rent action
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                                        child: Text('Rent'),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle reserve action
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                                        child: Text('Reserve'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: 2,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white60,
        backgroundColor: bottomNavBarColor, // Use dynamic color
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 3) {
            Navigator.pushReplacementNamed(context, 'profile');
          }
          if (index == 2) {
            Navigator.pushReplacementNamed(context, 'wishlist');
          }
          if (index == 1) {
            Navigator.pushReplacementNamed(context, 'explore');
          }
          if (index == 0) {
            Navigator.pushReplacementNamed(context, 'home');
          }
        },
      ),
    );
  }
}
