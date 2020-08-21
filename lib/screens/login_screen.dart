// import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'loginhome_screen.dart';

class LoginScreen extends StatelessWidget {
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
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 292,
                          decoration: new BoxDecoration(color: Colors.red),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Image.asset(
                                    'assets/images/login_page/loginboard.png',
                                    height: 275,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Positioned(child: Text('LOGIN')),
                              Positioned(
                                // top: 0,

                                child: Container(
                                  margin: new EdgeInsets.only(top: 20.0),
                                  child: TextField(
                                    // autofocus: false,
                                    // style: TextStyle(
                                    //     fontSize: 22.0, color: Color(0xFFbdc6cf)),
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.pink,
                                        // contentPadding: const EdgeInsets.only(
                                        //     left: 14.0, bottom: 8.0, top: 8.0),
                                        // focusedBorder: OutlineInputBorder(
                                        //   borderSide:
                                        //       BorderSide(color: Colors.white),
                                        //   borderRadius:
                                        //       BorderRadius.circular(25.7),
                                        // ),
                                        // enabledBorder: UnderlineInputBorder(
                                        //   borderSide:
                                        //       BorderSide(color: Colors.white),
                                        //   borderRadius:
                                        //       BorderRadius.circular(25.7),
                                        // ),
                                        // border: InputBorder.none,
                                        hintText: 'Phone number'),
                                  ),
                                ),
                              ),
                              //     // Positioned(
                              //     //   child: TextField(
                              //     //     decoration: InputDecoration(
                              //     //         border: InputBorder.none,
                              //     //         hintText: 'Password'),
                              //     //   ),
                              //     // ),
                              Positioned(
                                bottom: 70,
                                right: 0.0,
                                left: 0.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/login_page/fb-button.png',
                                                  ),
                                                  fit: BoxFit.fitWidth),
                                              // button text
                                            )),
                                        onTap: () {
                                          print("");
                                        }),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    GestureDetector(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/login_page/g+button.png',
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
                              Positioned(
                                bottom: 0,
                                right: 0.0,
                                left: 0.0,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                      child: Container(
                                          width: 160,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            // color: Colors.grey,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/login_page/loginbutton1.png',
                                                ),
                                                fit: BoxFit.fitWidth),
                                            // button text
                                          )),
                                      onTap: () {
                                        print("");
                                      }),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                  ),
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
