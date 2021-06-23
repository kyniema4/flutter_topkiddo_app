// bấm từ bảng của trang library item

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/back.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home_screen.dart';

class CoursesTwoScreen extends StatefulWidget {
  @override
  _CoursesTwoScreen createState() => _CoursesTwoScreen();
}

class _CoursesTwoScreen extends State<CoursesTwoScreen> {
  _showBoxItem(BuildContext context, String text) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 0.58.sw / 4.8,
        height: 43.w,
        padding: EdgeInsets.fromLTRB(8.w, 7.w, 8.w, 0),
        decoration: BoxDecoration(
          // color: Colors.yellow,
          image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('assets/images/lesson/boxItem.png'),
              fit: BoxFit.contain),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Text(
              text.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.4,
                  color: Theme.Colors.yellow50,
                  fontSize: height > 600 ? 18.sp : 27.sp,
                  fontFamily: 'UTMCooperBlack'),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset('assets/images/lesson/playItem.png',
                  height: 16.w, fit: BoxFit.contain),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: backgroundImageSecond,
              child: null,
            ),
            Container(
                height: height,
                decoration: blackBackground,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    TopButton(),
                    SizedBox(height: height > 600 ? 0.1.sh : 0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: height > 600
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 0.58.sw,
                            height: 0.27.sh,
                            alignment: Alignment.topCenter,
                            // color: Colors.red,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _showBoxItem(context, 'multiSensory'),
                                _showBoxItem(context, 'flashCards'),
                                _showBoxItem(context, 'readMyself'),
                                _showBoxItem(context, 'playGame'),
                              ],
                            ),
                          ),
                          // SizedBox(height: height > 600 ? 0.15.sh : 10.w),
                          Container(
                            width: 0.75.sw,
                            height: height > 600 ? 100.w : 92.w,
                            // height: 0.57.sh,
                            alignment: Alignment.center,
                            // color: Colors.red,
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    height: height > 600 ? 100.w : 92.w,
                                    child: Image.asset(
                                      'assets/images/lesson/word-board.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 4.w,
                                  child: Text(
                                    'courses'.tr().toUpperCase() + ' ' + '03',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        height: 1.4,
                                        color: Theme.Colors.yellow300,
                                        fontSize: height > 600 ? 25.sp : 34.sp,
                                        fontFamily: 'UTMCooperBlack'),
                                  ),
                                ),
                                Positioned(
                                  top: 28.w,
                                  child: Container(
                                    width: 0.38.sw,
                                    // color: Colors.yellow,
                                    // padding: EdgeInsets.all(5.w),
                                    child: Column(
                                      children: [
                                        Text(
                                          'words'.tr() + ':',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Theme.Colors.blueDark,
                                              fontSize:
                                                  height > 600 ? 25.sp : 34.sp,
                                              fontFamily: 'UTMCooperBlack'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 40.w,
                                  child: Container(
                                      width: height > 600 ? 0.39.sw : 0.38.sw,
                                      // color: Colors.yellow,
                                      height: height > 600 ? 45.w : 37.w,
                                      // padding: EdgeInsets.all(5.w),
                                      child: SingleChildScrollView(
                                          padding: EdgeInsets.only(bottom: 5.w),
                                          child: Text(
                                            'Driver and car, truck and cabinet, Driver and car, truck and cabinet, Driver and car, truck and cabinet, Driver and car, truck and cabinet, truck and cabinet, truck and cabinet, truck and cabinet.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Theme.Colors.orangeDark,
                                                fontSize: height > 600
                                                    ? 19.sp
                                                    : 25.sp,
                                                fontFamily: 'UTMCooperBlack'),
                                          ))),
                                ),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Image.asset(
                                      'assets/images/lesson/em-be.png',
                                      fit: BoxFit.contain,
                                      width: 73.w,
                                    )),
                                Positioned(
                                    bottom: 0,
                                    right: -5.w,
                                    child: Image.asset(
                                      'assets/images/lesson/em-be1.png',
                                      fit: BoxFit.contain,
                                      width: 73.w,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class TopButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        height: 31.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 13.5.w,
                      left: -13.5.w,
                      child: Align(
                        child: Image.asset(
                          'assets/images/button/bar-long.png',
                          height: 12.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.w,
                      left: 15.w,
                      child: Row(
                        children: [
                          GestureDetector(
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
                                          'assets/images/button/home-button.png',
                                        ),
                                        fit: BoxFit.contain),
                                  )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomeScreen()));
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
                                          'assets/images/button/musicon-button.png',
                                        ),
                                        fit: BoxFit.contain),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Text(
              'transportation'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.Colors.yellow50,
                  fontSize: height > 600 ? 32.sp : 50.sp,
                  fontFamily: 'UTMCooperBlack'),
            )),
            Expanded(
                child: Container(
              padding: new EdgeInsets.only(top: 9.w),
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 4.5.w,
                    // left: 10.w,
                    right: -43.w,
                    child: Image.asset(
                      'assets/images/button/bar-long.png',
                      height: 12.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 2.w,
                    right: 55.w,
                    child: GestureDetector(
                        child: Container(
                            width: 21.w,
                            height: 21.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/button/language-flag.png',
                                  ),
                                  fit: BoxFit.contain),
                            )),
                        onTap: () {}),
                  ),
                  Positioned(
                    top: height > 600 ? 7.w : 7.5.w,
                    right: 0,
                    child: Container(
                      width: 60.w,
                      // color: Colors.red,
                      child: Text(
                        'Anh - Tây Ban Nha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.2,
                            color: Theme.Colors.yellow50,
                            fontSize: height > 600 ? 16.sp : 22.sp,
                            fontFamily: 'UTMCooperBlack'),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}
