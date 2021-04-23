import 'package:flutter/material.dart';
import '../theme/theme.dart' as Theme;
import '../theme/style.dart';
import '../components/back.dart';
import '../components/settings.dart';
import 'home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
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
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: backgroundImage,
                    child: null,
                  ),
                  Container(
                      // color: Color.fromRGBO(0, 0, 0, 0.49),
                      decoration: blackBackground,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Back(),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 117.w,
                                  width: 114.w,
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/login_page/registerboard.png',
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 6,
                                          left: 0,
                                          right: 0,
                                          child: Text('REGISTER',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Theme.Colors.yellow200,
                                                  fontSize: height > 600
                                                      ? 15.sp
                                                      : 25.sp,
                                                  fontFamily:
                                                      'UTMCooperBlack'))),
                                      Positioned(
                                        top: 20.w,
                                        left: 18.w,
                                        right: 18.w,
                                        child: Container(
                                          height: 14.w,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            autofocus: false,
                                            style: styleTextInput,
                                            decoration: InputDecoration(
                                                isCollapsed: true,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 2.w,
                                                        horizontal: 6.w),
                                                focusedBorder: styleOutline,
                                                enabledBorder: styleUnderline,
                                                border: InputBorder.none,
                                                hintText: 'Phone number',
                                                hintStyle: TextStyle(
                                                    fontSize: height > 600
                                                        ? 14.sp
                                                        : 23.sp,
                                                    color:
                                                        Theme.Colors.orange500,
                                                    fontFamily:
                                                        'UTMCooperBlack')),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 39.w,
                                        left: 18.w,
                                        right: 18.w,
                                        child: Container(
                                          height: 14.w,
                                          child: TextField(
                                            obscureText: true,
                                            autofocus: false,
                                            style: styleTextInput,
                                            decoration: InputDecoration(
                                                isCollapsed: true,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 2.w,
                                                        horizontal: 6.w),
                                                focusedBorder: styleOutline,
                                                enabledBorder: styleUnderline,
                                                border: InputBorder.none,
                                                hintText: 'Password',
                                                hintStyle: TextStyle(
                                                    fontSize: height > 600
                                                        ? 14.sp
                                                        : 23.sp,
                                                    color:
                                                        Theme.Colors.orange500,
                                                    fontFamily:
                                                        'UTMCooperBlack')),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 58.5.w,
                                        left: 18.w,
                                        right: 18.w,
                                        child: Container(
                                          height: 14.w,
                                          child: TextField(
                                            obscureText: true,
                                            autofocus: false,
                                            style: TextStyle(
                                                fontSize: height > 600
                                                    ? 14.sp
                                                    : 23.sp,
                                                color: Theme.Colors.orange500,
                                                fontFamily: 'UTMCooperBlack'),
                                            decoration: InputDecoration(
                                                isCollapsed: true,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 2.w,
                                                        horizontal: 6.w),
                                                focusedBorder: styleOutline,
                                                enabledBorder: styleUnderline,
                                                border: InputBorder.none,
                                                hintText: 'Confirm Password',
                                                hintStyle: TextStyle(
                                                    fontSize: height > 600
                                                        ? 14.sp
                                                        : 23.sp,
                                                    color:
                                                        Theme.Colors.orange500,
                                                    fontFamily:
                                                        'UTMCooperBlack')),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0.0,
                                        left: 0.0,
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: GestureDetector(
                                              child: Container(
                                                  width: 62.w,
                                                  height: 15.w,
                                                  decoration: BoxDecoration(
                                                    // color: Colors.grey,
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/images/login_page/register-button.png',
                                                        ),
                                                        fit: BoxFit.fitWidth),
                                                    // button text
                                                  )),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            HomeScreen()));
                                              }),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                          ),
                          Expanded(
                            flex: 2,
                            child: Settings(),
                          )
                        ],
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
