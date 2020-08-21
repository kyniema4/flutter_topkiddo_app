import 'package:flutter/material.dart';
import 'theme.dart' as Theme;

final backgroundImage = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/background/BG-iphone-full.jpg'),
    fit: BoxFit.cover,
  ),
);

final blackBackground = BoxDecoration(
    gradient: RadialGradient(
  radius: 0.95,
  colors: [
    Color.fromRGBO(0, 0, 0, 0.2),
    Color.fromRGBO(0, 0, 0, 0.45),
    Color.fromRGBO(0, 0, 0, 0.7),
  ],
));
final styleTitle = TextStyle(
    color: Theme.Colors.yellow200,
    fontSize: 15.0,
    fontFamily: 'UTMCooperBlack');
final styleTextInput = TextStyle(
    fontSize: 14.0,
    color: Theme.Colors.orange500,
    fontFamily: 'UTMCooperBlack');

final styleUnderline = UnderlineInputBorder(
  borderSide: BorderSide(color: Theme.Colors.transparent),
  borderRadius: BorderRadius.circular(25.7),
);

final styleOutline = OutlineInputBorder(
  borderSide: BorderSide(color: Theme.Colors.transparent),
  borderRadius: BorderRadius.circular(25.7),
);

final contentPadding = EdgeInsets.only(left: 17, bottom: 10, top: 0);

final titleBoardHome = TextStyle(
    color: Theme.Colors.yellow200,
    fontSize: 13.0,
    fontFamily: 'UTMCooperBlack');
final nameBoardHome = TextStyle(
    color: Theme.Colors.orange500,
    fontSize: 13.0,
    fontFamily: 'UTMCooperBlack');
