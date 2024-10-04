import 'package:flutter/material.dart';

void main() {
  runApp(CosplayCoveApp());
}

class CosplayCoveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.brown[500],
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.brown[500],
        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CosplayCove'),
          backgroundColor: Colors.brown, // Set the background color to brown
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Implement search functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Implement menu functionality
              },
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Popular Today'),
              Tab(text: 'Upcoming Conventions'),
            ],
            indicatorColor: Colors.yellow,
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            HomeTab(),
            UpcomingConventionsTab(),
          ],
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
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white60,
          backgroundColor: Colors.brown,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, 'home');
                break;
              case 1:
                Navigator.pushNamed(context, 'explore');
                break;
              case 2:
                Navigator.pushNamed(context, 'wishlist');
                break;
              case 3:
                Navigator.pushNamed(context, 'profile');
                break;
            }
          },
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var imageWidth = isPortrait ? 300.0 : 800.0;

    return Container(
      color: Theme.of(context).backgroundColor,
      child: ListView(
        children: [
          Section(
            title: 'New Release',
            items: [
              MovieCard(imagePath: 'image/genshin.jpg', title: 'Genshin Impact', width: imageWidth),
              MovieCard(imagePath: 'image/valorant.jpg', title: 'Valorant', width: imageWidth),
            ],
          ),
          Section(
            title: 'Made for You',
            items: [
              MovieCard(imagePath: 'image/bleach.jpg', title: 'Bleach', width: imageWidth),
              MovieCard(imagePath: 'image/jjk.jpg', title: 'Jujutsu Kaisen', width: imageWidth),
            ],
          ),
          Section(
            title: 'Popular on CosplayCove',
            items: [
              MovieCard(imagePath: 'image/demslay.jpg', title: 'Demon Slayer', width: imageWidth),
              MovieCard(imagePath: 'image/batman.jpg', title: 'Batman', width: imageWidth),
            ],
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List<Widget> items;

  Section({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  // Handle menu selection
                  print("Selected: $value");
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'wigs',
                      child: Text('Wigs'),
                    ),
                    PopupMenuItem<String>(
                      value: 'dresses',
                      child: Text('Dresses'),
                    ),
                    PopupMenuItem<String>(
                      value: 'boots',
                      child: Text('Boots'),
                    ),
                    PopupMenuItem<String>(
                      value: 'animes',
                      child: Text('Animes'),
                    ),
                    PopupMenuItem<String>(
                      value: 'tv_shows',
                      child: Text('TV Shows'),
                    ),
                    PopupMenuItem<String>(
                      value: 'movies',
                      child: Text('Movies'),
                    ),
                  ];
                },
                child: Text(
                  'View More',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: items,
          ),
        ),
      ],
    );
  }
}

class MovieCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double width;

  MovieCard({required this.imagePath, required this.title, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 500,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class UpcomingConventionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var imageWidth = isPortrait ? 300.0 : 800.0;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: ListView(
          children: [
            ConventionSection(
              title: 'THIS MONTH',
              items: [
                ConventionCard(imagePath: 'image/comicon.png', title: 'Comic Con', width: imageWidth),
                ConventionCard(imagePath: 'image/animexpo.png', title: 'Anime Expo', width: imageWidth),
              ],
            ),
            ConventionSection(
              title: 'COMING SOON!!',
              items: [
                ConventionCard(imagePath: 'image/supernova.png', title: 'Supanova Comic-Con & Gaming', width: imageWidth),
                ConventionCard(imagePath: 'image/fanexpo.png', title: 'Fan Expo Denver', width: imageWidth),
              ],
            ),
            ConventionSection(
              title: 'Later this year',
              items: [
                ConventionCard(imagePath: 'image/arma.jpg', title: 'Armageddon Expo Auckland', width: imageWidth),
                ConventionCard(imagePath: 'image/animecon.png', title: 'AnimeCon', width: imageWidth),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ConventionSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  ConventionSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: items,
          ),
        ),
      ],
    );
  }
}

class ConventionCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double width;

  ConventionCard({required this.imagePath, required this.title, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        margin: const EdgeInsets.all(5.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Container(
    width: 500,
    height: 150,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    image: DecorationImage(
    image: AssetImage(imagePath),
    fit: BoxFit.cover,
    ),
    ),
    ),
    SizedBox(height: 5),
    Text(
    title,
    style: TextStyle(
    fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    ),
    ],
    ),
    );
  }
}

