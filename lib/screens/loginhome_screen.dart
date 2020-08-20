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
                    flex: 1,
                    child: Container(
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(color: Colors.pink),
                      child: Row(
                        children: <Widget>[
                          new Container(
                            height: 10,
                            width: 50,
                            color: Colors.yellow,
                          ),
                          Container(
                            color: Colors.red,
                            height: 10,
                            width: 50,
                          ),
                          Positioned(
                            child: new CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.green,
                            ),
                            left: 0.0,
                            top: 10.0,
                          ),
                        ],
                      ),
                    ),

                    // Positioned(
                    //   child: Container(
                    //     height: 30,
                    //     width: 150,
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //         image: AssetImage(
                    //           'assets/images/button/bar-long.png',
                    //         ),
                    //         fit: BoxFit.fitWidth,
                    //       ),
                    //     ),
                    //   ),
                    //   left: -100,
                    //   top: 0,
                    // )
                    // Image.asset('assets/images/button/bar-long.png',
                    //     scale: 3),
                    // Container(
                    //   height: 20,
                    //   width: 100,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: AssetImage(
                    //         'assets/images/button/bar-long.png',
                    //       ),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // child: GestureDetector(
                    //     child: Container(
                    //         width: 40,
                    //         height: 40,
                    //         decoration: BoxDecoration(
                    //           // color: Colors.black,
                    //           image: DecorationImage(
                    //               image: AssetImage(
                    //                   "assets/images/button/back-button.png"),
                    //               fit: BoxFit.cover),
                    //           // button text
                    //         )),
                    //     onTap: () {
                    //       print("you clicked my");
                    //     })
                    // ),
                    // Image.asset('assets/images/button/bar-long.png',
                    //     width: 100),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                        child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/namegame.png',
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height / 5),
                        GestureDetector(
                            child: Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/login_page/main-loginbutton.png"),
                                      fit: BoxFit.cover),
                                  // button text
                                )),
                            onTap: () {
                              print("you clicked my");
                            }),
                        GestureDetector(
                            child: Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/login_page/main-newuserbutton.png"),
                                      fit: BoxFit.cover),
                                  // button text
                                )),
                            onTap: () {
                              print("you clicked my");
                            })
                      ],
                    )),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Image.asset('assets/images/button/bar-long.png',
                                width: 100),
                            GestureDetector(
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      // color: Colors.black,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/button/back-button.png"),
                                          fit: BoxFit.cover),
                                      // button text
                                    )),
                                onTap: () {
                                  print("you clicked my");
                                }),
                            GestureDetector(
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      // color: Colors.black,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/button/back-button.png"),
                                          fit: BoxFit.cover),
                                      // button text
                                    )),
                                onTap: () {
                                  print("you clicked my");
                                })
                          ],
                        ),
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
