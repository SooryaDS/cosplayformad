import 'package:flutter/material.dart';

class ProdinfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Information Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              iconSize: 50.0,
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
