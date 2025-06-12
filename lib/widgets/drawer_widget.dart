import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final horizontalPadding = screenWidth * 0.03; // 3% de la largeur
    final verticalPadding = screenHeight * 0.06;  // 2% de la hauteur

    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        children: const [
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            title: Text('About Us'),
            leading: Icon(Icons.info),
          ),
          ListTile(
            title: Text('Historie'),
            leading: Icon(Icons.history),
          ),
        ],
      ),
    );
  }
}

