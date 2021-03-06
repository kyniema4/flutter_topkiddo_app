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
  static const yellow100 = Color(0xFFF7FCF8);
  static const orange100 = Color(0xFFD9E3E0);
  static const orange500 = Color.fromRGBO(207, 94, 65, 1);
  static const green200 = Color(0xFF5CA366);
  static const green400 = Color(0xFF2A8850);
  static const green700 = Color(0xFF104333);
}
