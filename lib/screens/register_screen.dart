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
                    width: width,
                    height: height,
                    decoration: backgroundImage,
                    child: null,
                  ),
                  Container(
                      decoration: blackBackground,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Back(
                                buttonImage:
                                    'assets/images/button/back-button.png'),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 150.w,
                                  width: 148.w,
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/login_page/registerboard.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 2,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                            alignment: Alignment.center,
                                            height: 17.w,
                                            child: Text('REGISTER',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color:
                                                        Theme.Colors.yellow200,
                                                    fontSize: height > 600
                                                        ? 25.sp
                                                        : 30.sp,
                                                    fontFamily:
                                                        'UTMCooperBlack'))),
                                      ),
                                      Positioned(
                                        top: 26.w,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 25.w),
                                          height: 18.w,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            autofocus: false,
                                            style: TextStyle(
                                                fontSize: height > 600
                                                    ? 18.sp
                                                    : 28.sp,
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
                                                hintText: 'Phone number',
                                                hintStyle: TextStyle(
                                                    fontSize: height > 600
                                                        ? 18.sp
                                                        : 28.sp,
                                                    color:
                                                        Theme.Colors.orange500,
                                                    fontFamily:
                                                        'UTMCooperBlack')),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 51.w,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 25.w),
                                          height: 18.w,
                                          child: TextField(
                                            obscureText: true,
                                            autofocus: false,
                                            style: TextStyle(
                                                fontSize: height > 600
                                                    ? 18.sp
                                                    : 28.sp,
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
                                                hintText: 'Password',
                                                hintStyle: TextStyle(
                                                    fontSize: height > 600
                                                        ? 18.sp
                                                        : 28.sp,
                                                    color:
                                                        Theme.Colors.orange500,
                                                    fontFamily:
                                                        'UTMCooperBlack')),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 56.w,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 25.w),
                                          height: 18.w,
                                          child: TextField(
                                            obscureText: true,
                                            autofocus: false,
                                            style: TextStyle(
                                                fontSize: height > 600
                                                    ? 18.sp
                                                    : 28.sp,
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
                                                        ? 18.sp
                                                        : 28.sp,
                                                    color:
                                                        Theme.Colors.orange500,
                                                    fontFamily:
                                                        'UTMCooperBlack')),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: GestureDetector(
                                              child: Container(
                                                  width: 75.w,
                                                  height: 17.w,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/images/login_page/register-button.png',
                                                        ),
                                                        fit: BoxFit.contain),
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
