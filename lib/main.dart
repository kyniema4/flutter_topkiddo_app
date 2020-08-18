import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import './screens/splash_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Topkiddo App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
