import 'package:flutter/material.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../../components/back.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class SubcribeScreen extends StatefulWidget {
  @override
  _SubcribeScreenState createState() => _SubcribeScreenState();
}

class _SubcribeScreenState extends State<SubcribeScreen> {
  bool _pressed = true;
  bool _pressed2 = true;
  bool _pressed3 = true;
  bool _local = true;
  @override
  void initState() {
    super.initState();
  }

  _showHomeItem(BuildContext context, imageBg, String title, String content,
      int pressId, bool isPress, String price) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: 92.w,
      height: 125.w,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Stack(children: [
        Image.asset(
          imageBg,
          fit: BoxFit.contain,
          width: double.infinity,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'studyElectives'.tr(),
                      style: TextStyle(
                          height: 1.3,
                          color: Theme.Colors.orange500,
                          fontSize: height > 600 ? 15.sp : 20.sp,
                          fontFamily: 'UTMCooperBlack'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 1.w),
                    Text(
                      'gotAGift'.tr(),
                      style: TextStyle(
                          height: 1.3,
                          color: Theme.Colors.orange500,
                          fontSize: height > 600 ? 15.sp : 20.sp,
                          fontFamily: 'UTMCooperBlack'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 1.w),
                    Text(
                      'unlimitedTime'.tr(),
                      style: TextStyle(
                          height: 1.3,
                          color: Theme.Colors.orange500,
                          fontSize: height > 600 ? 15.sp : 20.sp,
                          fontFamily: 'UTMCooperBlack'),
                      textAlign: TextAlign.center,
                    )
                  ],
                ))),
        Positioned(
            bottom: -1,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
                opacity: true ? 1.0 : 0.85,
                duration: Duration(milliseconds: 200),
                child: GestureDetector(
                    child: Container(
                        // color: Colors.blue,
                        height: 16.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/lesson/empty-button.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Text(
                          price + ' VND',
                          style: TextStyle(
                              height: 1,
                              color: Theme.Colors.orange900,
                              fontSize: height > 600 ? 27.sp : 35.sp,
                              fontFamily: 'UTMCooperBlack'),
                        )),
                    onTap: () {})))
      ]),
    );
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
              decoration: backgroundImageSecond,
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
                              'assets/images/lesson/6thang.png',
                              '6' + ' ' + 'months'.tr().toUpperCase(),
                              'designedCourses'.tr(),
                              1,
                              _pressed,
                              '199.000'),
                          _showHomeItem(
                              context,
                              'assets/images/lesson/12thang.png',
                              '12' + ' ' + 'months'.tr().toUpperCase(),
                              'flexibleLearning'.tr(),
                              2,
                              _pressed2,
                              '299.000'),
                          _showHomeItem(
                              context,
                              'assets/images/lesson/trondoi.png',
                              'lifelong'.tr().toUpperCase(),
                              'expressionsPhrases'.tr(),
                              3,
                              _pressed3,
                              '599.000'),
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
              child: Back(buttonImage: 'assets/images/button/back-button.png'),
            ),
          ],
        ));
  }
}
