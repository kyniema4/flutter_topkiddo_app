import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  //login-screen
  String get canNotPhoneNumber;
  String get phoneNumber10;
  String get canNotPassword;
  //register-screen
  String get canNotconfirmPassword;
  String get passwordSameAbove;

  //login-home
  String get login;
  String get register;
  String get easy;
  String get medium;
  String get advanced;
  String get lesson;
  String get youLearning;
  String get topic;
  String get translate;
  String get designedCourses;
  String get flexibleLearning;
  String get expressionsPhrases;
  String get phoneNumber;
  String get password;
  String get confirmPassword;
}
