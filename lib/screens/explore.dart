import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<String> imagePaths = [
    'image/arma.jpg',
    'image/animecon.png',
    'image/bleach.jpg',
    'image/batman.jpg',
    'image/comicon.png',
    'image/genshin.jpg',
    'image/jjk.jpg',
    'image/supernova.png',
    'image/valorant.jpg',
    'image/naruto.jpg',
    'image/arcane.jpg',
    'image/chainsaw.jpg'
  ];

  final List<String> titles = [
    'Arma..',
    'Animecon',
    'Bleach',
    'Batman',
    'Comicon',
    'Genshin',
    'JJK',
    'Supernova',
    'Valorant',
    'Naruto',
    'Arcane',
    'Chainsaw Man'
  ];

  String searchQuery = "";
  bool isSearching = false; // State variable for search bar visibility

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final appBarColor = isDarkMode ? Colors.pink[800] : Colors.purple[800];
    final searchBarColor = isDarkMode ? Color(0xFF001F3F) : Colors.lightBlue[200];
    final searchTextColor = isDarkMode ? Colors.white : Colors.black;

    // Get the current orientation using MediaQuery
    final orientation = MediaQuery.of(context).orientation;

    final List<String> filteredTitles = titles
        .where((title) => title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    final List<String> filteredImagePaths = imagePaths
        .where((path) =>
        titles[imagePaths.indexOf(path)].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    filteredTitles.sort((a, b) {
      bool aStartsWith = a.toLowerCase().startsWith(searchQuery.toLowerCase());
      bool bStartsWith = b.toLowerCase().startsWith(searchQuery.toLowerCase());
      return aStartsWith == bStartsWith ? 0 : aStartsWith ? -1 : 1;
    });

    filteredImagePaths.sort((a, b) {
      bool aStartsWith = titles[imagePaths.indexOf(a)]
          .toLowerCase()
          .startsWith(searchQuery.toLowerCase());
      bool bStartsWith = titles[imagePaths.indexOf(b)]
          .toLowerCase()
          .startsWith(searchQuery.toLowerCase());
      return aStartsWith == bStartsWith ? 0 : aStartsWith ? -1 : 1;
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: Text('Explore'),
        actions: [
          IconButton(
            icon: Icon(
              isSearching ? Icons.close : Icons.search,
              color: isSearching ? Colors.white : Colors.yellow, // Search icon color
            ),
            onPressed: () {
              setState(() {
                isSearching = !isSearching; // Toggle search bar visibility
                if (!isSearching) {
                  searchQuery = ""; // Clear search query when closing
                }
              });
            },
          ),
          if (orientation == Orientation.landscape) ...[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white.withOpacity(0.6)), // Transparent white
              onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
            ),
            IconButton(
              icon: Icon(Icons.star, color: Colors.white.withOpacity(0.6)), // Transparent white
              onPressed: () => Navigator.pushReplacementNamed(context, 'wishlist'),
            ),
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.white.withOpacity(0.6)), // Transparent white
              onPressed: () => Navigator.pushReplacementNamed(context, 'profile'),
            ),
          ],
        ],
        bottom: isSearching // Show search bar only if isSearching is true
            ? PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                fillColor: searchBarColor,
                filled: true,
                prefixIcon: Icon(Icons.search, color: searchTextColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: searchTextColor),
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
            ),
          ),
        )
            : null, // No search bar when not searching
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          int crossAxisCount = orientation == Orientation.portrait ? 2 : 3; // 2 in portrait, 3 in landscape

          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: searchQuery.isNotEmpty ? filteredTitles.length : imagePaths.length,
                    itemBuilder: (context, index) {
                      String title = searchQuery.isNotEmpty ? filteredTitles[index] : titles[index];
                      String imagePath = searchQuery.isNotEmpty ? filteredImagePaths[index] : imagePaths[index];

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5), // Shadow color
                              spreadRadius: 2, // Spread radius
                              blurRadius: 6, // Blur radius
                              offset: Offset(0, 4), // Changes the position of the shadow
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.black54,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 14.0),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: orientation == Orientation.portrait
          ? BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white60), // Transparent white
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.yellow), // Yellow
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Colors.white60), // Transparent white
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.white60), // Transparent white
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white60,
        backgroundColor: appBarColor,
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
      )
          : null, // Set to null in landscape mode
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
