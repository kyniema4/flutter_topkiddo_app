import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/back.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../new_game/loginhome_screen.dart';
import './../../../localization/language/languages.dart';

class DesignCourseScreen extends StatefulWidget {
  final lesson;

  const DesignCourseScreen({this.lesson});
  @override
  _DesignCourseScreen createState() => _DesignCourseScreen();
}

class _DesignCourseScreen extends State<DesignCourseScreen>
    with SingleTickerProviderStateMixin {
  bool _pressId = true;
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  List listLesson = [];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
    initData();
  }

  initData() async {
    var lessonData = widget.lesson['docs'];
    print('debugging');
    if (lessonData != null) {
      var newList = [];
      for (var item in lessonData) {
        newList.add(LessonModel.fromJson(item));
      }
      setState(() {
        listLesson = newList;
      });
    } else
      return;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                    SlideTransition(
                        position: _offsetAnimation,
                        child: Container(
                            height: height - 37.w,
                            width: 0.79.sw,
                            alignment: Alignment.center,
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: <Widget>[
                                for (var i = 0; i < listLesson.length; i++)
                                  Container(
                                    width: 47.w,
                                    height: 64.5.w,
                                    margin: EdgeInsets.fromLTRB(
                                        6.w, 0, 6.w, height > 600 ? 10.w : 5.w),
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
                                              height: 8.w,
                                              alignment: Alignment.center,
                                              child: Text(
                                                  Languages.of(context).easy,
                                                  style: TextStyle(
                                                      color: Theme
                                                          .Colors.yellow200,
                                                      fontSize: height > 600
                                                          ? 12.sp
                                                          : 19.sp,
                                                      fontFamily:
                                                          'UTMCooperBlack'),
                                                  textAlign:
                                                      TextAlign.center))),
                                      Positioned(
                                          top: 13.w,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                              height: 15.w,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 6.5.w),
                                              alignment: Alignment.center,
                                              child: Text(
                                                listLesson[i].name,
                                                style: TextStyle(
                                                    color:
                                                        Theme.Colors.orange500,
                                                    fontSize: height > 600
                                                        ? 12.sp
                                                        : 18.sp,
                                                    fontFamily:
                                                        'UTMCooperBlack'),
                                                textAlign: TextAlign.center,
                                              ))),
                                      Positioned(
                                          bottom: 16.w,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                              height: 6.5.w,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15.w),
                                              alignment: Alignment.center,
                                              child: Text(
                                                '100',
                                                style: TextStyle(
                                                    color:
                                                        Theme.Colors.yellow100,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: height > 600
                                                        ? 25.sp
                                                        : 18.sp,
                                                    fontFamily:
                                                        'UTMCooperBlack'),
                                                textAlign: TextAlign.center,
                                              ))),
                                      Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: AnimatedOpacity(
                                              opacity: _pressId ? 1.0 : 0.85,
                                              duration:
                                                  Duration(milliseconds: 200),
                                              child: GestureDetector(
                                                  child: Container(
                                                    // color: Colors.blue,
                                                    height: 8.5.w,
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
                            ))),
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

class LessonModel {
  String id;
  String name;
  String description;
  String unitId;
  int type;
  int isLimit;
  int language;
  List tags;
  List part;
  LessonModel({
    this.id,
    this.name,
    this.description,
    this.unitId,
    this.type,
    this.isLimit,
    this.language,
    this.tags,
    this.part,
  });

  factory LessonModel.fromJson(Map<String, dynamic> parsedJson) {
    return LessonModel(
      id: parsedJson['_id'] ?? "",
      name: parsedJson['name'] ?? "",
      description: parsedJson['description'] ?? "",
      unitId: parsedJson['unitId'] ?? "",
      type: parsedJson['type'] ?? 1,
      isLimit: parsedJson['isLimit'] ?? 0,
      language: parsedJson['language'] ?? 2,
      tags: parsedJson['tags'] ?? [],
      part: parsedJson['part'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'unitId': unitId,
      'type': type,
      'isLimit': isLimit,
      'languages': language,
      'tags': tags,
      'part': part,
    };
  }
}
