import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Back extends StatelessWidget {
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
                left: -44.w,
                child: Align(
                  child: Image.asset(
                    'assets/images/button/bar-long.png',
                    height: 17.w,
                    width: 80.w,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                left: 14.w,
                child: GestureDetector(
                    child: Container(
                        width: 16.w,
                        height: 17.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/button/back-button.png',
                              ),
                              fit: BoxFit.fitWidth),
                        )),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
        )
      ],
    );
  }
}
