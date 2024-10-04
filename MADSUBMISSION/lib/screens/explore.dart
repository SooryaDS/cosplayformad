import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<String> imagePaths = [
    'image/arma.jpg', 'image/animecon.png', 'image/bleach.jpg',
    'image/batman.jpg', 'image/comicon.png', 'image/genshin.jpg',
    'image/jjk.jpg', 'image/supernova.png', 'image/valorant.jpg',
    'image/naruto.jpg', 'image/arcane.jpg', 'image/chainsaw.jpg'
  ];

  final List<String> titles = [
    'Arma..', 'Animecon', 'Bleach',
    'batman', 'Comicon', 'genshin',
    'jjk', 'supernova', 'valorant',
    'naruto', 'arcane', 'chainsaw man'
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back arrow
        backgroundColor: Colors.brown[500],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
            ),
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor, // Changed to dynamically adjust to theme mode
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('anime'),
                    _buildFilterChip('tv shows'),
                    _buildFilterChip('movies'),
                    _buildFilterChip('wigs'),
                    _buildFilterChip('shoes'),
                    _buildFilterChip('accessories'),
                    _buildFilterChip('dresses'),
                    _buildFilterChip('suits'),
                    _buildFilterChip('merch'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: imagePaths.length, // Number of items in the grid
                itemBuilder: (context, index) {
                  if (titles[index].toLowerCase().contains(searchQuery.toLowerCase())) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(imagePaths[index]), // Change to your image paths
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.black54,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            titles[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(); // Return an empty container if the search query doesn't match
                  }
                },
              ),
            ),
          ],
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
        currentIndex: 1, // Set the initial selected index to the Explore tab
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white60,
        backgroundColor: Colors.brown[800],
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

  Widget _buildFilterChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: FilterChip(
        label: Text(label),
        onSelected: (bool selected) {
          // Handle filter chip selection
        },
      ),
    );
  }
}
