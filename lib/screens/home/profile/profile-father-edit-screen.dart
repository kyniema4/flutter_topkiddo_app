import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/back.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './profile-father-screen.dart';

class ProfileFatherEditScreen extends StatefulWidget {
  @override
  _ProfileFatherEditScreen createState() => _ProfileFatherEditScreen();
}

class _ProfileFatherEditScreen extends State<ProfileFatherEditScreen> {
  TextEditingController nameController =
      new TextEditingController(text: 'Bố Sunny');
  TextEditingController emailController =
      new TextEditingController(text: 'BoSunny@gmail.com');
  TextEditingController phoneController =
      new TextEditingController(text: '0908099990');
  TextEditingController addressController =
      new TextEditingController(text: '222 Hoan Kiem, Ha Noi');

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
                                        margin: EdgeInsets.only(bottom: 10.w),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/profile/awe-avt.png',
                                              height: 90.w,
                                              fit: BoxFit.contain,
                                            ),
                                            Container(
                                              height: 75.w,
                                              width: 55.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          13.w),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/images/profile/daddy.jpg',
                                                      ),
                                                      fit: BoxFit.cover)),
                                              child: null,
                                            )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Image.asset(
                                            'saveBtn'.tr(),
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
                                          'assets/images/profile/emprtyboard.png',
                                          height: double.infinity,
                                          fit: BoxFit.contain),
                                      Positioned(
                                        top: 3.w,
                                        child: Text('editProfile'.tr(),
                                            style: TextStyle(
                                                color: Theme.Colors.yellow300,
                                                fontSize: height > 600
                                                    ? 24.sp
                                                    : 33.sp,
                                                // fontSize: 19,
                                                fontFamily: 'UTMCooperBlack')),
                                      ),
                                      Positioned(
                                        top: 18.w,
                                        width: 175.w,
                                        height: 126.w,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.w),
                                          ),
                                          child: ListView(
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
                                                      height: 27.w,
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  image:
                                                                      AssetImage(
                                                                    'assets/images/profile/inputbox.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .contain)),
                                                      child: TextFormField(
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
                                                                      10.w,
                                                                      0,
                                                                      10.w,
                                                                      1.w),
                                                          focusedBorder:
                                                              styleOutline,
                                                          enabledBorder:
                                                              styleUnderline,
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 3.w),

                                              // input email
                                              Flex(
                                                direction: Axis.horizontal,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text('email'.tr(),
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
                                                      height: 27.w,
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  image:
                                                                      AssetImage(
                                                                    'assets/images/profile/inputbox.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .contain)),
                                                      child: TextFormField(
                                                        controller:
                                                            emailController,
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
                                                                      10.w,
                                                                      0,
                                                                      10.w,
                                                                      1.w),
                                                          focusedBorder:
                                                              styleOutline,
                                                          enabledBorder:
                                                              styleUnderline,
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 3.w),

                                              // input phone number
                                              Flex(
                                                direction: Axis.horizontal,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text('phone'.tr(),
                                                        style: TextStyle(
                                                            color: Theme.Colors
                                                                .orange900,
                                                            height: 1.3,
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
                                                      height: 27.w,
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  image:
                                                                      AssetImage(
                                                                    'assets/images/profile/inputbox.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .contain)),
                                                      child: TextFormField(
                                                        controller:
                                                            phoneController,
                                                        autofocus: false,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
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
                                                                      10.w,
                                                                      0,
                                                                      10.w,
                                                                      1.w),
                                                          focusedBorder:
                                                              styleOutline,
                                                          enabledBorder:
                                                              styleUnderline,
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 3.w),

                                              // input address
                                              Flex(
                                                direction: Axis.horizontal,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text('address'.tr(),
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
                                                      height: 27.w,
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  image:
                                                                      AssetImage(
                                                                    'assets/images/profile/inputbox.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .contain)),
                                                      child: TextFormField(
                                                        controller:
                                                            addressController,
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
                                                                      10.w,
                                                                      0,
                                                                      10.w,
                                                                      1.w),
                                                          focusedBorder:
                                                              styleOutline,
                                                          enabledBorder:
                                                              styleUnderline,
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                    right: 33.w,
                    bottom: 3.w,
                    child: GestureDetector(
                        child: Container(
                            width: 20.w,
                            height: 20.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/profile/enter-codebutton.png'),
                                  fit: BoxFit.contain),
                            )),
                        onTap: () {}),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
