import 'package:flutter/material.dart';
import 'package:mad_assignment/screens/prodinfo.dart';
import 'package:mad_assignment/screens/theme.dart';
import 'package:mad_assignment/screens/welcome.dart';
import 'package:mad_assignment/screens/login.dart';
import 'package:mad_assignment/screens/register.dart';
import 'package:mad_assignment/screens/home.dart';
import 'package:mad_assignment/screens/profile.dart';
import 'package:mad_assignment/screens/wishlist.dart';
import 'package:mad_assignment/screens/explore.dart';
import 'package:mad_assignment/screens/editprofile.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Light and Dark themes
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: GoogleFonts.roboto().fontFamily,
        scaffoldBackgroundColor: Colors.pink[100], // Light pink background for light mode
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.purple[900], // Dark purple background for dark mode
      ),
      themeMode: ThemeMode.system, // System theme based on device settings

      initialRoute: 'welcome',
      routes: {
        'welcome': (context) => WelcomeScreen(),
        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
        'home': (context) => HomeScreen(),
        'profile': (context) => ProfileScreen(),
        'prodinfo': (context) => ProdinfoScreen(),
        'wishlist': (context) => WishlistScreen(),
        'explore': (context) => ExploreScreen(),
        'editprofile':(context)=>EditProfileScreen(),
      },
    );
  }
}
