import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:topkiddo/Utils/hive_service.dart';
import 'package:topkiddo/components/Loading_dialog.dart';

import '../../../Utils/http_service.dart';
import '../../../components/back.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
// import './../../../localization/language/languages.dart';

import 'package:topkiddo/components/languages_app.dart';
import '../../../components/languages_app.dart';
import 'design_course_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  var listUnitEasy = [];
  var listUnitMedium = [];
  var listUnitAdvanced = [];
  final HiveService hiveService = HiveService();
  String boxUnit = "unit";
  String boxLesson = "lesson";
  String boxTopic = "topic";

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  _showLeveltem(BuildContext context, String title, List data, lessonDone) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: 89.w,
      height: 129.w,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      child: Stack(children: [
        Image.asset(
          'assets/images/unit/course-board.png',
          height: 129.w,
          fit: BoxFit.contain,
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 16.w,
                alignment: Alignment.center,
                child: Text(title,
                    style: TextStyle(
                        color: Theme.Colors.yellow200,
                        fontSize: height > 600 ? 25.sp : 29.sp,
                        fontFamily: 'UTMCooperBlack'),
                    textAlign: TextAlign.center))),
        Positioned(
          top: 16.w,
          left: 8.w,
          right: 8.w,
          bottom: 6.w,
          child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(8.w)),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 4.w),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(children: [
                          GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(vertical: 2.w),
                                padding: EdgeInsets.only(
                                  left: 6.w,
                                  right: 6.w,
                                  bottom: 1.5.w,
                                ),
                                height: 16.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                    lessonDone
                                        ? 'assets/images/unit/course1.png'
                                        : 'assets/images/unit/course2.png',
                                  ),
                                  fit: BoxFit.contain,
                                )),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    lessonDone
                                        ? Container(
                                            width: 7.w,
                                            height: 7.w,
                                            margin: EdgeInsets.only(right: 9.w),
                                            child: Image.asset(
                                                'assets/images/unit/coursetick.png',
                                                fit: BoxFit.contain))
                                        : Container(
                                            width: 16.w,
                                          ),
                                    Text(
                                      data[index].name,
                                      style: TextStyle(
                                          color: lessonDone
                                              ? Theme.Colors.yellow200
                                              : Theme.Colors.green700,
                                          fontSize:
                                              height > 600 ? 20.sp : 30.sp,
                                          fontFamily: 'UTMCooperBlack'),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                getListLesson(data[index].id);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             DesignCourseScreen()));
                              })
                        ]),
                      );
                    }),
              )),
        ),
      ]),
    );
  }

  getListUnit() async {
    var data = await hiveService.getBoxes(boxUnit);

    List listDataEasy = [];
    List listDataMedium = [];
    List listDataAdvanced = [];
    if (data.length != 0) {
      for (var i = 0; i < data.length; i++) {
        var unit = UnitModel.fromJson(data[i].toMap());
        if (unit.level == 1) {
          listDataEasy.add(unit);
        } else if (unit.level == 2) {
          listDataMedium.add(unit);
        } else {
          listDataAdvanced.add(unit);
        }
      }
      setState(() {
        listUnitEasy = listDataEasy;
        listUnitMedium = listDataMedium;
        listDataAdvanced = listDataAdvanced;
      });
    } else {
      print('please connect to the network');
    }
  }

  getListLesson(String id) async {
    //Dialogs.showLoadingDialog(context);
    var dataLesson = await hiveService.getBoxesWithId(id, boxLesson);

    if (dataLesson != null) {
      fetchTopicData('5f624e435a9e4942249c324b');
      //await fetchListTopic(dataLesson);
      // Navigator.of(context, rootNavigator: true).pop();
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) => DesignCourseScreen(
      //               lesson: dataLesson,
      //             )));
    } else {
      //Navigator.of(context, rootNavigator: true).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please try again")));
    }
  }

  // Future<List> fetchListTopic(List dataLesson) async {
  //   //5f624e435a9e4942249c324b
  //   var futures = <Future>[];
  //   print(dataLesson);
  //   for (var i = 0; i < dataLesson.length; i++) {
  //     futures.add();
  //   }
  //   // dataLesson.forEach((e) async {
    
  //   var fetchListTopic = await fetch(
  //       url: ApiList.getLessonDetail,
  //       body: {"lessionId": "5f624e435a9e4942249c324b"});
  //   print(fetchListTopic);
  //   print('debugging');

  //   // });

  //   // var fetchListTopic = await fetch(
  //   //     url: ApiList.getLessonDetail, body: {"lessionId": lessonId});
  //   //  print(fetchListTopic);
  //   //   print('debugging');
  // }

  fetchTopicData(String id) async {
    try {
     
      var resultTopic = await fetch(
        url: ApiList.getLessonDetail,
        body: {
          "filter": {"unit": id}
        },
      );
       print('debugging');
      if (resultTopic['success']) {

       return resultTopic['data']['docs'];
      } else {
        return;
      }
    } catch (e) {
      print('occurred error in $id detail: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getListUnit();
  }

  @override
  Widget build(BuildContext context) {
    print('run here');
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
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          _showLeveltem(
                            context,
                            'easy'.tr(),
                            listUnitEasy,
                            false,
                          ),
                          _showLeveltem(
                              context, "medium".tr(), listUnitMedium, false),
                          _showLeveltem(context, "advanced".tr(),
                              listUnitAdvanced, false),
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
    double height = MediaQuery.of(context).size.height;
    return Container(
        height: 32.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Back(buttonImage: 'assets/images/button/close-button.png'),
            ),
            Container(
                width: 180.w,
                height: 27.w,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Theme.Colors.green200,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(9.w)),
                ),
                child: Container(
                    width: 176.w,
                    height: 25.w,
                    decoration: BoxDecoration(
                      color: Theme.Colors.green400,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(7.w)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15.w),
                          child: Text(
                            'youLearning'.tr(),
                            style: TextStyle(
                                fontSize: height > 600 ? 22.sp : 33.sp,
                                fontFamily: 'UTMCooperBlack',
                                fontWeight: FontWeight.w900,
                                color: Theme.Colors.orange100),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.centerLeft,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 12.w,
                              child: Image.asset(
                                'assets/images/unit/bar-plus.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                                left: -10.w,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 19.w,
                                      height: 19.w,
                                      child: Image.asset(
                                          'assets/images/unit/language-flag.png',
                                          fit: BoxFit.contain),
                                    ),
                                    Container(
                                      width: 60.w,
                                      // color: Colors.red,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.w),
                                      child: Text(
                                        'Việt - miền Nam',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            // fontSize: 14,
                                            fontSize:
                                                height > 600 ? 17.sp : 24.sp,
                                            fontFamily: 'UTMCooperBlack',
                                            fontWeight: FontWeight.w900,
                                            color: Theme.Colors.orange100),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ))),
            Expanded(child: LanguagesApp()),
          ],
        ));
  }
}

class UnitModel {
  String id;
  String name;
  int level;
  int language;
  String description;
  String image;
  UnitModel({
    this.id,
    this.name,
    this.level,
    this.language,
    this.description,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'level': level,
      'language': language,
      'description': description,
      'image': image,
    };
  }

  factory UnitModel.fromJson(Map<String, dynamic> parsedJson) {
    return UnitModel(
      id: parsedJson['_id'] ?? parsedJson['id'] ?? "",
      name: parsedJson['name'] ?? "",
      level: parsedJson['level'] ?? 1,
      language: parsedJson['language'] ?? 2,
      description: parsedJson['description'] ?? "",
      image: parsedJson['image'] ?? null,
    );
  }
}
