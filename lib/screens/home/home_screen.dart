import 'package:flutter/material.dart';
import '../../theme/style.dart';
import '../../theme/theme.dart' as Theme;

import '../new_game/loginhome_screen.dart';
import './modal_translate.dart';
import 'designed-courses/library_screen.dart';
import '../../localization/language/languages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _pressed = true;
  bool _pressed2 = true;
  bool _pressed3 = true;

  _showHomeItem(BuildContext context, imageBg, String title, String content,
      bool _pressId) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: 92.w,
      height: 125.w,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Stack(children: [
        Image.asset(
          imageBg,
          fit: BoxFit.contain,
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 17.w,
                alignment: Alignment.center,
                child: Text(title,
                    style: TextStyle(
                        color: Theme.Colors.yellow200,
                        fontSize: height > 600 ? 25.sp : 29.sp,
                        fontFamily: 'UTMCooperBlack'),
                    textAlign: TextAlign.center))),
        Positioned(
            top: 26.w,
            left: 0,
            right: 0,
            child: Container(
                height: 30.w,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.center,
                child: Text(
                  content,
                  style: TextStyle(
                      color: Theme.Colors.orange500,
                      fontSize: height > 600 ? 20.sp : 28.sp,
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
                      height: 16.w,
                      child: Image.asset(
                          'assets/images/topic/choose-button.png',
                          fit: BoxFit.contain),
                    ),
                    onTap: () {
                      setState(() {
                        _pressId = !_pressId;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LibraryScreen()));
                    })))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: backgroundImage,
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
                        children: <Widget>[
                          _showHomeItem(
                              context,
                              'assets/images/topic/designed-courses.png',
                              Languages.of(context).lesson.toUpperCase(),
                              Languages.of(context).designedCourses,
                              _pressed),
                          _showHomeItem(
                              context,
                              'assets/images/topic/flexible.png',
                              Languages.of(context).topic.toUpperCase(),
                              Languages.of(context).flexibleLearning,
                              _pressed2),
                          _showHomeItem(
                              context,
                              'assets/images/topic/expressions.png',
                              Languages.of(context).translate.toUpperCase(),
                              Languages.of(context).expressionsPhrases,
                              _pressed3),
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
  _showModalTranslate(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ModalTranslate();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32.w,
        padding: new EdgeInsets.only(top: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(children: [
                Positioned(
                  top: 4.5.w,
                  left: -40.w,
                  child: Image.asset(
                    'assets/images/button/bar-long.png',
                    height: 12.w,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    top: 1.w,
                    left: 16.w,
                    child: Row(
                      children: [
                        GestureDetector(
                            child: Container(
                                width: 20.w,
                                height: 20.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/button/logout.png',
                                      ),
                                      fit: BoxFit.contain),
                                )),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LoginHomeScreen()));
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
                                        'assets/images/button/menu-button.png',
                                      ),
                                      fit: BoxFit.contain),
                                )),
                            onTap: () {}),
                      ],
                    )),
              ]),
            ),
            // ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 3.5.w,
                    right: 16.w,
                    child: Image.asset(
                      'assets/images/button/add_short.png',
                      height: 13.5.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
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
                        onTap: () {
                          _showModalTranslate(context);
                        }),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
