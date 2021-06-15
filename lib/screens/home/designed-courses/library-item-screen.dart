// bấm từ nút thư viện của trang design courses

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/back.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../home/designed-courses/courses-two-screen.dart';
import '../../home/modal-limit-lesson.dart';
import 'package:easy_localization/easy_localization.dart';
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
                                                      ShowModal.showModalLimit(
                                                          context);
                                                    // showGeneralDialog(
                                                    //     barrierColor: Colors
                                                    //         .black
                                                    //         .withOpacity(0.5),
                                                    //     transitionBuilder:
                                                    //         (context, a1, a2,
                                                    //             widget) {
                                                    //       return Transform
                                                    //           .scale(
                                                    //         scale: a1.value,
                                                    //         child: Opacity(
                                                    //           opacity:
                                                    //               a1.value,
                                                    //           child:
                                                    //               AlertDialog(
                                                    //             shape: OutlineInputBorder(
                                                    //                 borderRadius:
                                                    //                     BorderRadius.circular(
                                                    //                         16.0)),
                                                    //             title: Text(
                                                    //                 'Hello!!'),
                                                    //             content: Text(
                                                    //                 'How are you?'),
                                                    //           ),
                                                    //         ),
                                                    //       );
                                                    //     },
                                                    //     transitionDuration:
                                                    //         Duration(
                                                    //             milliseconds:
                                                    //                 200),
                                                    //     barrierDismissible:
                                                    //         true,
                                                    //     barrierLabel: '',
                                                    //     context: context,
                                                    //     pageBuilder: (context,
                                                    //         animation1,
                                                    //         animation2) {});
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
