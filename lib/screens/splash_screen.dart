import 'dart:async';
import 'package:flutter/material.dart';
import 'loginhome_screen.dart';
import '../theme/style.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 6),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginHomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: backgroundImage,
            child: null,
          ),
          Container(
            decoration: blackBackground,
            child: Center(
              child: Image.asset('assets/images/namegame.png',
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height / 1.7),
            ),
          ),
        ],
      ),
    );
  }
}

