import 'package:flutter/material.dart';
import '../../theme/style.dart';
import '../../components/settings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModalTranslate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
          margin: new EdgeInsets.only(top: 25.w),
          height: 120.w,
          width: 220.w,
          child: Stack(
            children: [
              Positioned(
                top: 10.w,
                left: 65.w,
                child: Container(
                    width: 90.w,
                    child: Center(
                      child: Image.asset(
                        'assets/images/languages/babe1.png',
                        width: 90.w,
                      ),
                    )),
              ),
              Container(
                  height: 70.w,
                  width: 65.w,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/button/vietnames-flag.png',
                        width: 40.w,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          child: Image.asset(
                            'assets/images/languages/line1.png',
                            width: 50.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  )),
              Positioned(
                left: 140.w,
                top: 0,
                child: Container(
                    width: 80.w,
                    height: 78.w,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          top: 9.w,
                          child: Image.asset(
                            'assets/images/button/enlish-flag.png',
                            width: 40.w,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Container(
                            child: Image.asset(
                              'assets/images/languages/line2.png',
                              width: 50.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
