// bấm từ designed-courses hoặc library item

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/theme.dart' as Theme;
import 'package:easy_localization/easy_localization.dart';

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
    // return showDialog<void>(
    //   context: context,
    //   barrierDismissible: true, // có thể click outside để thoát dialog
    //   builder: (BuildContext context) {
    //     double height = MediaQuery.of(context).size.height;
    //     return SimpleDialog(
    //         backgroundColor: Colors.transparent,
    //         insetPadding: EdgeInsets.zero,
    //         titlePadding: EdgeInsets.zero,
    //         contentPadding: EdgeInsets.zero,
    //         elevation: 0,
    //         children: [
    //           Container(
    //             width: 145.w,
    //             height: 140.w,
    //             child: Stack(
    //               alignment: Alignment.center,
    //               clipBehavior: Clip.none,
    //               children: [
    //                 Container(
    //                     child: Image.asset(
    //                   'assets/images/lesson/notification-board.png',
    //                   fit: BoxFit.fitHeight,
    //                   height: double.infinity,
    //                 )),
    //                 Positioned(
    //                   top: 0.5.w,
    //                   child: Container(
    //                     // color: Colors.red,
    //                     height: 15.w,
    //                     alignment: Alignment.center,
    //                     child: Text(
    //                       'notification'.tr().toUpperCase(),
    //                       style: TextStyle(
    //                           height: 1.4,
    //                           color: Theme.Colors.yellow300,
    //                           fontSize: height > 600 ? 25.sp : 29.sp,
    //                           fontFamily: 'UTMCooperBlack'),
    //                     ),
    //                   ),
    //                 ),
    //                 Positioned(
    //                     top: 26.w,
    //                     child: Container(
    //                         // color: Colors.red,
    //                         width: 80.w,
    //                         height: 38.w,
    //                         alignment: Alignment.center,
    //                         child: Text(
    //                           'limitModalContent'.tr(),
    //                           textAlign: TextAlign.center,
    //                           style: TextStyle(
    //                               height: 1.3,
    //                               color: Theme.Colors.orange900,
    //                               fontSize: height > 600 ? 19.sp : 29.sp,
    //                               fontFamily: 'UTMCooperBlack'),
    //                         ))),
    //                 Positioned(
    //                     top: 132.w,
    //                     child: Container(
    //                         // color: Colors.red,
    //                         child: GestureDetector(
    //                       onTap: () {},
    //                       child: Image.asset(
    //                         'buyNow'.tr(),
    //                         fit: BoxFit.contain,
    //                         height: 19.w,
    //                       ),
    //                     ))),
    //                 Positioned(
    //                     top: 10.w,
    //                     right: 1.5.w,
    //                     child: Container(
    //                         // color: Colors.red,
    //                         child: GestureDetector(
    //                       onTap: () {
    //                         Navigator.of(context).pop();
    //                       },
    //                       child: Image.asset(
    //                         'assets/images/button/closeBoard-button.png',
    //                         fit: BoxFit.contain,
    //                         height: 18.w,
    //                       ),
    //                     ))),
    //               ],
    //             ),
    //           ),
    //         ]);
    //   },
    // );
  }
}
