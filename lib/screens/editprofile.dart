import 'package:flutter/material.dart';
import 'profile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _isEditing = true; // To track whether we are editing or viewing the profile

  @override
  Widget build(BuildContext context) {
    // Determine the orientation
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    // Get the current theme mode (light or dark)
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Set the app bar color based on theme (dark pink for dark mode, dark purple for light mode)
    Color appBarColor = isDarkMode ? Colors.pink[900]! : Colors.purple[900]!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: appBarColor, // Set app bar color based on theme
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor, // Set background color based on theme
        height: MediaQuery.of(context).size.height, // Ensure it covers full height
        child: SingleChildScrollView(
          child: Center(
            child: _isEditing ? _buildEditProfile(isPortrait) : ProfileScreen(), // Show edit or profile screen based on the state
          ),
        ),
      ),
    );
  }

  Widget _buildEditProfile(bool isPortrait) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start, // Align items at the start
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
        SizedBox(height: 20),
        _buildTextField(context, Icons.person, 'Name', 'Lilly Grayson'),
        SizedBox(height: 10),
        _buildTextField(context, Icons.email, 'Email', 'lilly@gmail.com'),
        SizedBox(height: 10),
        _buildTextField(context, Icons.home, 'Address', '123 Main St'),
        SizedBox(height: 10),
        _buildTextField(context, Icons.phone_android, 'Phone Number', '0123456789'),
        SizedBox(height: 20), // Add additional spacing at the bottom
        ElevatedButton(
          onPressed: () {
            // Implement save functionality here
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Changes Saved!')),
            );

            setState(() {
              _isEditing = false; // Switch to profile view after saving
            });
          },
          child: Text('Save Changes'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: isPortrait ? 100 : 150, vertical: 15), // Customize button padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
          ),
        ),
        SizedBox(height: 40), // Add padding below the button
      ],
    );
  }

  Widget _buildTextField(BuildContext context, IconData icon, String labelText, String placeholder) {
    return Container(
      width: 250, // Set a fixed width for the text field
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2), // Border for the entire container
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(icon, size: 24),
          ),
          Expanded( // Use Expanded to fill the remaining space
            child: TextField(
              style: TextStyle(color: Colors.black), // Set text color to black
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(color: Colors.black), // Set hint text color to black
                border: InputBorder.none,
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.dark
                    ? Color(0xFFFFC0CB) // Light pink for dark mode
                    : Color(0xFFADD8E6), // Light blue for light mode
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), // Adjust content padding
              ),
            ),
          ),
        ],
      ),
    );
  }
}
