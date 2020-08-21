import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
