import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'package:topkiddo/Utils/http_service.dart';
import 'package:topkiddo/screens/home/directory-page/detail_sentences_screen.dart';
import 'package:topkiddo/screens/home/directory-page/directory_favorite.dart';
import 'package:topkiddo/theme/style.dart';
import 'package:topkiddo/theme/theme.dart' as Theme;
import 'package:topkiddo/data_local/favorite_sentence_model.dart';
import '../../../Utils/database_helpers.dart';
import '../../../components/back.dart';
import '../modal_language.dart';

class DirectoryScreen extends StatefulWidget {
  DirectoryScreen({Key key}) : super(key: key);

  @override
  _DirectoryScreenState createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {
  TextEditingController searchController = TextEditingController();
  List listSentences = [];
  String keyFrom = 'vi';
  String keyTo = 'en';
  String query = "";
  String dataBoxName = "lesson";
  AudioPlayer audioPlayer = AudioPlayer();
  Timer debouncer = null;
  final dbHelper = DatabaseHelper.instance;
  Box box;

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer.cancel();
    }
    debouncer = Timer(duration, callback);
  }

  checkKeyLanguage(String key) {
    Map mapLanguage = {
      'vi': ["vietnameseN", "vietnameseS"],
      'es': ["spanish"],
      'ja': ["spanish"],
      'zh-CN': ["chinese"],
      'fr': ["french"],
      'en': ["english", "american"],
    };
    return (mapLanguage['$key']);
  }

  Future searchSentence(String query) async => debounce(() async {
        try {
          var resultSearch = await fetch(
              url: ApiList.searchDirectory,
              body: {'text': query, 'from': keyFrom, 'to': keyTo});
          List tempList = [];
          if (resultSearch['success']) {
            for (int i = 0; i < resultSearch['data'].length; i++) {
              var item = resultSearch['data'][i]['doc'];
              if (item["translatedContent"].length > 0) {
                checkKeyLanguage(keyTo).forEach((e) {
                  item['$e'] = item["translatedContent"][0];
                });
              } else {
                checkKeyLanguage(keyTo).forEach((e) {
                  item['$e'] = jsonDecode(resultSearch['data'][i]['doc']
                      ['resultFromServer'][0])[0][0][0];
                });
              }
              checkKeyLanguage(keyFrom).forEach((e) {
                item['$e'] = item['text'];
              });
              var val = TranslateModel.fromJson(item);
              tempList.add(val);
            }
            if (!mounted) return;
            setState(() {
              this.query = query;
              this.listSentences = tempList;
            });
            print(listSentences);
            print('debugging');
          }
        } catch (e) {
          print(e);
        }
      });

  getListTopTrans() async {
    searchController.clear();
    try {
      var resultGet = await fetch(
          url: ApiList.getListTopTrans, body: {'from': keyFrom, 'to': keyTo});
      List tempList = [];
      if (resultGet['success']) {
        for (int i = 0; i < resultGet['data'].length; i++) {
          var item = resultGet['data'][i];
          print('debugging');
          if (item["translatedContent"].length > 0) {
            checkKeyLanguage(keyTo).forEach((e) {
              item['$e'] = item["translatedContent"][0];
            });
          } else {
            checkKeyLanguage(keyTo).forEach((e) {
              item['$e'] = jsonDecode(
                  resultGet['data'][i]['doc']['resultFromServer'][0])[0][0][0];
            });
          }
          checkKeyLanguage(keyFrom).forEach((e) {
            item['$e'] = item['text'];
          });
          var val = TranslateModel.fromJson(item);
          tempList.add(val);
        }
        if (!mounted) return;
        setState(() {
          this.query = query;
          this.listSentences = tempList;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  insertSetenceToFavorite(data) async {
    Map row = data.toJson();
    bool check = await dbHelper.checkIdExists(row['id']);

    if (!check) {
      await dbHelper.insert(row);
    }
    return;
  }

  playSound(String idAudio) async {
    try {
      String sourceUrl = BaseUrl +
          "resources/get_resource_from_local" +
          '?token=${(await getToken())}&resourceId=${idAudio}&time=${DateTime.now().toString()}';

      audioPlayer.setVolume(0.2);
      var result = await audioPlayer.play(sourceUrl);
      if (result != 1) {
        return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            // title: new Text('Are you sure?'),
            content: Text('alertDirectorySound'.tr()),
            actions: <Widget>[
              // TextButton(
              //   onPressed: () => Navigator.of(context).pop(false),
              //   child: const Text('Cancel'),
              // ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('OK'),
              ),
            ],
          ),
        ));
      }
    } catch (e) {
      print(e);
    }
  }
  // insertSetenceToFavorite(data) async {
  //   final value = FavoriteSentenceModel(
  //       data.id,
  //       data.idAudioResource,
  //       data.idTranslatedAudioResource,
  //       data.keyFrom,
  //       data.keyTo,
  //       data.vietnameseNorth,
  //       data.vietnameseSouth,
  //       data.spanish,
  //       data.japanese,
  //       data.chinese,
  //       data.french,
  //       data.english,
  //       data.american);
  //   box.add(value);
  //   print('add data success');
  // }

  // initBox() async {
  //   await Hive.openBox(dataBoxName);
  //   box = Hive.box(dataBoxName);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initBox();
    getListTopTrans();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double viewInsets = MediaQuery.of(context).viewInsets.bottom;
    print(viewInsets);
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            TopButton(),
                            Container(
                              height: height - 40.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(
                                    width: 280.w,
                                    height: 136.w,
                                    padding: EdgeInsets.only(top: 18.w),
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/directory/board-notitle.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    child: Container(
                                      height: 111.5.w,
                                      width: 243.w,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(7.w),
                                        bottomRight: Radius.circular(7.w),
                                      )),
                                      child: Column(children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/directory/search-bar.png'),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            height: 28.w,
                                            child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 14.w),
                                                      child: Image.asset(
                                                        'assets/images/directory/search.png',
                                                        fit: BoxFit.contain,
                                                        width: 10.w,
                                                      )),
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller:
                                                          searchController,
                                                      onChanged: searchSentence,
                                                      autofocus: false,
                                                      style: TextStyle(
                                                          fontSize: height > 600
                                                              ? 25.sp
                                                              : 30.sp,
                                                          color: Theme
                                                              .Colors.orange500,
                                                          fontFamily:
                                                              'UTMCooperBlack'),
                                                      decoration: InputDecoration(
                                                          isCollapsed: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      vertical: 2
                                                                          .w,
                                                                      horizontal:
                                                                          6.w),
                                                          focusedBorder:
                                                              styleOutline,
                                                          enabledBorder:
                                                              styleUnderline,
                                                          border: InputBorder
                                                              .none,
                                                          hintText: 'searchFor'
                                                              .tr(),
                                                          hintStyle: TextStyle(
                                                              fontSize:
                                                                  height > 600
                                                                      ? 25.sp
                                                                      : 30.sp,
                                                              color: Theme
                                                                  .Colors
                                                                  .orange500,
                                                              fontFamily:
                                                                  'UTMCooperBlack')),
                                                    ),
                                                  ),
                                                  query.length > 0 &&
                                                          viewInsets > 0
                                                      ? Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 14.w),
                                                          child:
                                                              GestureDetector(
                                                            child: Image.asset(
                                                              'assets/images/directory/del.png',
                                                              fit: BoxFit
                                                                  .contain,
                                                              width: 8.w,
                                                            ),
                                                            onTap: () {
                                                              setState(() {
                                                                query = "";
                                                              });

                                                              getListTopTrans();
                                                            },
                                                          ),
                                                        )
                                                      : Container(),
                                                ])),
                                        Expanded(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              padding:
                                                  EdgeInsets.only(top: 3.w),
                                              itemCount: listSentences.length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .topCenter,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border(
                                                                    bottom: listSentences.length -
                                                                                1 ==
                                                                            index
                                                                        ? BorderSide
                                                                            .none
                                                                        : BorderSide(
                                                                            color:
                                                                                Colors.grey[300])),
                                                              ),
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                top: 5.w,
                                                                bottom: 5.w,
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listSentences[index]
                                                                              .vietnameseNorth,
                                                                          style: TextStyle(
                                                                              color: Theme.Colors.orange500,
                                                                              fontSize: height > 600 ? 25.sp : 30.sp,
                                                                              fontFamily: 'UTMCooperBlack'),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            GestureDetector(
                                                                                child: Image.asset(
                                                                                  'assets/images/directory/add.png',
                                                                                  fit: BoxFit.contain,
                                                                                  width: 9.w,
                                                                                ),
                                                                                onTap: () async {
                                                                                  await insertSetenceToFavorite(listSentences[index]);
                                                                                }),
                                                                            SizedBox(width: 8.w),
                                                                            GestureDetector(
                                                                              child: Image.asset(
                                                                                'assets/images/directory/volume.png',
                                                                                fit: BoxFit.contain,
                                                                                width: 10.w,
                                                                              ),
                                                                              onTap: () async {
                                                                                await playSound(listSentences[index].idTranslatedAudioResource);
                                                                                // final allRows = await dbHelper.queryAllRows();
                                                                                // print('query all rows:');
                                                                                // allRows.forEach(print);

                                                                                // await dbHelper.deleteAll();
                                                                                // print('success');
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.only(
                                                                            right:
                                                                                5.w,
                                                                            top: 1.w),
                                                                        child:
                                                                            GestureDetector(
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/directory/trans.png',
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            width:
                                                                                7.w,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listSentences[index]
                                                                              .english,
                                                                          style: TextStyle(
                                                                              color: Theme.Colors.green200,
                                                                              fontSize: height > 600 ? 17.sp : 22.sp,
                                                                              fontFamily: 'UTMCooperBlack'),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              )),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        ShowDetailSentence(
                                                                          sentences:
                                                                              listSentences[index],
                                                                        )));
                                                          })
                                                    ],
                                                  ),
                                                );
                                              }),
                                        )
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ))),
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
          return ModalLanguage();
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        height: 32.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
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
                                        'assets/images/button/back-button.png',
                                      ),
                                      fit: BoxFit.contain),
                                )),
                            onTap: () {
                              Navigator.pop(context);
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
                                        'assets/images/button/favorite-button.png',
                                      ),
                                      fit: BoxFit.contain),
                                )),
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          DirectoryFavorite()));
                            }),
                      ],
                    )),
              ]),
            ),
            Container(
              padding: EdgeInsets.only(top: 7.w),
              height: 27.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Việt',
                      style: TextStyle(
                          height: 1.3,
                          color: Theme.Colors.yellow50,
                          fontSize: height > 600 ? 25.sp : 40.sp,
                          fontFamily: 'UTMCooperBlack')),
                  SizedBox(width: 6.w),
                  GestureDetector(
                    onTap: () {
                      _showModalTranslate(context);
                    },
                    child: Image.asset('assets/images/menu/dropdown.png',
                        fit: BoxFit.contain, height: 14.w),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Image.asset('assets/images/directory/c12.png',
                        fit: BoxFit.contain, height: 9.w),
                  ),
                  Text('Anh',
                      style: TextStyle(
                          height: 1.3,
                          color: Theme.Colors.yellow50,
                          fontSize: height > 600 ? 25.sp : 40.sp,
                          fontFamily: 'UTMCooperBlack')),
                  SizedBox(width: 6.w),
                  GestureDetector(
                    onTap: () {
                      _showModalTranslate(context);
                    },
                    child: Image.asset('assets/images/menu/dropdown.png',
                        fit: BoxFit.contain, height: 14.w),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 13.5.w,
                    right: 16.w,
                    child: Image.asset(
                      'assets/images/button/add_short.png',
                      height: 13.5.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 10.w,
                    right: 33.w,
                    child: GestureDetector(
                        child: Container(
                            width: 20.w,
                            height: 20.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/button/communication-with-babe.png',
                                  ),
                                  fit: BoxFit.contain),
                            )),
                        onTap: () {}),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class TranslateModel {
  String id;
  String idAudioResource;
  String idTranslatedAudioResource;
  String keyFrom;
  String keyTo;
  String vietnameseNorth;
  String vietnameseSouth;
  String spanish;
  String japanese;
  String chinese;
  String french;
  String english;
  String american;
  TranslateModel({
    this.id,
    this.idAudioResource,
    this.idTranslatedAudioResource,
    this.keyFrom,
    this.keyTo,
    this.vietnameseNorth,
    this.vietnameseSouth,
    this.spanish,
    this.japanese,
    this.chinese,
    this.french,
    this.english,
    this.american,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'audioResource': idAudioResource,
      'translatedAudioResource': idTranslatedAudioResource,
      'language': keyFrom,
      'toLang': keyTo,
      'vietnameseN': vietnameseNorth,
      'vietnameseS': vietnameseSouth,
      'spanish': spanish,
      'japanese': japanese,
      'chinese': chinese,
      'french': french,
      'english': english,
      'american': american,
    };
  }

  factory TranslateModel.fromJson(Map<String, dynamic> parsedJson) {
    return TranslateModel(
      id: parsedJson['_id'] ?? parsedJson['id'],
      idAudioResource: parsedJson['audioResource'] ?? "",
      idTranslatedAudioResource: parsedJson['translatedAudioResource'] ?? "",
      keyFrom: parsedJson['language'] ?? "",
      keyTo: parsedJson['toLang'] ?? "",
      vietnameseNorth: parsedJson['vietnameseN'] ?? "",
      vietnameseSouth: parsedJson['vietnameseS'] ?? "",
      spanish: parsedJson['spanish'] ?? "",
      japanese: parsedJson['japanese'] ?? "",
      chinese: parsedJson['chinese'] ?? "",
      french: parsedJson['french'] ?? "",
      english: parsedJson['english'] ?? "",
      american: parsedJson['american'] ?? "",
    );
  }
}
