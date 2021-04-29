import 'package:flutter/material.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../../components/back.dart';
import './../../../localization/language/languages.dart';

import 'design_course_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  _showLeveltem(BuildContext context, String title, lessonDone) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: 89.w,
      height: 129.w,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      child: Stack(children: [
        Image.asset(
          'assets/images/unit/course-board.png',
          fit: BoxFit.contain,
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 16.w,
                alignment: Alignment.center,
                child: Text(title,
                    style: TextStyle(
                        color: Theme.Colors.yellow200,
                        fontSize: height > 600 ? 25.sp : 29.sp,
                        fontFamily: 'UTMCooperBlack'),
                    textAlign: TextAlign.center))),
        Positioned(
          top: 16.w,
          left: 8.w,
          right: 8.w,
          bottom: 6.w,
          child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(8.w)),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 4.w),
                child: Column(
                  children: [
                    for (var i = 1; i < 7; i++)
                      GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(vertical: 2.w),
                            padding: EdgeInsets.only(
                              left: 6.w,
                              right: 6.w,
                              bottom: 1.5.w,
                            ),
                            height: 16.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                lessonDone
                                    ? 'assets/images/unit/course1.png'
                                    : 'assets/images/unit/course2.png',
                              ),
                              fit: BoxFit.contain,
                            )),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                lessonDone
                                    ? Container(
                                        width: 7.w,
                                        height: 7.w,
                                        margin: EdgeInsets.only(right: 9.w),
                                        child: Image.asset(
                                            'assets/images/unit/coursetick.png',
                                            fit: BoxFit.contain))
                                    : Container(
                                        width: 16.w,
                                      ),
                                Text(
                                  'Unit 0$i',
                                  style: TextStyle(
                                      color: lessonDone
                                          ? Theme.Colors.yellow200
                                          : Theme.Colors.green700,
                                      fontSize: height > 600 ? 20.sp : 30.sp,
                                      fontFamily: 'UTMCooperBlack'),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DesignCourseScreen()));
                          })
                  ],
                ),
              )),
        ),
      ]),
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
                  children: <Widget>[
                    TopButton(),
                    Container(
                      height: height - 37.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          _showLeveltem(
                            context,
                            Languages.of(context).easy,
                            true,
                          ),
                          _showLeveltem(
                              context, Languages.of(context).medium, false),
                          _showLeveltem(
                              context, Languages.of(context).advanced, false),
                        ],
                      ),
                    )
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
        height: 32.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Back(buttonImage: 'assets/images/button/close-button.png'),
            ),
            Container(
                width: 180.w,
                height: 27.w,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Theme.Colors.green200,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(9.w)),
                ),
                child: Container(
                    width: 176.w,
                    height: 25.w,
                    decoration: BoxDecoration(
                      color: Theme.Colors.green400,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(7.w)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15.w),
                          child: Text(
                            Languages.of(context).youLearning,
                            style: TextStyle(
                                fontSize: height > 600 ? 22.sp : 33.sp,
                                fontFamily: 'UTMCooperBlack',
                                fontWeight: FontWeight.w900,
                                color: Theme.Colors.orange100),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.centerLeft,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 12.w,
                              child: Image.asset(
                                'assets/images/unit/bar-plus.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                                left: -10.w,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 19.w,
                                      height: 19.w,
                                      child: Image.asset(
                                          'assets/images/unit/language-flag.png',
                                          fit: BoxFit.contain),
                                    ),
                                    Container(
                                      width: 60.w,
                                      // color: Colors.red,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.w),
                                      child: Text(
                                        'Việt - miền Nam',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            // fontSize: 14,
                                            fontSize:
                                                height > 600 ? 17.sp : 24.sp,
                                            fontFamily: 'UTMCooperBlack',
                                            fontWeight: FontWeight.w900,
                                            color: Theme.Colors.orange100),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ))),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 13.5.w,
                    right: 16.w,
                    child: Image.asset(
                      'assets/images/button/add_short.png',
                      height: 13.5.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 10.w,
                    right: 33.w,
                    child: GestureDetector(
                        child: Container(
                            width: 20.w,
                            height: 20.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/button/vietnames-flag.png',
                                  ),
                                  fit: BoxFit.contain),
                            )),
                        onTap: () {}),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
