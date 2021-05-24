import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topkiddo/screens/home/directory-page/directory_screen.dart';
import '../../Utils/http_service.dart';
import '../../theme/style.dart';
import '../../theme/theme.dart' as Theme;

import '../new_game/loginhome_screen.dart';
import './modal_translate.dart';
import 'designed-courses/library_screen.dart';
//import '../../localization/language/languages.dart';

//import '../../localization/language/languages.dart';
import '../../components/languages_app.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _pressed = true;
  bool _pressed2 = true;
  bool _pressed3 = true;
  bool _local = true;
  @override
  void initState() {
    super.initState();
  }

  _showHomeItem(BuildContext context, imageBg, String title, String content,
      int pressId, bool isPress) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: 92.w,
      height: 125.w,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Stack(children: [
        Image.asset(
          imageBg,
          fit: BoxFit.contain,
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 17.w,
                alignment: Alignment.center,
                child: Text(title,
                    style: TextStyle(
                        color: Theme.Colors.yellow200,
                        fontSize: height > 600 ? 25.sp : 29.sp,
                        fontFamily: 'UTMCooperBlack'),
                    textAlign: TextAlign.center))),
        Positioned(
            top: 26.w,
            left: 0,
            right: 0,
            child: Container(
                height: 30.w,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                alignment: Alignment.center,
                child: Text(
                  content,
                  style: TextStyle(
                      color: Theme.Colors.orange500,
                      fontSize: height > 600 ? 20.sp : 28.sp,
                      fontFamily: 'UTMCooperBlack'),
                  textAlign: TextAlign.center,
                ))),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
                opacity: true ? 1.0 : 0.85,
                duration: Duration(milliseconds: 200),
                child: GestureDetector(
                    child: Container(
                        // color: Colors.blue,
                        height: 16.w,
                        child:
                            Image.asset('imgChoose'.tr(), fit: BoxFit.contain)),
                    onTap: () {
                      if (pressId == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LibraryScreen()));
                      } else if (pressId == 2) {
                        print('topic');
                      } else
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DirectoryScreen()));
                    })))
      ]),
    );
  }

  // checkLogin() async {
  //   var token = (await getToken()).toString();
  //   print('token ' + token);
  //   if (token.length > 0) {
  //     try {
  //       var resultProfile = await fetch(url: ApiList.getProfile);
  //       print('result get profile ' + jsonEncode(resultProfile));
  //       return resultProfile;
  //     } catch (err) {
  //       return;
  //     }
  //   } else {
  //     return;
  //   }
  // }

  initFunction() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var getLanguage = await pref.getString('lng_key');
    if (getLanguage == null) {
      pref.setString('lng_key', 'en');
      // this.languageService.setLanguage('en')
      // this.languageKey = 'en'
      // this.imageLanguage = 1
    }

    if (getLanguage == 'vi') {
      // this.languageKey = val
      // this.imageLanguage = 1
      // this.languageService.setLanguage('vi')
    }

    if (getLanguage == 'en') {
      // this.languageKey = val
      // this.imageLanguage = 2
      // this.languageService.setLanguage('en')
    }
    var getUnitLanguage = await pref.getString('unitLanguage');
    // 1 english - english
    // 2 english  - american
    if (getUnitLanguage == null) {
      pref.setInt('unitLanguage', 2);
    }

    if (!pref.getBool('isCheck')) {
      pref.setBool('isCheck', false);
    }

    // this.downloadLanguageLocal()
    // this.checkLogin();
    // this.updateLoginFcmToken();
    // this.downloadLesson()
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: backgroundImage,
              child: null,
            ),
            Container(
                height: height,
                decoration: blackBackground,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TopButton(),
                    Container(
                      height: height - 37.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _showHomeItem(
                              context,
                              'assets/images/topic/designed-courses.png',
                              'lesson'.tr().toUpperCase(),
                              'designedCourses'.tr(),
                              1,
                              _pressed),
                          _showHomeItem(
                              context,
                              'assets/images/topic/flexible.png',
                              'topic'.tr().toUpperCase(),
                              'flexibleLearning'.tr(),
                              2,
                              _pressed2),
                          _showHomeItem(
                              context,
                              'assets/images/topic/expressions.png',
                              'translate'.tr().toUpperCase(),
                              'expressionsPhrases'.tr(),
                              3,
                              _pressed3),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class TopButton extends StatelessWidget {
  _showModalTranslate(context) {
    showDialog(
        context: context,
        useSafeArea: false,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ModalTranslate();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32.w,
        // padding: new EdgeInsets.only(top: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(children: [
                Positioned(
                  top: 13.5.w,
                  left: -40.w,
                  child: Image.asset(
                    'assets/images/button/bar-long.png',
                    height: 12.w,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    top: 10.w,
                    left: 16.w,
                    child: Row(
                      children: [
                        GestureDetector(
                            child: Container(
                                width: 20.w,
                                height: 20.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/button/logout.png',
                                      ),
                                      fit: BoxFit.contain),
                                )),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LoginHomeScreen()));
                            }),
                        SizedBox(
                          width: 8.w,
                        ),
                        GestureDetector(
                            child: Container(
                                width: 20.w,
                                height: 20.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/button/menu-button.png',
                                      ),
                                      fit: BoxFit.contain),
                                )),
                            onTap: () {}),
                      ],
                    )),
              ]),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 3.5.w,
                    right: 16.w,
                    child: Image.asset(
                      'assets/images/button/add_short.png',
                      height: 13.5.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    right: 33.w,
                    child: GestureDetector(
                        child: Container(
                            width: 20.w,
                            height: 20.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "imgFlag".tr(),
                                  ),
                                  fit: BoxFit.contain),
                            )),
                        onTap: () {
                          _showModalTranslate(context);
                        }),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
