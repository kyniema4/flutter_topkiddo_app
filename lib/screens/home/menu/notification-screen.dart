import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../../components/back.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreen createState() => _NotificationScreen();
}

class _NotificationScreen extends State<NotificationScreen> {
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
                    child: Stack(children: <Widget>[
                      Center(
                          child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                              // height: 150.w,
                              height: 153.w,
                              margin: EdgeInsets.only(top: 14.w),
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    // "assets/images/menu/board.png",
                                    "assets/images/directory/board-notitle.png",
                                    fit: BoxFit.contain,
                                    height: double.infinity,
                                  ),
                                  Positioned(
                                      top: 2.w,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Align(
                                          child: Container(
                                              height: 137.w,
                                              width: 265.w,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                  // color: Colors.blueAccent
                                                  //     .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                topLeft: Radius.elliptical(
                                                    150.w, 5.w),
                                                topRight: Radius.elliptical(
                                                    150.w, 5.w),
                                                bottomLeft:
                                                    Radius.circular(5.w),
                                                bottomRight:
                                                    Radius.circular(5.w),
                                              )),
                                              child: SingleChildScrollView(
                                                padding:
                                                    EdgeInsets.only(top: 11.w),
                                                child: Column(
                                                  children: [
                                                    for (var i = 0; i < 5; i++)
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 7.w,
                                                                bottom: 7.w),
                                                        decoration:
                                                            BoxDecoration(
                                                                border: Border(
                                                          bottom: BorderSide(
                                                              color: Theme
                                                                  .Colors
                                                                  .grey100,
                                                              width: 1),
                                                        )),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Image.asset(
                                                                'assets/images/menu/notifications.png',
                                                                fit: BoxFit
                                                                    .contain,
                                                                height: 18.w),
                                                            SizedBox(
                                                                width: 4.w),
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Topkido',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize: height >
                                                                              600
                                                                          ? 23.sp
                                                                          : 32.sp,
                                                                      fontFamily:
                                                                          'UTMCooperBlack',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      letterSpacing:
                                                                          0.5,
                                                                      color: Theme
                                                                          .Colors
                                                                          .orangeDark,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          1.w),
                                                                  Text(
                                                                    'Chào mừng bạn đến với Topkido. Chúc bạn có nhiều giây phút bổ ích với bé!',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize: height >
                                                                              600
                                                                          ? 18.sp
                                                                          : 24.sp,
                                                                      fontFamily:
                                                                          'UTMCooperBlack',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      letterSpacing:
                                                                          0.5,
                                                                      color: Theme
                                                                          .Colors
                                                                          .orangeDark,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          1.w),
                                                                  Text(
                                                                    'Jan 19, 2021',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize: height >
                                                                              600
                                                                          ? 15.sp
                                                                          : 20.sp,
                                                                      fontFamily:
                                                                          'UTMCooperBlack',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w900,
                                                                      letterSpacing:
                                                                          0.5,
                                                                      color: Theme
                                                                          .Colors
                                                                          .orangeLight,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              )))),
                                  Positioned(
                                    // top: -1.4.w,
                                    top: -5.7.w,
                                    child: Container(
                                        height: 23.w,
                                        width: 95.w,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(bottom: 2.w),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/menu/name-board.png'),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        child: Text('notifications'.tr(),
                                            style: TextStyle(
                                                height: 1.2,
                                                color: Theme.Colors.yellow300,
                                                fontSize: height > 600
                                                    ? 28.sp
                                                    : 42.sp,
                                                fontFamily: 'UTMCooperBlack'),
                                            textAlign: TextAlign.center)),
                                  ),
                                ],
                              )),
                        ],
                      )),
                      TopButton(),
                    ])),
              ],
            ),
          ),
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
          ],
        ));
  }
}
