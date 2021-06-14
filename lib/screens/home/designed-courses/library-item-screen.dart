// bấm từ nút thư viện của trang design courses

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:topkiddo/screens/home/designed-courses/courses-two-screen.dart';

import '../../../components/back.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './courses-two-screen.dart';

class LibraryItemScreen extends StatefulWidget {
  @override
  _LibraryItemScreen createState() => _LibraryItemScreen();
}

class _LibraryItemScreen extends State<LibraryItemScreen>
    with SingleTickerProviderStateMixin {
  bool _pressId = true;
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  List<LibraryItemModel> libraryItems = [
    LibraryItemModel(
      id: 1,
      name: 'Lesson 1',
      boardType: 'assets/images/lesson/lesson-bird.png',
      buttonType: true,
    ),
    LibraryItemModel(
      id: 2,
      name: 'Lesson 2',
      boardType: 'assets/images/lesson/lesson-clothes.png',
      buttonType: true,
    ),
    LibraryItemModel(
      id: 3,
      name: 'Lesson 3',
      boardType: 'assets/images/lesson/lesson-transportation.png',
      buttonType: true,
    ),
    LibraryItemModel(
      id: 4,
      name: 'Lesson 4',
      boardType: 'assets/images/lesson/lesson-waterSea.png',
      buttonType: true,
    ),
    LibraryItemModel(
      id: 5,
      name: 'Lesson 5',
      boardType: 'assets/images/lesson/disable-board.png',
      buttonType: false,
    ),
    LibraryItemModel(
      id: 6,
      name: 'Lesson 6',
      boardType: 'assets/images/lesson/disable-board.png',
      buttonType: false,
    ),
  ];

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // có thể click outside để thoát dialog
      builder: (BuildContext context) {
        double height = MediaQuery.of(context).size.height;
        return SimpleDialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            elevation: 0,
            children: [
              Container(
                width: 145.w,
                height: 140.w,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                        child: Image.asset(
                      'assets/images/lesson/notification-board.png',
                      fit: BoxFit.fitHeight,
                      height: double.infinity,
                    )),
                    Positioned(
                      top: 0.5.w,
                      child: Container(
                        // color: Colors.red,
                        height: 15.w,
                        alignment: Alignment.center,
                        child: Text(
                          'notification'.tr().toUpperCase(),
                          style: TextStyle(
                              height: 1.4,
                              color: Theme.Colors.yellow300,
                              fontSize: height > 600 ? 25.sp : 29.sp,
                              fontFamily: 'UTMCooperBlack'),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 26.w,
                        child: Container(
                            // color: Colors.red,
                            width: 80.w,
                            height: 38.w,
                            alignment: Alignment.center,
                            child: Text(
                              'limitModalContent'.tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.3,
                                  color: Theme.Colors.orange900,
                                  fontSize: height > 600 ? 19.sp : 29.sp,
                                  fontFamily: 'UTMCooperBlack'),
                            ))),
                    Positioned(
                        top: 132.w,
                        child: Container(
                            // color: Colors.red,
                            child: GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'buyNow'.tr(),
                            fit: BoxFit.contain,
                            height: 19.w,
                          ),
                        ))),
                    Positioned(
                        top: 10.w,
                        right: 1.5.w,
                        child: Container(
                            // color: Colors.red,
                            child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            'assets/images/button/closeBoard-button.png',
                            fit: BoxFit.contain,
                            height: 18.w,
                          ),
                        ))),
                  ],
                ),
              ),
            ]);
      },
    );
  }

  _showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(20.0)),
            content: Container(
              // constraints: BoxConstraints(minHeight: 0.1.sw),
              width: 50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                          text: "lfugiat quo ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black,
                              wordSpacing: 1)),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
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
                              children: [
                                for (var item in libraryItems)
                                  Container(
                                    width: 47.w,
                                    height: 64.5.w,
                                    margin: EdgeInsets.fromLTRB(
                                        6.w, 0, 6.w, height > 600 ? 10.w : 5.w),
                                    child: Stack(children: [
                                      Image.asset(
                                        item.boardType,
                                        fit: BoxFit.contain,
                                      ),
                                      Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                              height: 8.w,
                                              alignment: Alignment.center,
                                              child: Text('easy'.tr(),
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
                                                item.name,
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
                                                        item.buttonType
                                                            ? 'startBtn'.tr()
                                                            : 'startDisableBtn'
                                                                .tr(),
                                                        fit: BoxFit.contain),
                                                  ),
                                                  onTap: () {
                                                    if (item.buttonType)
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  CoursesTwoScreen()));
                                                    else
                                                      _showMyDialog();
                                                    // _showSimpleModalDialog(
                                                    // context);
                                                  }
                                                  // onTap: () async {
                                                  //   await getDataFlashCard(
                                                  //       widget.lesson['docs'][i]
                                                  //           ['_id']);
                                                  //   // AnimationScreen()));
                                                  // }
                                                  )))
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
    double height = MediaQuery.of(context).size.height;
    return Container(
        height: 32.w,
        // padding: new EdgeInsets.only(top: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Back(buttonImage: 'assets/images/button/back-button.png'),
            ),
            Expanded(
                child: Text('Unit 1',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: height > 600 ? 27.sp : 40.sp,
                        fontFamily: 'UTMCooperBlack'),
                    textAlign: TextAlign.center)),
            Expanded(child: Container()),
          ],
        ));
  }
}

class LibraryItemModel {
  final int id;
  final String name;
  final String boardType;
  final bool buttonType;
  LibraryItemModel({
    this.id,
    this.name,
    this.boardType,
    this.buttonType,
  });
}
