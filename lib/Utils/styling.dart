import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:topkiddo/Utils/size_config.dart';

class Data {
  Data._();
  static getTheme(BuildContext context) {
    return Theme.of(context);
  }
}

class AppTheme {
  AppTheme._();

  static const Color appBackgroundColor = Color(0xffF2F2F2);
  static const Color appBackgroundColor2 = Color(0xff6629F4);
  static const Color topBarBackgroundColor = Color(0xFFFFD974);
  static const Color selectedTabBackgroundColor = Color(0xFFFFC442);
  static const Color unSelectedTabBackgroundColor = Color(0xFFFFFFFC);
  static const Color subTitleTextColor = Color(0xFF9F988F);
  //static const Color appColor = Color(0xff205b3e);
  static const Color appBarColor = Color(0xffF7F7F7);
  static const Color clippathColor = Color(0xffFAFAFA);
  static const Color greyBg = Color(0xffE4E4E4);
  static const Color selectIndex = Color(0xffE4FEE3);
  static const Color appBarCoin = Color(0xffE28424);
  static const Color deviderColor = Color(0xffF2F2F2);
  static const Color floatingColor = Color(0xffED8A19);
  static const Color disableBtn = Color(0xffFBE8D1);
  static const Color notifyColor = Color(0xffC74C4D);
  static const Color txtColor = Color(0xff4C4C4C);
  static const Color txtColor2 = Color(0xff3F3F3F);
  static const Color txtColor3 = Color(0xff8E8E8E);
  static const Color hintColor = Color(0xffBEBEBE);
  static const Color txtappBar = Color(0xff007AFF);
  static const Color blurColor = Color(0xffd4d1d1);
  static const Color txthint = Color(0xff25A2F0);
  static const Color fcolor = Color(0xff1877F1);
  static const Color tcolor = Color(0xff1CA1F1);
  static const Color fback = Color(0xffF2F2F2);
  static const Color appColor2 = Color(0xffF1A20D);
  static const Color appColor3 = Color(0xffD7E5D4);
  static const Color appColor4 = Color(0xff5F7A6D);
  static const Color appColor5 = Color(0xffECECEC);
  static const Color appColor6 = Color(0xffFFD700);
  static const Color appColor7 = Color(0xffE3F1EA);
  static const Color appColor8 = Color(0xff6D9773);
  static const Color appColor9 = Color(0xff3AA574);
  static const Color appColor10 = Color(0xffF33737);
  static const Color appColor11 = Color(0xffF1F3F5);
  static const Color appColor12 = Color(0xffF6AE3F);
  static const Color appColor13 = Color(0xff8C8C8C);
  static const Color appColor14 = Color(0xff1a1a1a);
  static const Color appColor15 = Color(0xffdf4e26);
  static const Color appColor16 = Color(0xffbedc94);
  static const Color black20 = Color(0xff979797);
  static const Color black15 = Color(0xFFB7b7b7);
  static const Color black10 = Color(0xffD8D8D8);
  static const Color white50 = Color(0xfff5f5f5);
  static const Color white20 = Color(0xfffefefe);
  static const Color orange100 = Color(0xffE5DBCF);
  static const Color white100 = Color(0xffE7E7E7);
  static const Color green4CD = Color(0xff4CD964);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppTheme.appBackgroundColor,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    textTheme: darkTextTheme,
  );

  static final TextTheme lightTextTheme = TextTheme(
    title: _titleLight,
    subtitle: _subTitleLight,
    button: _buttonLight,
    display1: _greetingLight,
    display2: _searchLight,
    body1: _selectedTabLight,
    body2: _unSelectedTabLight,
  );

  static final TextTheme darkTextTheme = TextTheme(
    title: _titleDark,
    subtitle: _subTitleDark,
    button: _buttonDark,
    display1: _greetingDark,
    display2: _searchDark,
    body1: _selectedTabDark,
    body2: _unSelectedTabDark,
  );

  static final TextStyle _titleLight = TextStyle(
    color: Colors.black,
    fontSize: 3.5 * SizeConfig.textMultiplier,
  );

  static final TextStyle _subTitleLight = TextStyle(
    color: subTitleTextColor,
    fontSize: 2 * SizeConfig.textMultiplier,
    height: 1.5,
  );

  static final TextStyle _buttonLight = TextStyle(
    color: Colors.black,
    fontSize: 2.5 * SizeConfig.textMultiplier,
  );

  static final TextStyle _greetingLight = TextStyle(
    color: Colors.black,
    fontSize: 2.0 * SizeConfig.textMultiplier,
  );

  static final TextStyle _searchLight = TextStyle(
    color: Colors.black,
    fontSize: 2.3 * SizeConfig.textMultiplier,
  );

  static final TextStyle _selectedTabLight = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 2 * SizeConfig.textMultiplier,
  );

  static final TextStyle _unSelectedTabLight = TextStyle(
    color: Colors.grey,
    fontSize: 2 * SizeConfig.textMultiplier,
  );

  static final TextStyle _titleDark = _titleLight.copyWith(color: Colors.white);

  static final TextStyle _subTitleDark =
      _subTitleLight.copyWith(color: Colors.white70);

  static final TextStyle _buttonDark =
      _buttonLight.copyWith(color: Colors.black);

  static final TextStyle _greetingDark =
      _greetingLight.copyWith(color: Colors.black);

  static final TextStyle _searchDark =
      _searchDark.copyWith(color: Colors.black);

  static final TextStyle _selectedTabDark =
      _selectedTabDark.copyWith(color: Colors.white);

  static final TextStyle _unSelectedTabDark =
      _selectedTabDark.copyWith(color: Colors.white70);
}

