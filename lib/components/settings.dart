import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: new EdgeInsets.only(top: 10.w),
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 4.5.w,
                right: -40.w,
                child: Align(
                    child: Image.asset(
                  'assets/images/button/bar-long.png',
                  height: 12.w,
                  fit: BoxFit.fill,
                )),
              ),
              Positioned(
                top: 1.w,
                right: 16.w,
                child: Row(
                  children: [
                    GestureDetector(
                        child: Container(
                            // width: 16.w,
                            // height: 17.w,
                            width: 20.w,
                            height: 20.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/button/musicon-button.png',
                                  ),
                                  fit: BoxFit.contain),
                            )),
                        onTap: () {
                          print("");
                        }),
                    SizedBox(
                      width: 8.w,
                    ),
                    GestureDetector(
                        child: Container(
                            width: 20.w,
                            height: 20.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/button/setting-button.png',
                                  ),
                                  fit: BoxFit.contain),
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
