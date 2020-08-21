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
  static const orange500 = Color.fromRGBO(207, 94, 65, 1);
}
