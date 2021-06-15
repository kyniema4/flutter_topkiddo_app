// bấm từ designed-courses hoặc library item

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/theme.dart' as Theme;
import 'package:easy_localization/easy_localization.dart';
import '../home/designed-courses/subcribe_screen.dart';

class ShowModal {
  static Future<void> showModalLimit(context) async {
    double height = MediaQuery.of(context).size.height;

    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            // offset: Offset(a1.value, a2.value),
            child: Opacity(
              opacity: a1.value,
              child: SimpleDialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                elevation: 0,
                children: [
                  Container(
                    // color: Colors.red,
                    // width: 160.w,
                    height: 160.w,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                            width: 135.w,
                            child: Image.asset(
                              'assets/images/lesson/notification-board.png',
                              fit: BoxFit.fitWidth,
                            )),
                        Positioned(
                          top: 16.w,
                          child: Container(
                            // color: Colors.red,
                            height: 14.w,
                            alignment: Alignment.center,
                            child: Text(
                              'notification'.tr().toUpperCase(),
                              style: TextStyle(
                                  height: 1.4,
                                  color: Theme.Colors.yellow300,
                                  fontSize: height > 600 ? 20.sp : 29.sp,
                                  fontFamily: 'UTMCooperBlack'),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 37.w,
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
                                      fontSize: height > 600 ? 19.sp : 28.sp,
                                      fontFamily: 'UTMCooperBlack'),
                                ))),
                        Positioned(
                            top: 137.w,
                            child: Container(
                                child: GestureDetector(
                              onTap: () async {
                                Navigator.pop(context);
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SubcribeScreen()));
                              },
                              child: Image.asset(
                                'buyNow'.tr(),
                                fit: BoxFit.contain,
                                height: 17.w,
                              ),
                            ))),
                        Positioned(
                            top: 23.w,
                            right: height > 376 ? -4.w : 2.w,
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
                  )
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }
}
