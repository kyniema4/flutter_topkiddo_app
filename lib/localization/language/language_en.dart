import 'languages.dart';

class LanguageEn extends Languages {
  @override

  //login-screen
  String get canNotPhoneNumber => "Can not Phone Number empty";
  String get phoneNumber10 => "Phone Number must be of 10 digit";
  String get canNotPassword => "Can not password empty";
  //register-screen
  String get canNotconfirmPassword => "Cannot confirm password empty";
  String get passwordSameAbove => "Password must be same as above";
  //login-home
  String get login => "Login";
  String get register => 'Register';
  String get easy => "EASY";
  String get medium => "MEDIUM";
  String get advanced => "ADVANCED";
  String get lesson => "Lesson";
  String get youLearning => 'You are studying:';
  String get topic => 'topic';
  String get translate => 'Translate';
  String get designedCourses => 'Designed Courses';
  String get flexibleLearning => 'Flexible Learning';
  String get expressionsPhrases => 'Expressions and Phrases';
  String get phoneNumber => 'Phone number';
  String get password => 'Password';
  String get confirmPassword => 'Confirm password';
}
