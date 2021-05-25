import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../theme/theme.dart' as Theme;

class ModalLanguage extends StatefulWidget {
  @override
  _ModalLanguageState createState() => _ModalLanguageState();
}

class _ModalLanguageState extends State<ModalLanguage> {
  bool _local = true;
  List imgs = [
    'assets/images/languages/babe2.png',
    'assets/images/languages/babe1.png',
  ];

  double opacity = 1.0;

  void initState() {
    super.initState();
    // changeOpacity();
  }

  // changeOpacity() {
  //   Future.delayed(Duration(seconds: 1), () {
  //     setState(() {
  //       opacity = opacity == 0.0 ? 1.0 : 0.0;
  //       changeOpacity();
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.7),
        body: Center(
          child: Container(
              margin: new EdgeInsets.only(top: 10.w),
              height: 160.w,
              width: 220.w,
              child: Stack(
                children: [
                  Container(
                    color: Colors.pink[100],
                    child: Positioned(
                      top: 10.w,
                      left: 65.w,
                      child: Center(
                        child: Image.asset(
                          'assets/images/languages/2-em-be.png',
                          width: 90.w,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: new EdgeInsets.only(top: 10.w, left: 15.w),
                      // color: Colors.cyanAccent,
                      height: 50.w,
                      width: 65.w,
                      child: Stack(
                        children: [
                          Text(
                            'Viet-North',
                            style: TextStyle(
                                fontSize: height > 600 ? 17.sp : 24.sp,
                                fontFamily: 'UTMCooperBlack',
                                fontWeight: FontWeight.w900,
                                color: Theme.Colors.orange100),
                          ),
                          Container(
                            margin: new EdgeInsets.only(top: 7.w),
                            child: TextButton(
                              onPressed: () => {
                                Navigator.pop(context, false) //translate
                              },
                              child: Image.asset(
                                'assets/images/button/vietnames-flag.png',
                                width: 23.w,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(2009 / 360),
                                child: Image.asset(
                                  'assets/images/languages/line-chine.png',
                                  width: 40.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: new EdgeInsets.only(top: 45.w, left: 10.w),
                      // color: Colors.cyanAccent,
                      height: 50.w,
                      width: 70.w,
                      child: Stack(
                        children: [
                          Text(
                            'Viet-North',
                            style: TextStyle(
                                fontSize: height > 600 ? 17.sp : 24.sp,
                                fontFamily: 'UTMCooperBlack',
                                fontWeight: FontWeight.w900,
                                color: Theme.Colors.orange100),
                          ),
                          Container(
                            margin: new EdgeInsets.only(top: 7.w),
                            child: TextButton(
                              onPressed: () => {
                                Navigator.pop(context, false) //translate
                              },
                              child: Image.asset(
                                'assets/images/button/vietnames-flag.png',
                                width: 23.w,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 15.w,
                            child: Container(
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(1250 / 360),
                                child: Image.asset(
                                  'assets/images/languages/line-chine.png',
                                  width: 40.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: new EdgeInsets.only(top: 80.w, left: 0.w),
                      // color: Colors.cyanAccent,
                      height: 50.w,
                      width: 75.w,
                      child: Stack(
                        children: [
                          Text(
                            'Viet-North',
                            style: TextStyle(
                                fontSize: height > 600 ? 17.sp : 24.sp,
                                fontFamily: 'UTMCooperBlack',
                                fontWeight: FontWeight.w900,
                                color: Theme.Colors.orange100),
                          ),
                          Container(
                            margin: new EdgeInsets.only(top: 7.w),
                            child: TextButton(
                              onPressed: () => {
                                Navigator.pop(context, false) //translate
                              },
                              child: Image.asset(
                                'assets/images/button/flagArtboard-spain.png',
                                width: 23.w,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0.w,
                            child: Container(
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(150 / 360),
                                child: Image.asset(
                                  'assets/images/languages/line-chine.png',
                                  width: 40.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: new EdgeInsets.only(top: 110.w, left: 30.w),
                      // color: Colors.cyanAccent,
                      height: 50.w,
                      width: 75.w,
                      child: Stack(
                        children: [
                          Text(
                            'Viet-North',
                            style: TextStyle(
                                fontSize: height > 600 ? 17.sp : 24.sp,
                                fontFamily: 'UTMCooperBlack',
                                fontWeight: FontWeight.w900,
                                color: Theme.Colors.orange100),
                          ),
                          Container(
                            margin: new EdgeInsets.only(top: 7.w),
                            child: TextButton(
                              onPressed: () => {
                                Navigator.pop(context, false) //translate
                              },
                              child: Image.asset(
                                'assets/images/button/vietnames-flag.png',
                                width: 23.w,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 8.w,
                            top: 10.w,
                            child: Container(
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(140 / 360),
                                child: Image.asset(
                                  'assets/images/languages/line-chine.png',
                                  width: 40.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                    left: 140.w,
                    top: 0,
                    child: Container(
                        // color: Colors.blue[300],
                        height: 60.w,
                        width: 70.w,
                        child: Stack(
                          children: [
                            Positioned(
                              right: 10.w,
                              top: 2.w,
                              child: Text(
                                'Viet-North',
                                style: TextStyle(
                                    fontSize: height > 600 ? 17.sp : 24.sp,
                                    fontFamily: 'UTMCooperBlack',
                                    fontWeight: FontWeight.w900,
                                    color: Theme.Colors.orange100),
                              ),
                            ),
                            Positioned(
                              right: 10.w,
                              top: 10.w,
                              child: TextButton(
                                onPressed: () =>
                                    {Navigator.pop(context, false)},
                                child: Image.asset(
                                  'assets/images/button/enlish-flag.png',
                                  width: 23.w,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: Container(
                                child: RotationTransition(
                                  turns: new AlwaysStoppedAnimation(1030 / 360),
                                  child: Image.asset(
                                    'assets/images/languages/line-chine.png',
                                    width: 40.w,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Positioned(
                    left: 145.w,
                    top: 40.w,
                    child: Container(
                        // color: Colors.blue[300],
                        height: 60.w,
                        width: 70.w,
                        child: Stack(
                          children: [
                            Positioned(
                              right: 10.w,
                              top: 2.w,
                              child: Text(
                                'Viet-North',
                                style: TextStyle(
                                    fontSize: height > 600 ? 17.sp : 24.sp,
                                    fontFamily: 'UTMCooperBlack',
                                    fontWeight: FontWeight.w900,
                                    color: Theme.Colors.orange100),
                              ),
                            ),
                            Positioned(
                              right: 10.w,
                              top: 10.w,
                              child: TextButton(
                                onPressed: () =>
                                    {Navigator.pop(context, false)},
                                child: Image.asset(
                                  'assets/images/button/enlish-flag.png',
                                  width: 23.w,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 15.w,
                              child: Container(
                                child: RotationTransition(
                                  turns: new AlwaysStoppedAnimation(170 / 360),
                                  child: Image.asset(
                                    'assets/images/languages/line-chine.png',
                                    width: 40.w,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Positioned(
                    left: 145.w,
                    top: 80.w,
                    child: Container(
                        // color: Colors.blue[300],
                        height: 60.w,
                        width: 70.w,
                        child: Stack(
                          children: [
                            Positioned(
                              right: 10.w,
                              top: 2.w,
                              child: Text(
                                'Viet-North',
                                style: TextStyle(
                                    fontSize: height > 600 ? 17.sp : 24.sp,
                                    fontFamily: 'UTMCooperBlack',
                                    fontWeight: FontWeight.w900,
                                    color: Theme.Colors.orange100),
                              ),
                            ),
                            Positioned(
                              right: 10.w,
                              top: 10.w,
                              child: TextButton(
                                onPressed: () =>
                                    {Navigator.pop(context, false)},
                                child: Image.asset(
                                  'assets/images/button/enlish-flag.png',
                                  width: 23.w,
                                ),
                              ),
                            ),
                            Positioned(
                              left: -5.w,
                              bottom: 30.w,
                              child: Container(
                                child: RotationTransition(
                                  turns: new AlwaysStoppedAnimation(200 / 360),
                                  child: Image.asset(
                                    'assets/images/languages/line-chine.png',
                                    width: 40.w,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Positioned(
                    left: 120.w,
                    top: 110.w,
                    child: Container(
                        // color: Colors.blue[300],
                        height: 60.w,
                        width: 70.w,
                        child: Stack(
                          children: [
                            Positioned(
                              right: 10.w,
                              top: 2.w,
                              child: Text(
                                'Viet-North',
                                style: TextStyle(
                                    fontSize: height > 600 ? 17.sp : 24.sp,
                                    fontFamily: 'UTMCooperBlack',
                                    fontWeight: FontWeight.w900,
                                    color: Theme.Colors.orange100),
                              ),
                            ),
                            Positioned(
                              right: 10.w,
                              top: 10.w,
                              child: TextButton(
                                onPressed: () =>
                                    {Navigator.pop(context, false)},
                                child: Image.asset(
                                  'assets/images/button/enlish-flag.png',
                                  width: 23.w,
                                ),
                              ),
                            ),
                            Positioned(
                              left: -5.w,
                              bottom: 30.w,
                              child: Container(
                                child: RotationTransition(
                                  turns: new AlwaysStoppedAnimation(200 / 360),
                                  child: Image.asset(
                                    'assets/images/languages/line-chine.png',
                                    width: 40.w,
                                    fit: BoxFit.fill,
                                  ),
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
