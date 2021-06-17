import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'theme.dart' as Theme;

final backgroundImage = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/background/BG-iphone-full.jpg'),
    fit: BoxFit.cover,
  ),
);
final backgroundImage2 = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/background/bg_iphone.jpg'),
    fit: BoxFit.cover,
  ),
);
final backgroundImageSecond = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/background/foriPhoneBG-compressed.jpg'),
    fit: BoxFit.cover,
  ),
);
final blackBackground = BoxDecoration(
    gradient: RadialGradient(
  radius: 0.95,
  colors: [
    Color.fromRGBO(0, 0, 0, 0),
    Color.fromRGBO(0, 0, 0, 0.4),
    Color.fromRGBO(0, 0, 0, 0.65),
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
final profileTile = TextStyle(
    color: Theme.Colors.orange900,
    fontSize: 16.0,
    fontFamily: 'UTMCooperBlack');
final profileInput = TextStyle(
    color: Theme.Colors.orange900,
    fontSize: 19.0,
    fontFamily: 'UTMCooperBlack');
final boardTitle = TextStyle(
    color: Theme.Colors.yellow300,
    fontSize: 19.0,
    fontFamily: 'UTMCooperBlack');
final settingScrollView = BoxDecoration(
    // color: Colors.blueAccent
    //     .withOpacity(0.5),
    borderRadius: BorderRadius.only(
  topLeft: Radius.elliptical(150.w, 5.w),
  topRight: Radius.elliptical(150.w, 5.w),
  bottomLeft: Radius.circular(5.w),
  bottomRight: Radius.circular(5.w),
));
