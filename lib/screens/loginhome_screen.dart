import 'package:flutter/material.dart';

class LoginHomeScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login home screen'),
      ),
      body: Center(
        child: Text('This is content')
      )
    );
  }
}