import 'package:flutter/material.dart';

class Data {
  Data._();
  static getTheme(BuildContext context) {
    return Theme.of(context);
  }
}

class Colors {
  Colors._(); // this basically makes it so you can instantiate this class

  static const transparent = Color(0x00ffffff);
  static const yellow200 = Color.fromRGBO(252, 251, 221, 1);
  static const yellow50 = Color(0xFFFFF8EE);
  static const yellow100 = Color(0xFFF7FCF8);
  static const yellow300 = Color(0xFFFCFBDD);
  static const orange100 = Color(0xFFD9E3E0);
  static const orange500 = Color.fromRGBO(207, 94, 65, 1);
  static const green200 = Color(0xFF5CA366);
  static const green400 = Color(0xFF2A8850);
  static const green700 = Color(0xFF104333);
  static const red100 = Color(0xFFA74127);
  static const orange900 = Color(0xFFCF5E41);
  static const orangeDark = Color(0xFFAA7537);
  static const blueDark = Color(0xFF042F4B);
}
