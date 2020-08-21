// import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'loginhome_screen.dart';

class LoginHomeScreen extends StatelessWidget {
  // final double topWidgetHeight = 200.0;
  // final double avatarRadius = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/images/background/BG-iphone-full.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          Container(
              // color: Color.fromRGBO(0, 0, 0, 0.49),
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                radius: 0.95,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.2),
                  Color.fromRGBO(0, 0, 0, 0.45),
                  Color.fromRGBO(0, 0, 0, 0.75),
                ],
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            padding: new EdgeInsets.only(top: 20),
                            height: MediaQuery.of(context).size.height,
                            // decoration: new BoxDecoration(color: Colors.pink),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  left: -110,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Image.asset(
                                      'assets/images/button/bar-long.png',
                                      height: 40,
                                      width: 200,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 35,
                                  child: GestureDetector(
                                      child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/button/back-button.png',
                                                ),
                                                fit: BoxFit.fitWidth),
                                            // button text
                                          )),
                                      onTap: () {
                                        print("");
                                      }),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                  Expanded(
                      flex: 3,
                      child: Container(
                        // decoration: new BoxDecoration(color: Colors.red),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/namegame.png',
                              fit: BoxFit.contain,
                              height: 140,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            GestureDetector(
                                child: Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      // color: Colors.black,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/login_page/main-loginbutton.png"),
                                          fit: BoxFit.fitWidth),
                                      // button text
                                    )),
                                onTap: () {
                                  print("you clicked my");
                                }),
                            SizedBox(
                              height: 15.0,
                            ),
                            GestureDetector(
                                child: Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/login_page/main-newuserbutton.png"),
                                          fit: BoxFit.fitWidth),
                                      // button text
                                    )),
                                onTap: () {
                                  print("you clicked my");
                                })
                          ],
                        )),
                      )),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            padding: new EdgeInsets.only(top: 20),
                            height: MediaQuery.of(context).size.height,
                            // decoration: new BoxDecoration(color: Colors.pink),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  right: -60,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Image.asset(
                                      'assets/images/button/bar-long.png',
                                      height: 40,
                                      width: 200,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 30,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                          child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      'assets/images/button/musicon-button.png',
                                                    ),
                                                    fit: BoxFit.fitWidth),
                                                // button text
                                              )),
                                          onTap: () {
                                            print("");
                                          }),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      GestureDetector(
                                          child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      'assets/images/button/setting-button.png',
                                                    ),
                                                    fit: BoxFit.fitWidth),
                                                // button text
                                              )),
                                          onTap: () {
                                            print("");
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
