import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../../components/back.dart';

class EnterCodeScreen extends StatefulWidget {
  @override
  _EnterCodeScreen createState() => _EnterCodeScreen();
}

class _EnterCodeScreen extends State<EnterCodeScreen> {
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
                              height: 150.w,
                              margin: EdgeInsets.only(top: 9.w),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/menu/license-board.png",
                                    fit: BoxFit.contain,
                                    height: double.infinity,
                                  ),
                                  Positioned(
                                    top: 0.5.w,
                                    child: Container(
                                        height: 20.w,
                                        alignment: Alignment.center,
                                        child: Text('enterCode'.tr(),
                                            style: TextStyle(
                                                height: 1.2,
                                                color: Theme.Colors.yellow300,
                                                fontSize: height > 600
                                                    ? 28.sp
                                                    : 42.sp,
                                                fontFamily: 'UTMCooperBlack'),
                                            textAlign: TextAlign.center)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15.w),
                                    padding: EdgeInsets.only(top: 8.w),
                                    // color: Colors.blueAccent.withOpacity(0.5),
                                    height: 120.w,
                                    width: 230.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text("enterCodeContent".tr(),
                                                style: TextStyle(
                                                    height: 1.2,
                                                    color:
                                                        Theme.Colors.orange900,
                                                    fontSize: height > 600
                                                        ? 22.sp
                                                        : 32.sp,
                                                    fontFamily:
                                                        'UTMCooperBlack'),
                                                textAlign: TextAlign.center),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4.w, bottom: 4.w),
                                              child: Text("enterCodeTitle".tr(),
                                                  style: TextStyle(
                                                      height: 1.2,
                                                      color: Theme
                                                          .Colors.orange900,
                                                      fontSize: height > 600
                                                          ? 22.sp
                                                          : 32.sp,
                                                      fontFamily:
                                                          'UTMCooperBlack'),
                                                  textAlign: TextAlign.center),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 27.w,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              // color: Colors.red,
                                              image: DecorationImage(
                                                  alignment: Alignment.center,
                                                  image: AssetImage(
                                                    'assets/images/menu/enter-key-license.png',
                                                  ),
                                                  fit: BoxFit.fill)),
                                          child: TextFormField(
                                            autofocus: false,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Theme.Colors.orange900,
                                                fontSize: height > 600
                                                    ? 22.sp
                                                    : 32.sp,
                                                fontFamily: 'UTMCooperBlack'),
                                            decoration: InputDecoration(
                                              isCollapsed: true,
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      10.w, 0, 10.w, 1.w),
                                              focusedBorder: styleOutline,
                                              enabledBorder: styleUnderline,
                                              border: InputBorder.none,
                                              hintText: 'enterKey'.tr(),
                                              hintStyle: TextStyle(
                                                  color: Theme.Colors.orangeDark
                                                      .withOpacity(0.5),
                                                  fontSize: height > 600
                                                      ? 22.sp
                                                      : 32.sp,
                                                  fontFamily: 'UTMCooperBlack'),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Image.asset(
                                              'assets/images/menu/send-license.png',
                                              height: 18.w,
                                              fit: BoxFit.contain),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.w, bottom: 1.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {},
                                                child: Text(
                                                  'forgotKey'.tr(),
                                                  style: TextStyle(
                                                      color:
                                                          Theme.Colors.green500,
                                                      fontSize: height > 600
                                                          ? 20.sp
                                                          : 30.sp,
                                                      fontFamily:
                                                          'UTMCooperBlack'),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Text(
                                                  'buyKey'.tr(),
                                                  style: TextStyle(
                                                      color:
                                                          Theme.Colors.green500,
                                                      fontSize: height > 600
                                                          ? 20.sp
                                                          : 30.sp,
                                                      fontFamily:
                                                          'UTMCooperBlack'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
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
