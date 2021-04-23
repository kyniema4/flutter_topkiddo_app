import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: new EdgeInsets.only(top: 19),
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                right: -24.w,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/button/bar-long.png',
                    height: 17.w,
                    width: 80.w,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                right: 12.w,
                child: Row(
                  children: [
                    GestureDetector(
                        child: Container(
                            width: 16.w,
                            height: 17.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/button/musicon-button.png',
                                  ),
                                  fit: BoxFit.fitWidth),
                            )),
                        onTap: () {
                          print("");
                        }),
                    SizedBox(
                      width: 6.w,
                    ),
                    GestureDetector(
                        child: Container(
                            width: 16.w,
                            height: 17.w,
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
