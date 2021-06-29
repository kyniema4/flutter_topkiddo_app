import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:topkiddo/Utils/hive_service.dart';
import 'package:topkiddo/Utils/download_data.dart';
import 'package:topkiddo/components/Loading_dialog.dart';
import 'package:topkiddo/components/navigator_screen_dialog.dart';
import 'package:topkiddo/data_local/lesson/lesson_data_model.dart';
import 'package:topkiddo/screens/animation_auto_screen.dart';
import 'package:topkiddo/screens/home/designed-courses/flash_card_screen.dart';
import 'package:topkiddo/screens/home/directory-page/directory_screen.dart';
import '../../Utils/http_service.dart';
import '../../Utils/http_service.dart';
import '../../Utils/http_service.dart';
import '../../theme/style.dart';
import '../../theme/theme.dart' as Theme;

import '../new_game/loginhome_screen.dart';
import './modal_translate.dart';
import './modal_menu.dart';
import 'designed-courses/library_screen.dart';
import 'package:topkiddo/data_local/lesson/unit_data_model.dart';
//import 'topic.dart';
import 'package:path_provider/path_provider.dart';

import 'topic/topic.dart';
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
  String boxUnit = "unit";
  String boxLesson = "lesson";
  String boxContent = "content";
  String boxFlashCard = "flashCard";
  final HiveService hiveService = HiveService();
  final HandleDownload download = HandleDownload();
  DateTime now = DateTime.now();
  @override
  void initState() {
    super.initState();
    getDataLesson();
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    TopicScreen()));
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
    // this.downloadLanguageLocal()
    // this.checkLogin();
    // this.updateLoginFcmToken();
    // this.downloadLesson()
  }

  getDataLesson() async {
    bool checkListContent = await hiveService.isExists(boxName: boxContent);
    print('checkListContent: ' + checkListContent.toString());
    //check đã save content?
    if (checkListContent) {
      //String currentUnit = await getCurrentUnit();
      var isLearning =
          await hiveService.getBoxesWithKey("currentData", boxFlashCard);
      //đã từng học

      // if (currentUnit.isNotEmpty && currentUnit.length > 0) {
      if (isLearning != null && isLearning.length > 0) {
        //lấy lesson Part đang học
        String currentUnit = isLearning['unitId'];
        String currentLessonPart = isLearning['partId'];
        if (currentLessonPart.isNotEmpty && currentLessonPart.length > 0) {
          //bool checkListLesson = await hiveService.isExists(boxName: boxLesson);
          // List listLesson =
          //     await hiveService.getBoxesWithKey(currentUnit, boxLesson);
          List listLesson = await hiveService.getBoxes(boxContent);
          print(listLesson.length);
          print('debugging');
          if (listLesson.length > 0 && listLesson.isNotEmpty) {
            bool check =
                await NavigatorScreenDialog.ShowPopNaviagation(context);
            if (check) {
              var index = listLesson
                  .indexWhere((e) => e['_id'] == isLearning['lessonId']);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => FlashCardScreen(
              //               lessonDetail: listLesson[index],
              //             )));
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => FlashCardScreen(
                            lessonDetail: listLesson[index],
                          )),
                (Route<dynamic> route) => false,
              );
            }
            return;
          }
        } else {
          //chưa học part lesson nào
          var resultListLesson = await fetchListLesson(currentUnit);
          if (resultListLesson['success'] &&
              resultListLesson['data']['docs'].length > 0) {
            print('debugging');
            List listSaveContent = resultListLesson['data']['docs'].length < 10
                ? resultListLesson['data']['docs']
                : resultListLesson['data']['docs'].sublist(0, 10);
            for (var i = 0; i < listSaveContent.length; i++) {
              await downloadListContent(listSaveContent[i]);
            }
            await hiveService.addBoxes(listSaveContent, boxContent);
          }
        }
      } else {
        //học lần đầu
        print('học lần đầu');
        await fetchListUnit();
      }
    } else {
      print('Đã có content');
      // await fetchListUnit();

      // List listUnit = [];
      // data.forEach((e) {
      //   UnitDataModel unit = UnitDataModel.fromJson(e);
      //   fetchListLesson(unit.id);
      //   //getListLesson(unit.id);
      //   listUnit.add(unit);
      // });

      // await hiveService.addBoxes(listUnit, boxUnit);

      //print('debugging');
    }
  }

  fetchListUnit() async {
    var token = (await getToken()).toString();
    //*get unitLanguage
    int unitLanguage = 2;
    List listUnit = [];
    if (token.length > 0) {
      try {
        var resultListUnit = await fetch(
          url: ApiList.getListUnit,
          body: {
            "filter": {"language": unitLanguage ?? 2}
          },
        );
        if (resultListUnit['success'] &&
            resultListUnit['data']['docs'].length > 0) {
          //handle save Unit
          resultListUnit['data']['docs'].forEach((e) {
            UnitDataModel unit = UnitDataModel.fromJson(e);
            listUnit.add(unit);
          });

          await hiveService.addBoxes(listUnit, boxUnit);
          //call save data list lesson to local storage
          var resultListLesson =
              await fetchListLesson(resultListUnit['data']['docs'][0]['_id']);

          if (resultListLesson['success'] &&
              resultListLesson['data']['docs'].length > 0) {
            List listSaveContent = [...resultListLesson['data']['docs']];
            print('debugging');
            for (var i = 0; i < listSaveContent.length; i++) {
              await downloadListContent(listSaveContent[i]);
            }
            setCurrentUnit(resultListUnit['data']['docs'][0]['_id']);
            await hiveService.addBoxes(listSaveContent, boxContent);
          }
        } else {
          print('error when fetch list Unit');
        }
      } catch (e) {
        print('error get list Unit ' + e);
      }
    } else
      return;
  }

  fetchListLesson(String unitId) async {
    try {
      var resultListLesson = await fetch(
          url: ApiList.getListLesson,
          body: {
            "filter": {"unit": unitId}
          },
          needAutoHeader: true);
      //print('debugging');
      List listLesson = [];
      if (resultListLesson['success'] &&
          resultListLesson['data']['docs'].length > 0) {
        resultListLesson['data']['docs'].forEach((e) {
          LessonDataModel lesson = LessonDataModel.fromJson(e);
          listLesson.add(lesson);
        });

        await hiveService.putBoxesWithKey(unitId, listLesson, boxLesson);
        print('save data lesson success');
        return resultListLesson;
      }
    } catch (e) {
      print(e);
      print('error get list lesson ');
    }
  }

  Future downloadListContent(dataLesson) async {
    if (dataLesson['part'].length > 0) {
      List<Future> listDataHandle = [];
      dataLesson['part'].forEach((item) async {
        if (item['audio'] != null) {
          print(item['audio']);
          await listDataHandle
              .add(download.downloadFile(item['audio'], dataLesson['_id']));
          //HandleDownload().checkFileExists();
        }
        if (item['image'] != null) {
          print(item['image']);
          await listDataHandle
              .add(download.downloadFile(item['image'], dataLesson['_id']));
          //HandleDownload().checkFileExists();
        }
        if (item['game'] != null) {
          print(item['game']);
          print('debugging');
        }
        if (item['content']?.length > 0) {
          print(item['content']);
          print('debugging');
        }
        if (item['flashcard']?.length > 0) {
          print(item['content']);
          print('debugging');
        }
      });

      await Future.wait(listDataHandle);
    }
  }

  getGame(String gameId) async {
    try {
      var resultGameIfo = await fetch(
        url: ApiList.getGameInfo,
        body: {"gameId": gameId},
      );
      print(resultGameIfo);
      print('debugging');
      return resultGameIfo;
    } catch (e) {
      print('error get gameInfo ' + e);
    }
  }

  // fetchListLesson(String unitId) async {
  //   try {
  //     var resultListLesson = await fetch(
  //       url: ApiList.getListLesson,
  //       body: {
  //         "filter": {"unit": unitId}
  //       },
  //     );
  //     List listLesson = [];
  //     if (resultListLesson['success'] &&
  //         resultListLesson['data']['docs'].length > 0) {
  //       resultListLesson['data']['docs'].forEach((e) {
  //         LessonDataModel lesson = LessonDataModel.fromJson(e);
  //         listLesson.add(lesson);
  //       });
  //       //await hiveService.addBoxes(listLesson, boxLesson);
  //       await hiveService.putBoxesWithId(unitId, listLesson, boxLesson);
  //       print('save data lesson success');
  //     } else {}
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
              // decoration: backgroundImage,
              child: AnimationAutoScreen(
                kidAction: false,
              ),
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
  String boxUnit = "unit";
  String boxLesson = "lesson";
  String boxContent = "content";
  final HandleDownload download = HandleDownload();
  final HiveService hiveService = HiveService();
  _showModalTranslate(context) {
    showDialog(
        context: context,
        useSafeArea: false,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ModalTranslate();
        });
  }

  _showModalMenu(context) {
    ShowModalMenu.modalBottomSheetMenu(context);
    // showDialog(
    //     context: context,
    //     useSafeArea: false,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       return ShowModalMenu.modalBottomSheetMenu(context);
    //     });
  }

  //test
  clearAllDataApp() async {
    await hiveService.clearBoxes(boxUnit);
    await hiveService.clearBoxes(boxLesson);
    await hiveService.clearBoxes(boxContent);
    await hiveService.clearBoxes("flashCard");

    await download.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32.w,
        padding: new EdgeInsets.only(top: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(children: [
                Positioned(
                  top: 3.5.w,
                  left: -40.w,
                  child: Image.asset(
                    'assets/images/button/bar-long.png',
                    height: 12.w,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    // top: 10.w,
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
                                        'assets/images/button/menu-button.png',
                                      ),
                                      fit: BoxFit.contain),
                                )),
                            onTap: () {
                              _showModalMenu(context);
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
                                        'assets/images/button/logout.png',
                                      ),
                                      fit: BoxFit.contain),
                                )),
                            onTap: () {
                              clearAllDataApp();
                              // _showModalMenu(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (BuildContext context) =>
                              //             LoginHomeScreen()));
                            }),
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
