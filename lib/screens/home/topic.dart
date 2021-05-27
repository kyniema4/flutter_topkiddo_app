import 'package:flutter/material.dart';
import '../../theme/style.dart';
import '../../theme/theme.dart' as Theme;
import '../../components/back.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './modal_translate.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TopicScreen extends StatefulWidget {
  @override
  _TopicScreenState createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 160.w,
                        margin: new EdgeInsets.only(
                          top: 10.w,
                        ),
                        child: CarouselSlider(
                          items: [
                            //1st Image of Slider

                            Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: 145.w,
                                    child: Image.asset(
                                      "wordList".tr(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 11.w,
                                  left: 0,
                                  right: 0,
                                  child: Align(
                                      child: Text(
                                    'wordListTitle'.tr().toUpperCase(),
                                    style: TextStyle(
                                        fontSize: height > 600 ? 24.sp : 35.sp,
                                        fontFamily: 'UTMCooperBlack',
                                        fontWeight: FontWeight.w900,
                                        color: Theme.Colors.yellow300,
                                        letterSpacing: 0.5),
                                  )),
                                ),
                              ],
                            ),

                            //2nd Image of Slider

                            Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: 145.w,
                                    child: Image.asset(
                                      "music".tr(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 11.w,
                                  left: 0,
                                  right: 0,
                                  child: Align(
                                      child: Text(
                                    'musicTitle'.tr().toUpperCase(),
                                    style: TextStyle(
                                        fontSize: height > 600 ? 24.sp : 35.sp,
                                        fontFamily: 'UTMCooperBlack',
                                        fontWeight: FontWeight.w900,
                                        color: Theme.Colors.yellow300,
                                        letterSpacing: 0.5),
                                  )),
                                ),
                              ],
                            ),

                            //3rd Image of Slider
                            Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: 145.w,
                                    child: Image.asset(
                                      "makePair".tr(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 11.w,
                                  left: 0,
                                  right: 0,
                                  child: Align(
                                      child: Text(
                                    'readAlongTitle'.tr().toUpperCase(),
                                    style: TextStyle(
                                        fontSize: height > 600 ? 24.sp : 35.sp,
                                        fontFamily: 'UTMCooperBlack',
                                        fontWeight: FontWeight.w900,
                                        color: Theme.Colors.yellow300,
                                        letterSpacing: 0.5),
                                  )),
                                ),
                              ],
                            ),

                            // //4rd Image of Slider
                            Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: 145.w,
                                    child: Image.asset(
                                      "bedTime".tr(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 11.w,
                                  left: 0,
                                  right: 0,
                                  child: Align(
                                      child: Text(
                                    'bedTimeTitle'.tr().toUpperCase(),
                                    style: TextStyle(
                                        fontSize: height > 600 ? 24.sp : 35.sp,
                                        fontFamily: 'UTMCooperBlack',
                                        fontWeight: FontWeight.w900,
                                        color: Theme.Colors.yellow300,
                                        letterSpacing: 0.5),
                                  )),
                                ),
                              ],
                            ),

                            // //5rd Image of Slider

                            Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: 145.w,
                                    child: Image.asset(
                                      "multiTopic".tr(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 11.w,
                                  left: 0,
                                  right: 0,
                                  child: Align(
                                      child: Text(
                                    'miniGame'.tr().toUpperCase(),
                                    style: TextStyle(
                                        fontSize: height > 600 ? 24.sp : 35.sp,
                                        fontFamily: 'UTMCooperBlack',
                                        fontWeight: FontWeight.w900,
                                        color: Theme.Colors.yellow300,
                                        letterSpacing: 0.5),
                                  )),
                                ),
                              ],
                            ),
                          ],

                          //Slider Container properties
                          options: CarouselOptions(
                            height: 200.w,
                            enlargeCenterPage: true,
                            // autoPlay: true,
                            aspectRatio: 0,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            viewportFraction: 0.3,
                            enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          ),
                        ),
                      ),
                    ),
                    TopButton(),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Back(buttonImage: 'assets/images/button/back-button.png'),
            ),
            Expanded(
                child: Container(
              padding: new EdgeInsets.only(top: 9.w),
              height: MediaQuery.of(context).size.height,
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
            ))
          ],
        ));
  }
}
