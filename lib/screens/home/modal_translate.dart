import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../localization/locale_constant.dart';
import '../../localization/language/languages.dart';

class ModalTranslate extends StatelessWidget {
  bool _local = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.7),
        body: Center(
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
                          TextButton(
                            onPressed: () => {
                              changeLanguage(context, 'vi'),
                              _local = false,
                              Navigator.pop(context, false) //translate
                            },
                            child: Image.asset(
                              'assets/images/button/vietnames-flag.png',
                              width: 40.w,
                            ),
                          ),
                          Text(
                            Languages.of(context).lesson.toUpperCase(),
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
                              child: TextButton(
                                onPressed: () => {
                                  changeLanguage(context, 'en'),
                                  _local = true,
                                  Navigator.pop(context, false)
                                },
                                child: Image.asset(
                                  'assets/images/button/enlish-flag.png',
                                  width: 40.w,
                                ),
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
        ));
  }
}
