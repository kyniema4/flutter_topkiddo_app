import 'package:flutter/material.dart';
import 'package:topkiddo/socialconnect/phone_connector.dart';
import '../../socialconnect/google_connector.dart';
import '../../theme/style.dart';
import '../../theme/theme.dart' as Theme;
import '../../components/back.dart';
import '../../components/settings.dart';
import '../home/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../localization/language/languages.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController numberController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  _changeHomePage() {
    // if (numberController.text.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text(Languages.of(context).canNotPhoneNumber)));
    // } else if (numberController.text.length != 10 &&
    //     numberController.text.isNotEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text(Languages.of(context).phoneNumber10)));
    // } else if (passwordController.text.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text(Languages.of(context).canNotPassword)));
    // } else {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    // }
  }

  loginSocialNetwork({type = 5}) async {
    var loginSuccess = 0;
    switch (type) {
      case 0: // facebook
        loginSuccess = await loginPhone();
        break;
      case 1: // google
        loginSuccess = await loginGoogle();
        break;
      default:
        return false;
    }
  }

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
                                          'assets/images/login_page/loginboard.png',
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
                                          child: Text(
                                              Languages.of(context)
                                                  .login
                                                  .toUpperCase(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Theme.Colors.yellow200,
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
                                        // color: Colors.red,
                                        height: 18.w,
                                        child: TextFormField(
                                          controller: numberController,
                                          keyboardType: TextInputType.number,
                                          autofocus: false,
                                          style: TextStyle(
                                              fontSize:
                                                  height > 600 ? 18.sp : 28.sp,
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
                                              hintText: Languages.of(context)
                                                  .phoneNumber,
                                              hintStyle: TextStyle(
                                                  fontSize: height > 600
                                                      ? 18.sp
                                                      : 28.sp,
                                                  color: Theme.Colors.orange500,
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
                                        // color: Colors.red,
                                        height: 18.w,
                                        child: TextFormField(
                                          controller: passwordController,
                                          obscureText: true,
                                          autofocus: false,
                                          style: TextStyle(
                                              fontSize:
                                                  height > 600 ? 18.sp : 28.sp,
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
                                              hintText: Languages.of(context)
                                                  .password,
                                              hintStyle: TextStyle(
                                                  fontSize: height > 600
                                                      ? 18.sp
                                                      : 28.sp,
                                                  color: Theme.Colors.orange500,
                                                  fontFamily:
                                                      'UTMCooperBlack')),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 33.w,
                                      left: 15.w,
                                      right: 15.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              child: Container(
                                                  // width: 50,
                                                  // height: 50,
                                                  width: 28.w,
                                                  height: 28.w,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/images/login_page/fb-button.png',
                                                        ),
                                                        fit: BoxFit.fitWidth),
                                                    // button text
                                                  )),
                                              onTap: () {
                                                loginSocialNetwork(type: 0);
                                              }),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          GestureDetector(
                                              child: Container(
                                                  width: 28.w,
                                                  height: 28.w,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/images/login_page/g+button.png',
                                                        ),
                                                        fit: BoxFit.fitWidth),
                                                    // button text
                                                  )),
                                              onTap: () {
                                                loginSocialNetwork(type: 1);
                                              }),
                                        ],
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
                                              width: 75.w,
                                              height: 17.w,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      'assets/images/login_page/loginbutton1.png',
                                                    ),
                                                    fit: BoxFit.contain),
                                                // button text
                                              )),
                                          onTap: _changeHomePage,
                                        ),
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
          ),
        ),
      ),
    );
  }
}
