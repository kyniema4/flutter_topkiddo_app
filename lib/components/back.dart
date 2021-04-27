import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Back extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.only(top: 10.w),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 4.5.w,
            left: -69.w,
            // right: 0,
            child: Align(
              child: Image.asset(
                'assets/images/button/bar-long.png',
                height: 12.w,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 1.w,
            left: 15.w,
            child: GestureDetector(
                child: Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/button/back-button.png',
                          ),
                          fit: BoxFit.contain),
                    )),
                onTap: () {
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }
}
