import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/back.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './profile-kid-edit-screen.dart';

class ProfileKidScreen extends StatefulWidget {
  @override
  _ProfileKidScreen createState() => _ProfileKidScreen();
}

class _ProfileKidScreen extends State<ProfileKidScreen> {
  TextEditingController nameController =
      new TextEditingController(text: 'Sunny 10');
  TextEditingController genderController =
      new TextEditingController(text: 'Girl');
  TextEditingController yearController = new TextEditingController(text: '5');
  TextEditingController accountController =
      new TextEditingController(text: 'Full');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                        child: Container(
                            height: 150.w,
                            width: 305.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 105.w,
                                        // color: Colors.red,
                                        margin: EdgeInsets.only(bottom: 10.w),
                                        child: Image.asset(
                                          'assets/images/profile/avt-1.png',
                                          height: 90.w,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        ProfileKidEditScreen()));
                                          },
                                          child: Image.asset(
                                            'editBtn'.tr(),
                                            height: 21.w,
                                            fit: BoxFit.contain,
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  height: double.infinity,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/profile/inforboard.png',
                                          height: double.infinity,
                                          fit: BoxFit.contain),
                                      Positioned(
                                        top: 3.w,
                                        child: Text('profile'.tr(),
                                            style: TextStyle(
                                                color: Theme.Colors.yellow300,
                                                fontSize: height > 600
                                                    ? 24.sp
                                                    : 33.sp,
                                                // fontSize: 19,
                                                fontFamily: 'UTMCooperBlack')),
                                      ),
                                      Positioned(
                                        top: 29.w,
                                        width: 171.w,
                                        height: 98.w,
                                        child: Container(
                                          // color: Color(0x55cc2eee),
                                          padding: EdgeInsets.only(
                                              left: 8.w, right: 10.w),
                                          child: Column(
                                            children: [
                                              SizedBox(height: 6.w),

                                              // input name
                                              Flex(
                                                direction: Axis.horizontal,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text('name'.tr(),
                                                        style: TextStyle(
                                                            color: Theme.Colors
                                                                .orange900,
                                                            fontSize:
                                                                height > 600
                                                                    ? 21.sp
                                                                    : 30.sp,
                                                            fontFamily:
                                                                'UTMCooperBlack')),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      height: 20.w,
                                                      child: TextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            nameController,
                                                        autofocus: false,
                                                        style: TextStyle(
                                                            color: Theme.Colors
                                                                .orange900,
                                                            fontSize:
                                                                height > 600
                                                                    ? 24.sp
                                                                    : 33.sp,
                                                            fontFamily:
                                                                'UTMCooperBlack'),
                                                        decoration:
                                                            InputDecoration(
                                                          isCollapsed: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      2.w,
                                                                      0,
                                                                      10.w,
                                                                      1.w),
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 12.w),

                                              // input gender
                                              Flex(
                                                direction: Axis.horizontal,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            right: 5.w),
                                                        child: Text(
                                                            'gender'.tr(),
                                                            style: TextStyle(
                                                                color: Theme
                                                                    .Colors
                                                                    .orange900,
                                                                height: 1.3,
                                                                fontSize:
                                                                    height > 600
                                                                        ? 21.sp
                                                                        : 29.sp,
                                                                fontFamily:
                                                                    'UTMCooperBlack')),
                                                      )),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Container(
                                                      // color: Colors.red,
                                                      alignment:
                                                          Alignment.centerRight,
                                                      height: 20.w,
                                                      child: TextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            genderController,
                                                        autofocus: false,
                                                        style: TextStyle(
                                                            color: Theme.Colors
                                                                .orange900,
                                                            fontSize:
                                                                height > 600
                                                                    ? 24.sp
                                                                    : 33.sp,
                                                            fontFamily:
                                                                'UTMCooperBlack'),
                                                        decoration:
                                                            InputDecoration(
                                                          isCollapsed: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      2.w,
                                                                      0,
                                                                      10.w,
                                                                      1.w),
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 19.w),

                                              // input year old and account
                                              Row(
                                                children: [
                                                  Flex(
                                                    direction: Axis.horizontal,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: 29.w,
                                                      ),
                                                      SizedBox(
                                                        width: 34.w,
                                                        child: Container(
                                                          // color: Colors.red,
                                                          alignment: Alignment
                                                              .centerRight,
                                                          height: 20.w,
                                                          child: TextFormField(
                                                            readOnly: true,
                                                            controller:
                                                                yearController,
                                                            autofocus: false,
                                                            style: TextStyle(
                                                                color: Theme
                                                                    .Colors
                                                                    .orange900,
                                                                fontSize:
                                                                    height > 600
                                                                        ? 24.sp
                                                                        : 33.sp,
                                                                fontFamily:
                                                                    'UTMCooperBlack'),
                                                            textAlign: TextAlign
                                                                .center,
                                                            decoration:
                                                                InputDecoration(
                                                              isCollapsed: true,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          5.w,
                                                                          0,
                                                                          5.w,
                                                                          1.w),
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Flex(
                                                    direction: Axis.horizontal,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: 52.w,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 7.w,
                                                                  left: 7.w),
                                                          child: Text(
                                                            'Tài khoản',
                                                            style: TextStyle(
                                                                color: Theme
                                                                    .Colors
                                                                    .orange900,
                                                                height: 1.3,
                                                                fontSize:
                                                                    height > 600
                                                                        ? 21.sp
                                                                        : 30.sp,
                                                                fontFamily:
                                                                    'UTMCooperBlack'),
                                                            textAlign:
                                                                TextAlign.right,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 35.w,
                                                        child: Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          height: 20.w,
                                                          child: TextFormField(
                                                            readOnly: true,
                                                            controller:
                                                                accountController,
                                                            autofocus: false,
                                                            style: TextStyle(
                                                                color: Theme
                                                                    .Colors
                                                                    .orange900,
                                                                fontSize:
                                                                    height > 600
                                                                        ? 24.sp
                                                                        : 33.sp,
                                                                fontFamily:
                                                                    'UTMCooperBlack'),
                                                            textAlign: TextAlign
                                                                .center,
                                                            decoration:
                                                                InputDecoration(
                                                              isCollapsed: true,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          5.w,
                                                                          0,
                                                                          5.w,
                                                                          1.w),
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),

                                              // SizedBox(height: 3.w),

                                              // // input address
                                              // Flex(
                                              //   direction: Axis.horizontal,
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment
                                              //           .spaceBetween,
                                              //   children: [
                                              //     Expanded(
                                              //       flex: 1,
                                              //       child: Text('address'.tr(),
                                              //           style: profileTile),
                                              //     ),
                                              //     Expanded(
                                              //       flex: 4,
                                              //       child: Container(
                                              //         alignment:
                                              //             Alignment.centerRight,
                                              //         height: 27.w,
                                              //         decoration: BoxDecoration(
                                              //             image:
                                              //                 DecorationImage(
                                              //                     alignment:
                                              //                         Alignment
                                              //                             .center,
                                              //                     image:
                                              //                         AssetImage(
                                              //                       'assets/images/profile/inputbox.png',
                                              //                     ),
                                              //                     fit: BoxFit
                                              //                         .contain)),
                                              //         child: TextFormField(
                                              //           readOnly: true,
                                              //           controller:
                                              //               addressController,
                                              //           autofocus: false,
                                              //           style: profileInput,
                                              //           decoration:
                                              //               InputDecoration(
                                              //             isCollapsed: true,
                                              //             contentPadding:
                                              //                 EdgeInsets
                                              //                     .fromLTRB(
                                              //                         10.w,
                                              //                         0,
                                              //                         10.w,
                                              //                         1.w),
                                              //             border:
                                              //                 InputBorder.none,
                                              //           ),
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5.w),
                              ],
                            )),
                      ),
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
          children: [
            Expanded(
              child: Back(buttonImage: 'assets/images/button/back-button.png'),
            ),
          ],
        ));
  }
}
