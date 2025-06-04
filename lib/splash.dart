// splash_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:quantum/core/constants/colors.dart';

class CustomSplashScreen extends StatefulWidget {
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacementNamed('/home');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('lib/assets/quantum.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              "Quantum",
              style: TextStyle(fontSize: 36, color: QuantumColors.bleuPourpre, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
