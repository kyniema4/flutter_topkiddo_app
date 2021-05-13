import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:topkiddo/theme/style.dart';
import 'package:topkiddo/theme/theme.dart' as Theme;
import '../../../components/back.dart';

import 'package:easy_localization/easy_localization.dart';

class DirectoryScreen extends StatefulWidget {
  DirectoryScreen({Key key}) : super(key: key);

  @override
  _DirectoryScreenState createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
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
                                    width: 300.w,
                                    height: 180.w,
                                    alignment: Alignment.center,
                                    child: Stack(children: [
                                      Image.asset(
                                        'assets/images/directory/board-notitle.png',
                                        fit: BoxFit.contain,
                                      ),
                                      Positioned(
                                          top: 26.w,
                                          left: 0,
                                          right: 0,
                                          child: GestureDetector(
                                              child: Container(
                                                  // color: Colors.blue,
                                                  height: 30.w,
                                                  child: Image.asset(
                                                      'assets/images/directory/search-bar.png',
                                                      fit: BoxFit.contain)),
                                              onTap: () {})),
                                      Positioned(
                                        top: 32.w,
                                        left: 30.w,
                                        right: 0,
                                        child: Container(

                                            // alignment: Alignment.center,
                                            // margin: EdgeInsets.symmetric(
                                            //     horizontal: 25.w),
                                            // // color: Colors.red,
                                            // height: 18.w,
                                            // child: TextFormField(
                                            //   controller: searchController,
                                            //   autofocus: false,
                                            //   style: TextStyle(
                                            //       fontSize: height > 600
                                            //           ? 18.sp
                                            //           : 28.sp,
                                            //       color: Theme.Colors.orange500,
                                            //       fontFamily: 'UTMCooperBlack'),
                                            //   decoration: InputDecoration(
                                            //       isCollapsed: true,
                                            //       contentPadding:
                                            //           EdgeInsets.symmetric(
                                            //               vertical: 2.w,
                                            //               horizontal: 6.w),
                                            //       focusedBorder: styleOutline,
                                            //       enabledBorder: styleUnderline,
                                            //       border: InputBorder.none,
                                            //       hintText: 'searchFor'.tr(),
                                            //       hintStyle: TextStyle(
                                            //           fontSize: height > 600
                                            //               ? 18.sp
                                            //               : 28.sp,
                                            //           color:
                                            //               Theme.Colors.orange500,
                                            //           fontFamily:
                                            //               'UTMCooperBlack')),
                                            // ),
                                            child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: Image.asset(
                                                    'assets/images/directory/search.png',
                                                    fit: BoxFit.contain,
                                                    width: 30,
                                                  )),
                                              Flexible(
                                                child: TextFormField(
                                                  controller: searchController,
                                                  autofocus: false,
                                                  style: TextStyle(
                                                      fontSize: height > 600
                                                          ? 18.sp
                                                          : 28.sp,
                                                      color: Theme
                                                          .Colors.orange500,
                                                      fontFamily:
                                                          'UTMCooperBlack'),
                                                  decoration: InputDecoration(
                                                      isCollapsed: true,
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 2.w,
                                                              horizontal: 6.w),
                                                      focusedBorder:
                                                          styleOutline,
                                                      enabledBorder:
                                                          styleUnderline,
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'searchFor'.tr(),
                                                      hintStyle: TextStyle(
                                                          fontSize: height > 600
                                                              ? 18.sp
                                                              : 28.sp,
                                                          color: Theme
                                                              .Colors.orange500,
                                                          fontFamily:
                                                              'UTMCooperBlack')),
                                                ),
                                              )
                                            ])),
                                      ),
                                      // Positioned(
                                      //   top: 16.w,
                                      //   left: 8.w,
                                      //   right: 8.w,
                                      //   bottom: 6.w,
                                      //   child: Container(
                                      //       clipBehavior: Clip.hardEdge,
                                      //       decoration: BoxDecoration(
                                      //         borderRadius: BorderRadius.vertical(
                                      //             bottom: Radius.circular(8.w)),
                                      //       ),
                                      //       child: SingleChildScrollView(
                                      //         padding:
                                      //             EdgeInsets.symmetric(vertical: 4.w),
                                      //         child: ListView.builder(
                                      //             shrinkWrap: true,
                                      //             physics: BouncingScrollPhysics(),
                                      //             scrollDirection: Axis.vertical,
                                      //             itemCount: 6,
                                      //             itemBuilder: (context, index) {
                                      //               return Container(
                                      //                 child: Column(children: [
                                      //                   GestureDetector(
                                      //                       child: Container(
                                      //                         alignment:
                                      //                             Alignment.center,
                                      //                         margin:
                                      //                             EdgeInsets.symmetric(
                                      //                                 vertical: 2.w),
                                      //                         padding: EdgeInsets.only(
                                      //                           left: 6.w,
                                      //                           right: 6.w,
                                      //                           bottom: 1.5.w,
                                      //                         ),
                                      //                         height: 16.w,
                                      //                         decoration: BoxDecoration(
                                      //                             image:
                                      //                                 DecorationImage(
                                      //                           image: AssetImage(
                                      //                             true
                                      //                                 ? 'assets/images/unit/course1.png'
                                      //                                 : 'assets/images/unit/course2.png',
                                      //                           ),
                                      //                           fit: BoxFit.contain,
                                      //                         )),
                                      //                         child: Row(
                                      //                           mainAxisSize:
                                      //                               MainAxisSize.min,
                                      //                           children: [
                                      //                             true
                                      //                                 ? Container(
                                      //                                     width: 7.w,
                                      //                                     height: 7.w,
                                      //                                     margin: EdgeInsets
                                      //                                         .only(
                                      //                                             right: 9
                                      //                                                 .w),
                                      //                                     child: Image.asset(
                                      //                                         'assets/images/unit/coursetick.png',
                                      //                                         fit: BoxFit
                                      //                                             .contain))
                                      //                                 : Container(
                                      //                                     width: 16.w,
                                      //                                   ),
                                      //                             Text(
                                      //                               '',
                                      //                               style: TextStyle(
                                      //                                   color: true
                                      //                                       ? Theme
                                      //                                           .Colors
                                      //                                           .yellow200
                                      //                                       : Theme
                                      //                                           .Colors
                                      //                                           .green700,
                                      //                                   fontSize:
                                      //                                       height > 600
                                      //                                           ? 20.sp
                                      //                                           : 30.sp,
                                      //                                   fontFamily:
                                      //                                       'UTMCooperBlack'),
                                      //                             ),
                                      //                           ],
                                      //                         ),
                                      //                       ),
                                      //                       onTap: () {
                                      //                         // Navigator.push(
                                      //                         //     context,
                                      //                         //     MaterialPageRoute(
                                      //                         //         builder: (BuildContext context) =>
                                      //                         //             DesignCourseScreen()));
                                      //                       })
                                      //                 ]),
                                      //               );
                                      //             }),
                                      //       )),
                                      // ),
                                    ]),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ))),
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
                                        'assets/images/button/favorite-button.png',
                                      ),
                                      fit: BoxFit.contain),
                                )),
                            onTap: () {}),
                      ],
                    )),
              ]),
            ),
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
                                    'assets/images/button/communication-with-babe.png',
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
