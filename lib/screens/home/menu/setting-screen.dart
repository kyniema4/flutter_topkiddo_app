import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../../components/back.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreen createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  bool isLanguageOn = true;
  bool isLessonOn = true;

  bool phonicTypeOne = true;
  bool phonicTypeTwo = true;

  bool isWordcardOn = true;
  bool isNotificationOn = true;

  final List<double> timeList = [0.1, 0.3, 0.7, 1.0, 2.0, 3.0];

  Future<void> showModalFashcard(context) async {
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
                elevation: 0,
                children: [
                  Container(
                    height: 140.w,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                            // width: 135.w,
                            width: 100.w,
                            child: Image.asset(
                              'assets/images/menu/sub-board.png',
                              fit: BoxFit.fitWidth,
                            )),
                        Positioned(
                            top: 8.w,
                            child: Container(
                                width: 78.w,
                                height: 124.w,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.elliptical(50.w, 7.w),
                                    topRight: Radius.elliptical(50.w, 7.w),
                                    bottomLeft: Radius.circular(8.w),
                                    bottomRight: Radius.circular(8.w),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: SingleChildScrollView(
                                  padding:
                                      EdgeInsets.only(top: 6.w, bottom: 3.w),
                                  child: Column(
                                    children: [
                                      for (var index = 0;
                                          index < timeList.length;
                                          index++)
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            height: 19.w,
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(
                                                top: 1.w, bottom: 2.w),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/menu/times-board.png',
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            child: Text(
                                              '${timeList[index]}' + 's',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  height: 1.2,
                                                  color:
                                                      Theme.Colors.orangeDark,
                                                  fontSize: height > 600
                                                      ? 28.sp
                                                      : 40.sp,
                                                  fontFamily: 'UTMCooperBlack'),
                                            ),
                                          ),
                                        )
                                    ],
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
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double width6_8 = height > 600 ? 8.w : 6.w;
    double height18_20 = height > 600 ? 20.w : 18.w;

    final settingItemTitleStyle = TextStyle(
      fontSize: height > 600 ? 25.sp : 30.sp,
      fontFamily: 'UTMCooperBlack',
      fontWeight: FontWeight.w900,
      color: Theme.Colors.orange900,
    );
    final settingItemSubStyle = TextStyle(
      fontSize: height > 600 ? 19.sp : 25.sp,
      fontWeight: FontWeight.w500,
      color: Theme.Colors.orange900,
    );
    final phonicTypeTextStyle = TextStyle(
      fontSize: height > 600 ? 19.sp : 25.sp,
      fontWeight: FontWeight.w500,
      color: Theme.Colors.orange900,
    );

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
                              height: 153.w,
                              margin: EdgeInsets.only(top: 14.w),
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/directory/board-notitle.png",
                                    fit: BoxFit.contain,
                                    height: double.infinity,
                                  ),
                                  Positioned(
                                      top: 2.w,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Align(
                                          child: Container(
                                              height: 137.w,
                                              width: 265.w,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: settingScrollView,
                                              child: SingleChildScrollView(
                                                padding:
                                                    EdgeInsets.only(top: 12.w),
                                                child: Column(
                                                  children: [
                                                    // language setting
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 9.w),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Image.asset(
                                                                    'assets/images/menu/language.png',
                                                                    height:
                                                                        height18_20,
                                                                    fit: BoxFit
                                                                        .contain),
                                                                SizedBox(
                                                                  width:
                                                                      width6_8,
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(bottom: 2.w),
                                                                        child: Text(
                                                                            'language'
                                                                                .tr(),
                                                                            style:
                                                                                settingItemTitleStyle),
                                                                      ),
                                                                      Text(
                                                                          'changeLanguage'
                                                                              .tr(),
                                                                          style:
                                                                              settingItemSubStyle),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: 8.w),
                                                              ],
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  isLanguageOn =
                                                                      !isLanguageOn;
                                                                });
                                                              },
                                                              child:
                                                                  Image.asset(
                                                                isLanguageOn
                                                                    ? 'assets/images/menu/on-toggle.png'
                                                                    : 'assets/images/menu/off-toggle.png',
                                                                fit: BoxFit
                                                                    .contain,
                                                                height: 12.w,
                                                              ))
                                                        ],
                                                      ),
                                                    ),

                                                    // lesson setting
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 9.w),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Image.asset(
                                                                    'assets/images/menu/lesson.png',
                                                                    height:
                                                                        height18_20,
                                                                    fit: BoxFit
                                                                        .contain),
                                                                SizedBox(
                                                                  width:
                                                                      width6_8,
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(bottom: 2.w),
                                                                        child: Text(
                                                                            'lesson'
                                                                                .tr(),
                                                                            style:
                                                                                settingItemTitleStyle),
                                                                      ),
                                                                      Text(
                                                                          'autoNext'
                                                                              .tr(),
                                                                          style:
                                                                              settingItemSubStyle),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: 8.w),
                                                              ],
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  isLessonOn =
                                                                      !isLessonOn;
                                                                });
                                                              },
                                                              child:
                                                                  Image.asset(
                                                                isLessonOn
                                                                    ? 'assets/images/menu/on-toggle.png'
                                                                    : 'assets/images/menu/off-toggle.png',
                                                                fit: BoxFit
                                                                    .contain,
                                                                height: 12.w,
                                                              ))
                                                        ],
                                                      ),
                                                    ),

                                                    // flashcards setting
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 9.w),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Image.asset(
                                                                    'assets/images/menu/flash-cards.png',
                                                                    height:
                                                                        height18_20,
                                                                    fit: BoxFit
                                                                        .contain),
                                                                SizedBox(
                                                                  width:
                                                                      width6_8,
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(bottom: 2.w),
                                                                        child: Text(
                                                                            'flashcards'
                                                                                .tr(),
                                                                            style:
                                                                                settingItemTitleStyle),
                                                                      ),
                                                                      Text(
                                                                          'autoNext'
                                                                              .tr(),
                                                                          style:
                                                                              settingItemSubStyle),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: 8.w),
                                                              ],
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                              onTap: () {
                                                                showModalFashcard(
                                                                    context);
                                                              },
                                                              child: Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Image.asset(
                                                                    // 'assets/images/menu/dropdown-modal.png',
                                                                    'assets/images/button/add_short.png',
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    height:
                                                                        13.w,
                                                                  ),
                                                                  Positioned(
                                                                    left: 8.w,
                                                                    top: 0.5.w,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          12.w,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child: Text(
                                                                          '3.0',
                                                                          style:
                                                                              TextStyle(
                                                                            height:
                                                                                1.3,
                                                                            fontSize: height > 600
                                                                                ? 21.sp
                                                                                : 28.sp,
                                                                            fontFamily:
                                                                                'UTMCooperBlack',
                                                                            fontWeight:
                                                                                FontWeight.w900,
                                                                            color:
                                                                                Theme.Colors.yellow300,
                                                                          )),
                                                                    ),
                                                                  )
                                                                ],
                                                              ))
                                                        ],
                                                      ),
                                                    ),

                                                    // phonics setting
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 9.w),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Image.asset(
                                                                    'assets/images/menu/phonics.png',
                                                                    height:
                                                                        height18_20,
                                                                    fit: BoxFit
                                                                        .contain),
                                                                SizedBox(
                                                                  width:
                                                                      width6_8,
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(bottom: 2.w),
                                                                        child: Text(
                                                                            'phonics'
                                                                                .tr(),
                                                                            style:
                                                                                settingItemTitleStyle),
                                                                      ),
                                                                      Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Text('teachPhonics'.tr(), style: phonicTypeTextStyle),
                                                                              SizedBox(width: 14.w),
                                                                              GestureDetector(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      phonicTypeOne = !phonicTypeOne;
                                                                                    });
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 15.w,
                                                                                    width: 16.w,
                                                                                    decoration: BoxDecoration(
                                                                                      image: DecorationImage(
                                                                                        image: AssetImage('assets/images/button/untick-toggle.png'),
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                    ),
                                                                                    child: phonicTypeOne ? Image.asset('assets/images/button/tick.png', fit: BoxFit.contain) : null,
                                                                                  )),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text('makeFast'.tr(), style: phonicTypeTextStyle),
                                                                              SizedBox(width: 14.w),
                                                                              GestureDetector(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      phonicTypeTwo = !phonicTypeTwo;
                                                                                    });
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 15.w,
                                                                                    width: 16.w,
                                                                                    decoration: BoxDecoration(
                                                                                      image: DecorationImage(
                                                                                        image: AssetImage('assets/images/button/untick-toggle.png'),
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                    ),
                                                                                    child: phonicTypeTwo ? Image.asset('assets/images/button/tick.png', fit: BoxFit.contain) : null,
                                                                                  )),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    // word cards setting
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 9.w),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Image.asset(
                                                                    'assets/images/menu/word-card.png',
                                                                    height:
                                                                        height18_20,
                                                                    fit: BoxFit
                                                                        .contain),
                                                                SizedBox(
                                                                  width:
                                                                      width6_8,
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(bottom: 2.w),
                                                                        child: Text(
                                                                            'wordCards'
                                                                                .tr(),
                                                                            style:
                                                                                settingItemTitleStyle),
                                                                      ),
                                                                      Text(
                                                                          'arrowUnderline'
                                                                              .tr(),
                                                                          style:
                                                                              settingItemSubStyle),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: 8.w),
                                                              ],
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  isWordcardOn =
                                                                      !isWordcardOn;
                                                                });
                                                              },
                                                              child:
                                                                  Image.asset(
                                                                isWordcardOn
                                                                    ? 'assets/images/menu/on-toggle.png'
                                                                    : 'assets/images/menu/off-toggle.png',
                                                                fit: BoxFit
                                                                    .contain,
                                                                height: 12.w,
                                                              ))
                                                        ],
                                                      ),
                                                    ),

                                                    // notification setting
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 9.w),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Image.asset(
                                                                    'assets/images/menu/notifications.png',
                                                                    height:
                                                                        height18_20,
                                                                    fit: BoxFit
                                                                        .contain),
                                                                SizedBox(
                                                                  width:
                                                                      width6_8,
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(bottom: 2.w),
                                                                        child: Text(
                                                                            'notifications'
                                                                                .tr(),
                                                                            style:
                                                                                settingItemTitleStyle),
                                                                      ),
                                                                      Text(
                                                                          'practiceReminde'
                                                                              .tr(),
                                                                          style:
                                                                              settingItemSubStyle),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: 8.w),
                                                              ],
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  isNotificationOn =
                                                                      !isNotificationOn;
                                                                });
                                                              },
                                                              child:
                                                                  Image.asset(
                                                                isNotificationOn
                                                                    ? 'assets/images/menu/on-toggle.png'
                                                                    : 'assets/images/menu/off-toggle.png',
                                                                fit: BoxFit
                                                                    .contain,
                                                                height: 12.w,
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )))),
                                  Positioned(
                                    top: -5.7.w,
                                    child: Container(
                                        height: 23.w,
                                        width: 95.w,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(bottom: 2.w),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/menu/name-board.png'),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        child: Text('setting'.tr(),
                                            style: TextStyle(
                                                height: 1.2,
                                                color: Theme.Colors.yellow300,
                                                fontSize: height > 600
                                                    ? 28.sp
                                                    : 42.sp,
                                                fontFamily: 'UTMCooperBlack'),
                                            textAlign: TextAlign.center)),
                                  ),
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
              child: Back(buttonImage: 'assets/images/button/back-button.png'),
            ),
          ],
        ));
  }
}
