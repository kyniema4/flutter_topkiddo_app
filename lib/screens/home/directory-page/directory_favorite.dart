import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:topkiddo/screens/home/designed-courses/design_course_screen.dart';
import 'package:topkiddo/theme/style.dart';
import 'package:topkiddo/theme/theme.dart' as Theme;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DirectoryFavorite extends StatefulWidget {
  DirectoryFavorite({Key key}) : super(key: key);

  @override
  _DirectoryFavoriteState createState() => _DirectoryFavoriteState();
}

class _DirectoryFavoriteState extends State<DirectoryFavorite> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: width,
              height: height,
              decoration: backgroundImageSecond,
              child: null,
            ),
            Container(
              height: height,
              decoration: blackBackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 32.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Stack(children: [
                              Positioned(
                                top: 13.5.w,
                                left: -40.w,
                                child: Image.asset(
                                  'assets/images/button/bar-long.png',
                                  height: 12.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                  top: 10.w,
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
                                                      'assets/images/button/back-button.png',
                                                    ),
                                                    fit: BoxFit.contain),
                                              )),
                                          onTap: () {
                                            Navigator.pop(context);
                                          }),
                                    ],
                                  )),
                            ]),
                          ),
                        ],
                      )),
                  Container(
                      height: height - 37.w,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                                width: 300.w,
                                height: 180.w,
                                padding: EdgeInsets.only(top: 60),
                                alignment: Alignment.topCenter,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/directory/board-notitle.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                child: null)
                          ]))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
