import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:topkiddo/Utils/http_service.dart';
import 'package:topkiddo/screens/home/directory-page/detail_sentences_screen.dart';
import 'package:topkiddo/screens/home/directory-page/directory_favorite.dart';
import 'package:topkiddo/theme/style.dart';
import 'package:topkiddo/theme/theme.dart' as Theme;

import '../../../Utils/database_helpers.dart';
import '../../../components/back.dart';

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
  Timer debouncer = null;
  final dbHelper = DatabaseHelper.instance;
  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer.cancel();
    }
    debouncer = Timer(duration, callback);
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
                item['textTrans'] = item["translatedContent"][0];
              } else {
                item['textTrans'] = jsonDecode(resultSearch['data'][i]['doc']
                    ['resultFromServer'][0])[0][0][0];
              }

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
            item['textTrans'] = item["translatedContent"][0];
          } else {
            item['textTrans'] = jsonDecode(
                resultGet['data'][i]['doc']['resultFromServer'][0])[0][0][0];
          }

          var val = TranslateModel.fromJson(item);
          tempList.add(val);
        }
        if (!mounted) return;
        setState(() {
          this.query = query;
          this.listSentences = tempList;
        });
      }
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListTopTrans();
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
                              height: height - 37.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(
                                    width: 300.w,
                                    height: 180.w,
                                    padding: EdgeInsets.only(top: 60),
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/directory/board-notitle.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    child: Container(
                                      height: 118.w,
                                      width: 250.w,
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
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 30),
                                                      child: Image.asset(
                                                        'assets/images/directory/search.png',
                                                        fit: BoxFit.contain,
                                                        width: 20,
                                                      )),
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller:
                                                          searchController,
                                                      onChanged: searchSentence,
                                                      autofocus: false,
                                                      style: TextStyle(
                                                          fontSize: height > 600
                                                              ? 18.sp
                                                              : 28.sp,
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
                                                                      ? 18.sp
                                                                      : 28.sp,
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
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 30),
                                                          child:
                                                              GestureDetector(
                                                            child: Image.asset(
                                                              'assets/images/directory/del.png',
                                                              fit: BoxFit
                                                                  .contain,
                                                              width: 15,
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
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          2.w),
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
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          listSentences[index]
                                                                              .vietnameseNorth,
                                                                          style: TextStyle(
                                                                              color: Theme.Colors.orange500,
                                                                              fontSize: height > 600 ? 20.sp : 30.sp,
                                                                              fontFamily: 'UTMCooperBlack'),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(right: 10),
                                                                              child: GestureDetector(
                                                                                child: Image.asset(
                                                                                  'assets/images/directory/add.png',
                                                                                  fit: BoxFit.contain,
                                                                                  width: 15,
                                                                                ),
                                                                                onTap: () async {
                                                                                  Map<String, dynamic> row = {
                                                                                    DatabaseHelper.columnName: 'Bob',
                                                                                    DatabaseHelper.columnAge: 23
                                                                                  };
                                                                                  final id = await dbHelper.insert(row);
                                                                                  print('inserted row id: $id');
                                                                                },
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(right: 0),
                                                                              child: GestureDetector(
                                                                                child: Image.asset(
                                                                                  'assets/images/directory/volume.png',
                                                                                  fit: BoxFit.contain,
                                                                                  width: 20,
                                                                                ),
                                                                                onTap: () async {
                                                                                  final allRows = await dbHelper.queryAllRows();
                                                                                  print('query all rows:');
                                                                                  allRows.forEach(print);
                                                                                  // final id = await dbHelper.queryRowCount();
                                                                                  // final rowsDeleted = await dbHelper.delete(id);
                                                                                  // print('deleted $rowsDeleted row(s): row $id');
                                                                                },
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(right: 10),
                                                                        child:
                                                                            GestureDetector(
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/directory/trans.png',
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            width:
                                                                                15,
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
                                                                              fontSize: height > 600 ? 10.sp : 20.sp,
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
                            onTap: () {
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idAudioResource': idAudioResource,
      'idTranslatedAudioResource': idTranslatedAudioResource,
      'keyFrom': keyFrom,
      'keyTo': keyTo,
      'vietnameseNorth': vietnameseNorth,
      'vietnameseSouth': vietnameseSouth,
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
      id: parsedJson['_id'],
      idAudioResource: parsedJson['audioResource'],
      idTranslatedAudioResource: parsedJson['translatedAudioResource'],
      keyFrom: parsedJson['language'] ?? "",
      keyTo: parsedJson['toLang'] ?? "",
      vietnameseNorth: parsedJson['text'] ?? "",
      vietnameseSouth: parsedJson['text'] ?? "",
      spanish: parsedJson['spanish'] ?? "",
      japanese: parsedJson['japanese'] ?? "",
      chinese: parsedJson['chinese'] ?? "",
      french: parsedJson['french'] ?? "",
      english: parsedJson['textTrans'] ?? "",
      american: parsedJson['textTrans'] ?? "",
    );
  }
}