final txtItalic_9 = TextStyle(
  color: AppTheme.txtColor,
  fontSize: 9,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.italic,
  fontFamily: "Helvetica Neue",
);
final txtItalic_13 = TextStyle(
  fontSize: 13,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.italic,
  color: AppTheme.txtColor,
  // height: 1.5,
  letterSpacing: 0.45,
);
final txtItalicBold_13 = TextStyle(
  fontSize: 13,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.italic,
  color: AppTheme.floatingColor,
  letterSpacing: 0.45,
);
final txtTapToLogin = TextStyle(
  fontSize: 13,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w400,
  color: AppTheme.txtColor,
);
final txtWhileCheckLogin = TextStyle(
  fontSize: 13,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.italic,
  color: AppTheme.txtColor,
);
final txtBold_20 = TextStyle(
  fontSize: 20,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w700,
  color: AppTheme.floatingColor,
);
final txtRegular_14 = TextStyle(
  fontSize: 14,
  fontFamily: 'Lato',
  color: AppTheme.txtColor,
);
final txtRegularLight_18 = TextStyle(
  fontSize: 18,
  fontFamily: 'Lato',
  color: AppTheme.floatingColor,
);
final errorInputStyle = TextStyle(
  fontSize: 12,
  fontFamily: 'Lato',
  height: 0.8,
);
final chooseDayTextStyle = TextStyle(
    fontSize: 12, fontFamily: 'Lato', color: AppTheme.txtColor, height: 1.2);
final remindMeStyle = TextStyle(
  fontSize: 12,
  fontFamily: 'Lato',
  color: AppTheme.floatingColor,
  // height: 1.5
);
final dateStyle = TextStyle(
  fontSize: 12.sp,
  fontFamily: 'Lato',
  color: AppTheme.txtColor,
  fontWeight: FontWeight.w400,
  // height: 1.5
);
final dateLight = TextStyle(
  fontSize: 12.sp,
  fontFamily: 'Lato',
  color: AppTheme.floatingColor,
  fontWeight: FontWeight.w400,
  // height: 1.5
);
final summaryStyle = TextStyle(
    color: AppTheme.txtColor,
    fontSize: 24,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w300);
final chapterStyle = TextStyle(
    color: AppTheme.txtColor,
    fontSize: 24,
    fontFamily: 'Lato',
    letterSpacing: 0.55,
    fontWeight: FontWeight.w300);
final textMenuStyle = TextStyle(
  color: AppTheme.txtColor,
  fontSize: 15,
  fontFamily: 'Lato',
);
final textMenuDeleteStyle = TextStyle(
  color: AppTheme.notifyColor,
  fontSize: 15,
  fontFamily: 'Lato',
);
final messageTheirStyle = TextStyle(
  color: Colors.black,
  fontSize: 15.0,
);
final messageYourStyle = TextStyle(
  color: Colors.white,
  fontSize: 15.0,
);
final focusedBorderContact = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  borderSide: BorderSide(color: Colors.blue),
);
final anableBorderContact = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  borderSide: BorderSide(color: Colors.white),
);
final settingTitleStyle = TextStyle(
  color: AppTheme.floatingColor,
  fontSize: 12,
  fontFamily: 'Lato',
);
final settingTextStyle = TextStyle(
    color: AppTheme.txtColor,
    fontSize: 16,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w300);
final settingBtnStyle = TextStyle(
  color: AppTheme.txtColor,
  fontSize: 13,
  fontFamily: 'Lato',
);
final selectValueStyle = TextStyle(
  color: AppTheme.txtColor2,
  fontSize: 16,
  fontFamily: 'Lato',
);
final allText = TextStyle(
  color: AppTheme.floatingColor,
  fontSize: 16,
  fontFamily: 'Lato',
);
final entriesSubStyle = TextStyle(
  color: AppTheme.txtColor,
  fontSize: 15,
  fontFamily: 'Lato',
  fontStyle: FontStyle.italic,
);
final textChapterLight = TextStyle(
  fontSize: 16,
  fontFamily: 'Lato',
  color: AppTheme.floatingColor,
);
final textChapter = TextStyle(
  fontSize: 16,
  fontFamily: 'Lato',
  color: AppTheme.txtColor,
);
// final autherText = GoogleFonts.lato(
//   color: Colors.white,
//   fontSize: 11,
//   fontWeight: FontWeight.bold,
//   letterSpacing: -0.504167,
// );
// final titleText = GoogleFonts.lato(
//   color: Colors.white,
//   fontSize: 18,
//   fontWeight: FontWeight.w900,
//   letterSpacing: 0.553846,
// );
