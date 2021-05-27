import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../../components/back.dart';

class WriteForKidsScreen extends StatefulWidget {
  @override
  _WriteForKidsScreen createState() => _WriteForKidsScreen();
}

class _WriteForKidsScreen extends State<WriteForKidsScreen> {
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
                  decoration: backgroundImage,
                  child: null,
                ),
                Container(
                    height: height,
                    decoration: blackBackground,
                    child: Stack(children: <Widget>[
                      Center(
                          child: Container(
                              // color: Colors.red,
                              height: 170.w,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                        height: 150.w,
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                              "assets/images/menu/board-for-kid.png",
                                              fit: BoxFit.cover,
                                            ),
                                            Positioned(
                                                top: 0,
                                                bottom: 0,
                                                left: 0,
                                                right: 0,
                                                child: Align(
                                                    child: Container(
                                                  margin: new EdgeInsets.only(
                                                      left: 28.w,
                                                      right: 28.w,
                                                      top: 7.w),
                                                  // color: Colors.blueAccent
                                                  //     .withOpacity(0.5),
                                                  height: 90.w,
                                                  child: TextFormField(
                                                    maxLines: null,
                                                    minLines: 5,
                                                    textInputAction:
                                                        TextInputAction.newline,
                                                    textAlign: TextAlign.center,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .center,
                                                    autofocus: true,
                                                    style: TextStyle(
                                                      fontSize: height > 600
                                                          ? 24.sp
                                                          : 60.sp,
                                                      fontFamily:
                                                          'UTMCooperBlack',
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color:
                                                          Theme.Colors.red100,
                                                      letterSpacing: 0.5,
                                                    ),
                                                    decoration:
                                                        new InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              vertical: 10.0,
                                                              horizontal: 0.0),
                                                      hintText:
                                                          'typeAnything'.tr(),
                                                      hintMaxLines: 3,
                                                      hintStyle: TextStyle(
                                                        fontSize: height > 600
                                                            ? 24.sp
                                                            : 60.sp,
                                                        fontFamily:
                                                            'UTMCooperBlack',
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Theme
                                                            .Colors.red100
                                                            .withOpacity(0.2),
                                                        letterSpacing: 0.5,
                                                      ),
                                                      border: InputBorder.none,
                                                      // fillColor: Colors
                                                      //     .amberAccent
                                                      //     .withOpacity(0.4),
                                                      // filled: true,
                                                    ),
                                                    onEditingComplete: () {
                                                      FocusScope.of(context)
                                                          .nextFocus();
                                                    },
                                                  ),
                                                )))
                                          ],
                                        )),
                                  ),
                                  // Positioned(
                                  //   top: height > 600 ? 11.w : 13.w,
                                  //   left: 0,
                                  //   right: 0,
                                  //   child: Align(
                                  //       child: Text(
                                  //     'writeForKidTitle'.tr(),
                                  //     style: TextStyle(
                                  //         fontSize:
                                  //             height > 600 ? 24.sp : 35.sp,
                                  //         fontFamily: 'UTMCooperBlack',
                                  //         fontWeight: FontWeight.w900,
                                  //         color: Theme.Colors.yellow300,
                                  //         letterSpacing: 0.5),
                                  //   )),
                                  // ),
                                ],
                              ))),
                      // TopButton(),
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