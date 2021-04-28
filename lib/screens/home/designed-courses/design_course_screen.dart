import 'package:flutter/material.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../../components/back.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesignCourseScreen extends StatefulWidget {
  @override
  _DesignCourseScreen createState() => _DesignCourseScreen();
}

class _DesignCourseScreen extends State<DesignCourseScreen> {
  bool _pressId = true;
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
                  children: <Widget>[
                    TopButton(),
                    Container(
                        height: height - 37.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: 60.w,
                              height: 83.w,
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Stack(children: [
                                Image.asset(
                                  // 'assets/images/lesson/disable-board.png',
                                  'assets/images/lesson/lesson-active.png',
                                  fit: BoxFit.contain,
                                ),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                        height: 17.w,
                                        alignment: Alignment.center,
                                        child: Text('EASY',
                                            style: TextStyle(
                                                color: Theme.Colors.yellow200,
                                                fontSize: height > 600
                                                    ? 25.sp
                                                    : 29.sp,
                                                fontFamily: 'UTMCooperBlack'),
                                            textAlign: TextAlign.center))),
                                Positioned(
                                    top: 26.w,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                        height: 30.w,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Lesson 1',
                                          style: TextStyle(
                                              color: Theme.Colors.orange500,
                                              fontSize:
                                                  height > 600 ? 20.sp : 28.sp,
                                              fontFamily: 'UTMCooperBlack'),
                                          textAlign: TextAlign.center,
                                        ))),
                                Positioned(
                                    bottom: 30.5.w,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                        height: 14.w,
                                        // color: Colors.red,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 30.w),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '100',
                                          style: TextStyle(
                                              color: Theme.Colors.yellow100,
                                              fontWeight: FontWeight.w900,
                                              fontSize:
                                                  height > 600 ? 25.sp : 44.sp,
                                              fontFamily: 'UTMCooperBlack'),
                                          textAlign: TextAlign.center,
                                        ))),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: AnimatedOpacity(
                                        opacity: _pressId ? 1.0 : 0.85,
                                        duration: Duration(milliseconds: 200),
                                        child: GestureDetector(
                                            child: Container(
                                              // color: Colors.blue,
                                              height: 11.w,
                                              child: Image.asset(
                                                  'assets/images/topic/choose-button.png',
                                                  fit: BoxFit.contain),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _pressId = !_pressId;
                                              });
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (BuildContext
                                              //                 context) =>
                                              //             LibraryScreen()));
                                            })))
                              ]),
                            )
                          ],
                        ))
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
    return Container(
        height: 32.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Back(buttonImage: 'assets/images/button/close-button.png'),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 11.w,
                    right: 16.w,
                    child: Image.asset(
                      'assets/images/button/library-button.png',
                      height: 19.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
