import 'package:flutter/material.dart';

final backgroundImage = BoxDecoration(
  image: DecorationImage(
    image:
        AssetImage('assets/images/background/BG-iphone-full.jpg'),
    fit: BoxFit.cover,
  ),
);

final blackBackground = BoxDecoration(
  gradient: RadialGradient(
    radius: 0.95,
    colors: [
      Color.fromRGBO(0, 0, 0, 0.2),
      Color.fromRGBO(0, 0, 0, 0.45),
      Color.fromRGBO(0, 0, 0, 0.75),
    ],
  )
);