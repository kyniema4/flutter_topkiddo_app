import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/back.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/images/profile/avt-1.png',
  'assets/images/profile/avt-2.png',
  'assets/images/profile/avt-3.png',
  'assets/images/profile/avt-4.png',
  'assets/images/profile/avt-5.png',
  'assets/images/profile/avt-6.png',
  'assets/images/profile/avt-7.png',
  'assets/images/profile/avt-8.png'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 50),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class ProfileKidEditScreen extends StatefulWidget {
  @override
  _ProfileKidEditScreen createState() => _ProfileKidEditScreen();
}

class _ProfileKidEditScreen extends State<ProfileKidEditScreen> {
  TextEditingController nameController =
      new TextEditingController(text: 'Sunny 10');
  TextEditingController yearController = new TextEditingController(text: '5');
  final CarouselController _controller = CarouselController();
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                        child: Container(
                            height: 150.w,
                            width: 305.w,
                            // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                              width: 105.w,
                                              height: 110.w,
                                              // child: CarouselSlider(
                                              //   items: imageSliders,
                                              //   options: CarouselOptions(
                                              //       enlargeCenterPage: false,
                                              //       height: 200),
                                              //   carouselController: _controller,
                                              // ),

                                              child: CarouselSlider.builder(
                                                carouselController: _controller,
                                                options: CarouselOptions(
                                                  aspectRatio: 2.0,
                                                  enlargeCenterPage: true,
                                                  viewportFraction: 1,
                                                ),
                                                itemCount:
                                                    (imgList.length).round(),
                                                itemBuilder:
                                                    (context, index, realIdx) {
                                                  return Row(
                                                    children:
                                                        [index].map((idx) {
                                                      return Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Image.asset(
                                                            imgList[idx],
                                                            fit: BoxFit.contain,
                                                            height: 90.w,
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  );
                                                },
                                              )),
                                          Positioned(
                                            top: 45.w,
                                            left: 0,
                                            child: GestureDetector(
                                              onTap: () =>
                                                  _controller.previousPage(),
                                              child: Image.asset(
                                                'assets/images/button/back-arrow.png',
                                                fit: BoxFit.contain,
                                                height: 20.w,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 45.w,
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: () =>
                                                  _controller.nextPage(),
                                              child: Image.asset(
                                                'assets/images/button/next-arrow.png',
                                                fit: BoxFit.contain,
                                                height: 20.w,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Image.asset(
                                            'saveBtn'.tr(),
                                            height: 21.w,
                                            fit: BoxFit.contain,
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                  height: double.infinity,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/profile/editboard.png',
                                          height: double.infinity,
                                          fit: BoxFit.contain),
                                      Positioned(
                                        top: 3.w,
                                        child: Text('editProfile'.tr(),
                                            style: TextStyle(
                                                color: Theme.Colors.yellow300,
                                                fontSize: height > 600
                                                    ? 24.sp
                                                    : 33.sp,
                                                // fontSize: 19,
                                                fontFamily: 'UTMCooperBlack')),
                                      ),
                                      Positioned(
                                        top: 29.w,
                                        width: 171.w,
                                        height: 98.w,
                                        child: Container(
                                          // color: Color(0x55cc2eee),
                                          padding: EdgeInsets.only(
                                              left: 8.w, right: 10.w),
                                          child: Column(
                                            children: [
                                              SizedBox(height: 6.w),

                                              // input name
                                              Flex(
                                                direction: Axis.horizontal,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text('name'.tr(),
                                                        style: TextStyle(
                                                            color: Theme.Colors
                                                                .orange900,
                                                            fontSize:
                                                                height > 600
                                                                    ? 21.sp
                                                                    : 30.sp,
                                                            fontFamily:
                                                                'UTMCooperBlack')),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      height: 20.w,
                                                      child: TextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            nameController,
                                                        autofocus: false,
                                                        style: TextStyle(
                                                            color: Theme.Colors
                                                                .orange900,
                                                            fontSize:
                                                                height > 600
                                                                    ? 24.sp
                                                                    : 33.sp,
                                                            fontFamily:
                                                                'UTMCooperBlack'),
                                                        decoration:
                                                            InputDecoration(
                                                          isCollapsed: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      2.w,
                                                                      0,
                                                                      10.w,
                                                                      1.w),
                                                          border:
                                                              InputBorder.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 19.w),

                                              //check gender
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                              'male'.tr(),
                                                              style: TextStyle(
                                                                  color: Theme
                                                                      .Colors
                                                                      .orange900,
                                                                  fontSize: height >
                                                                          600
                                                                      ? 21.sp
                                                                      : 30.sp,
                                                                  fontFamily:
                                                                      'UTMCooperBlack')),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              isMale = !isMale;
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 16.w,
                                                            height: 16.w,
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                      'assets/images/button/untick-toggle.png',
                                                                    ),
                                                                    fit: BoxFit.contain)),
                                                            child: isMale
                                                                ? Image.asset(
                                                                    'assets/images/button/tick.png',
                                                                    fit: BoxFit
                                                                        .contain)
                                                                : null,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 50.w,
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            child: Text(
                                                                'female'.tr(),
                                                                style: TextStyle(
                                                                    color: Theme
                                                                        .Colors
                                                                        .orange900,
                                                                    fontSize: height >
                                                                            600
                                                                        ? 21.sp
                                                                        : 30.sp,
                                                                    fontFamily:
                                                                        'UTMCooperBlack')),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              isMale = !isMale;
                                                            });
                                                          },
                                                          child: Container(
                                                              width: 16.w,
                                                              height: 16.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      // color: Color(
                                                                      //     0x55cc2eee),
                                                                      image: DecorationImage(
                                                                          image: AssetImage(
                                                                              'assets/images/button/untick-toggle.png'),
                                                                          fit: BoxFit
                                                                              .contain)),
                                                              child: isMale
                                                                  ? null
                                                                  : Image.asset(
                                                                      'assets/images/button/tick.png',
                                                                      fit: BoxFit
                                                                          .contain)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 16.w),

                                              // input year old and account
                                              Row(
                                                children: [
                                                  Flex(
                                                    direction: Axis.horizontal,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: 29.w,
                                                      ),
                                                      SizedBox(
                                                        width: 34.w,
                                                        child: Container(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          height: 20.w,
                                                          // color: Colors.red,
                                                          child: TextFormField(
                                                            readOnly: true,
                                                            controller:
                                                                yearController,
                                                            autofocus: false,
                                                            style: TextStyle(
                                                                color: Theme
                                                                    .Colors
                                                                    .orange900,
                                                                fontSize:
                                                                    height > 600
                                                                        ? 24.sp
                                                                        : 33.sp,
                                                                fontFamily:
                                                                    'UTMCooperBlack'),
                                                            textAlign: TextAlign
                                                                .center,
                                                            decoration:
                                                                InputDecoration(
                                                              isCollapsed: true,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          5.w,
                                                                          0,
                                                                          5.w,
                                                                          1.w),
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5.w),
                              ],
                            )),
                      ),
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
          children: [
            Expanded(
              child: Back(buttonImage: 'assets/images/button/back-button.png'),
            ),
          ],
        ));
  }
}
