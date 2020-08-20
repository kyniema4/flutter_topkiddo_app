import 'dart:async';
import 'package:flutter/material.dart';
import 'loginhome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/images/background/BG-iphone-full.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          Container(
            // color: Color.fromRGBO(0, 0, 0, 0.49),
            decoration: BoxDecoration(
                gradient: RadialGradient(
              radius: 0.95,
              colors: [
                Color.fromRGBO(0, 0, 0, 0.2),
                Color.fromRGBO(0, 0, 0, 0.45),
                Color.fromRGBO(0, 0, 0, 0.75),
              ],
            )),
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
