import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topkiddo/components/Loading_dialog.dart';
import 'package:topkiddo/components/Show_alert.dart';
import '../../Utils/http_service.dart';
import '../../socialconnect/google_connector.dart';
import '../../theme/style.dart';
import '../../theme/theme.dart' as Theme;
import '../../components/back.dart';
import '../../components/settings.dart';
import '../home/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final bgImage = AssetImage('assets/images/background/bg_iphone.jpg');
  // TextEditingController numberController =
  //     new TextEditingController(text: "0772026582");
  // TextEditingController passwordController =
  //     new TextEditingController(text: "123456");
  TextEditingController numberController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  _changeHomePage() {
    
    if (numberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          // SnackBar(content: Text(Languages.of(context).canNotPhoneNumber)));
          SnackBar(content: Text('canNotPhoneNumber'.tr())));
    } else if (numberController.text.length != 10 &&
        numberController.text.isNotEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('phoneNumber10'.tr())));
    } else if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('canNotPassword'.tr())));
    } else {
      submitLogin();
    }
  }

  loginSocialNetwork({type = 5}) async {
    var loginSuccess = 0;
    switch (type) {
      case 0: // facebook
        // loginSuccess = await loginPhone();
        print('login phone');
        break;
      case 1: // google
        loginSuccess = await loginGoogle();
        break;
      default:
        return false;
    }
  }

  void submitLogin() async {
    if (numberController.text.indexOf('0') == 0) {
      numberController.text = '+84' + numberController.text.substring(1);
    }
    Dialogs.showLoadingDialog(context);
    try {
      await fetch(
              url: ApiList.signWithPhone,
              body: {
                "username": numberController.text,
                "password": passwordController.text,
              },
              needReturnErrorCode: true)
          .then((val) async {
        if (val['success']) {
          print(val['data']);
          String token = val['data']['token'];
          setToken(token);
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false);
        }
      });
    } catch (e) {
      numberController.clear();
      passwordController.clear();
      Navigator.of(context, rootNavigator: true).pop();
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text(e.message)));
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('alertConnectionInternet'.tr())));
    }
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(bgImage, context);

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
                                              'login'.tr().toUpperCase(),
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
                                              hintText: 'phoneNumber'.tr(),
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
                                              hintText: 'password'.tr(),
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
                                                        'imgLogin'.tr()),
                                                    fit: BoxFit.contain),
                                                // button text
                                              )),
                                          onTap: () {
                                            _changeHomePage();
                                            //submitLogin();
                                          },
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
