import 'package:flutter/material.dart';

class Back extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: new EdgeInsets.only(top: 20),
          height: MediaQuery.of(context).size.height,
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
    );
  }
}
