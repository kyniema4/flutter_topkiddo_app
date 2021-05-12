import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:topkiddo/components/Loading_dialog.dart';
import 'package:topkiddo/screens/home/home_screen.dart';
import '../../theme/theme.dart' as Theme;
import '../../theme/style.dart';
import '../../components/back.dart';
import '../../components/settings.dart';
import './login_screen.dart';
import 'package:easy_localization/easy_localization.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController comfirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId;
  bool showLoading = false;

  

  _changeWidgetOTP() async {
    if (numberController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('canNotPhoneNumber'.tr())));
    } else if (numberController.text.length != 10 &&
        numberController.text.isNotEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('phoneNumber10'.tr())));
    } else if (passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('canNotPassword'.tr())));
    } else if (comfirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('canNotconfirmPassword'.tr())));
    } else if (comfirmPasswordController.text != passwordController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('passwordSameAbove'.tr())));
    } else {
      numberController.text = '+84' + numberController.text.substring(1);
      Dialogs.showLoadingDialog(context);
      await _auth.verifyPhoneNumber(
        phoneNumber: numberController.text,
        verificationCompleted: (phoneAuthCredential) async {
          Navigator.of(context, rootNavigator: true).pop();
        },
        verificationFailed: (verificationFailed) async {
          Navigator.of(context, rootNavigator: true).pop();
          print(verificationFailed.message);
        },
        codeSent: (verificationId, resendingToken) async {
          Navigator.of(context, rootNavigator: true).pop();
          setState(() {
            currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
            this.verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) async {},
      );
    }
  }
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    Dialogs.showLoadingDialog(context);
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      Navigator.of(context, rootNavigator: true).pop();

      if (authCredential?.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context, rootNavigator: true).pop();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
  //registerAccount() async {
  //   try {
  //     await fetch(
  //             url: ApiList.signupWithPhone,
  //             body: {
  //               "phoneNumber": numberController.text,
  //               "password": passwordController.text,
  //             },
  //             needReturnErrorCode: true)
  //         .then((val) async {
  //       if (val['success']) {
  //         print(val['data']);
  //         String token = val['data']['token'];
  //         setToken(token);
  //         //Navigator.of(context, rootNavigator: true).pop();

  //         Navigator.of(context).pushAndRemoveUntil(
  //             MaterialPageRoute(builder: (context) => HomeScreen()),
  //             (Route<dynamic> route) => false);
  //       } else {

  //         ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("")));
  //         // Navigator.of(context, rootNavigator: true).pop();
  //       }
  //     });
  //   } catch (e) {}

  // }
  getMobileFormWidget(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
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
              child: Text('register'.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.Colors.yellow200,
                      fontSize: height > 600 ? 25.sp : 30.sp,
                      fontFamily: 'UTMCooperBlack'))),
        ),
        Positioned(
          top: 26.w,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            height: 18.w,
            child: TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              autofocus: false,
              style: TextStyle(
                  fontSize: height > 600 ? 18.sp : 28.sp,
                  color: Theme.Colors.orange500,
                  fontFamily: 'UTMCooperBlack'),
              decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.w, horizontal: 6.w),
                  focusedBorder: styleOutline,
                  enabledBorder: styleUnderline,
                  border: InputBorder.none,
                  hintText: 'phoneNumber'.tr(),
                  hintStyle: TextStyle(
                      fontSize: height > 600 ? 18.sp : 28.sp,
                      color: Theme.Colors.orange500,
                      fontFamily: 'UTMCooperBlack')),
            ),
          ),
        ),
        Positioned(
          top: 51.w,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            height: 18.w,
            child: TextField(
              controller: passwordController,
              obscureText: true,
              autofocus: false,
              style: TextStyle(
                  fontSize: height > 600 ? 18.sp : 28.sp,
                  color: Theme.Colors.orange500,
                  fontFamily: 'UTMCooperBlack'),
              decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.w, horizontal: 6.w),
                  focusedBorder: styleOutline,
                  enabledBorder: styleUnderline,
                  border: InputBorder.none,
                  hintText: 'password'.tr(),
                  hintStyle: TextStyle(
                      fontSize: height > 600 ? 18.sp : 28.sp,
                      color: Theme.Colors.orange500,
                      fontFamily: 'UTMCooperBlack')),
            ),
          ),
        ),
        Positioned(
          bottom: 56.w,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            height: 18.w,
            child: TextField(
              controller: comfirmPasswordController,
              obscureText: true,
              autofocus: false,
              style: TextStyle(
                  fontSize: height > 600 ? 18.sp : 28.sp,
                  color: Theme.Colors.orange500,
                  fontFamily: 'UTMCooperBlack'),
              decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.w, horizontal: 6.w),
                  focusedBorder: styleOutline,
                  enabledBorder: styleUnderline,
                  border: InputBorder.none,
                  hintText: 'confirmPassword'.tr(),
                  hintStyle: TextStyle(
                      fontSize: height > 600 ? 18.sp : 28.sp,
                      color: Theme.Colors.orange500,
                      fontFamily: 'UTMCooperBlack')),
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
                          image: AssetImage('imgRegister'.tr()),
                          fit: BoxFit.contain),
                    )),
                onTap: () async {
                  await _changeWidgetOTP();
                }),
          ),
        )
      ],
    );
  }

  getOtpFormWidget(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
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
              child: Text('register'.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.Colors.yellow200,
                      fontSize: height > 600 ? 25.sp : 30.sp,
                      fontFamily: 'UTMCooperBlack'))),
        ),
        Positioned(
          top: 26.w,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            height: 18.w,
            child: TextField(
              enabled: false,
              controller: numberController,
              keyboardType: TextInputType.number,
              autofocus: false,
              style: TextStyle(
                  fontSize: height > 600 ? 18.sp : 28.sp,
                  color: Theme.Colors.orange500,
                  fontFamily: 'UTMCooperBlack'),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.w, horizontal: 6.w),
                  focusedBorder: styleOutline,
                  enabledBorder: styleUnderline,
                  border: InputBorder.none,
                  hintText: 'OTP',
                  hintStyle: TextStyle(
                      fontSize: height > 600 ? 18.sp : 28.sp,
                      color: Theme.Colors.orange500,
                      fontFamily: 'UTMCooperBlack')),
            ),
          ),
        ),
        Positioned(
          top: 51.w,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            height: 18.w,
            child: TextField(
              controller: otpController,
              obscureText: true,
              autofocus: false,
              style: TextStyle(
                  fontSize: height > 600 ? 18.sp : 28.sp,
                  color: Theme.Colors.orange500,
                  fontFamily: 'UTMCooperBlack'),
              decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.w, horizontal: 6.w),
                  focusedBorder: styleOutline,
                  enabledBorder: styleUnderline,
                  border: InputBorder.none,
                  hintText: '',
                  hintStyle: TextStyle(
                      fontSize: height > 600 ? 18.sp : 28.sp,
                      color: Theme.Colors.orange500,
                      fontFamily: 'UTMCooperBlack')),
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
                        image: AssetImage('imgRegister'.tr()),
                        fit: BoxFit.contain),
                  )),
              onTap: () async {
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: otpController.text);

                signInWithPhoneAuthCredential(phoneAuthCredential);
              },
            ),
          ),
        )
      ],
    );
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
                                    child: currentState ==
                                            MobileVerificationState
                                                .SHOW_MOBILE_FORM_STATE
                                        ? getMobileFormWidget(context)
                                        : getOtpFormWidget(context))
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
