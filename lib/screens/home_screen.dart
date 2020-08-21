import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/style.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: backgroundImage,
            child: null,
          ),
          Container(
            decoration: blackBackground,
            height: height,
            child: Column(
              children: <Widget>[
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text('giạng'), 
                    Text('giạng'),
                  ],
                ),
                SizedBox(height: 80.0),
                Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.red,
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Stack(
                          children: [
                              Image.asset('assets/images/topic/designed-courses.png',
                              fit: BoxFit.contain,
                              height: width / 3
                            ),
                          ]
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Stack(
                          children: [
                            Image.asset('assets/images/topic/flexible.png',
                              fit: BoxFit.contain,
                              height: width / 3
                            ),
                          ],
                        ),
                      ),
                     Padding(
                       padding: EdgeInsets.symmetric(horizontal: 15),
                       child: Stack(
                        children: [
                          Image.asset('assets/images/topic/expressions.png',
                            fit: BoxFit.contain,
                            height: width / 3
                          ),
                        ]
                      )
                     )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}