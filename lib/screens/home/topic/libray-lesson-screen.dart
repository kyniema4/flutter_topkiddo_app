// bấm từ topic page

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/back.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../../components/languages_app.dart';
import 'package:easy_localization/easy_localization.dart';
import '../modal_language.dart';
import 'courses-screen.dart';

class LibraryLessonScreen extends StatefulWidget {
  @override
  _LibraryLessonScreenState createState() => _LibraryLessonScreenState();
}

class _LibraryLessonScreenState extends State<LibraryLessonScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double itemWidth = height > 600 ? 0.27.sh : 0.37.sh;
    double itemHeight = height > 600 ? 0.26.sh : 0.35.sh;

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
                      height: height > 600 ? height - 60.w : height - 33.w,
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                            horizontal: (1.sw - (itemWidth * 3)) / 8),
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          direction: Axis.vertical,
                          children: [
                            for (var index = 0; index < 7; index++)
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CoursesScreen()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        (1.sw - (itemWidth * 3)) / 8,
                                        0.03.sh,
                                        (1.sw - (itemWidth * 3)) / 8,
                                        0.02.sh),
                                    width: itemWidth,
                                    height: itemHeight,
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Image.asset(
                                          'assets/images/lesson/library-lessons-birds.png',
                                          fit: BoxFit.contain,
                                          height: double.infinity,
                                        ),
                                        Container(
                                          height: height > 600
                                              ? 0.045.sh
                                              : 0.057.sh,
                                          alignment: Alignment.center,
                                          child: Text('Wild-animals',
                                              style: TextStyle(
                                                  height: 1.2,
                                                  color: Theme.Colors.yellow300,
                                                  fontSize: height > 600
                                                      ? 16.sp
                                                      : 21.sp,
                                                  fontFamily: 'UTMCooperBlack'),
                                              textAlign: TextAlign.center),
                                        ),
                                      ],
                                    ),
                                  )),
                          ],
                        ),
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
  _showModalLanguage(context) {
    showDialog(
        context: context,
        useSafeArea: false,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ModalLanguage();
        });
  }

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
                            'youLearning'.tr(),
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
                                      child: GestureDetector(
                                          child: Text(
                                            'Việt - miền Nam',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                // fontSize: 14,
                                                fontSize: height > 600
                                                    ? 17.sp
                                                    : 24.sp,
                                                fontFamily: 'UTMCooperBlack',
                                                fontWeight: FontWeight.w900,
                                                color: Theme.Colors.orange100),
                                          ),
                                          onTap: () {
                                            _showModalLanguage(context);
                                          }),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ))),
            Expanded(child: LanguagesApp()),
          ],
        ));
  }
}
