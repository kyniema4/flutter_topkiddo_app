import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:topkiddo/Utils/http_service.dart';
import 'package:topkiddo/theme/style.dart';
import 'package:topkiddo/theme/theme.dart' as Theme;

import '../../../components/back.dart';

class DirectoryScreen extends StatefulWidget {
  DirectoryScreen({Key key}) : super(key: key);

  @override
  _DirectoryScreenState createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {
  TextEditingController searchController = TextEditingController();
  List listSentence = [];
  String keyFrom = 'vi';
  String keyTo = 'en';
  String query = "";
  Timer debouncer = null;

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
              this.listSentence = tempList;
            });
            print(listSentence);
            print('debugging');
          }
        } catch (e) {
          print(e);
        }
      });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchDiretory();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                                    alignment: Alignment.center,
                                    child: Stack(children: [
                                      Image.asset(
                                        'assets/images/directory/board-notitle.png',
                                        fit: BoxFit.contain,
                                      ),
                                      Positioned(
                                          top: 20.w,
                                          left: 0,
                                          right: 0,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                  // color: Colors.blue,
                                                  height: 28.w,
                                                  child: Image.asset(
                                                      'assets/images/directory/search-bar.png',
                                                      fit: BoxFit.contain)),
                                              Positioned(
                                                // top: 100.w,
                                                // left: 100.w,
                                                //right: 500,
                                                child: Container(
                                                    child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0.0),
                                                          child: Image.asset(
                                                            'assets/images/directory/search.png',
                                                            fit: BoxFit.contain,
                                                            width: 25,
                                                          )),
                                                      Flexible(
                                                        child: TextFormField(
                                                          controller:
                                                              searchController,
                                                          onChanged:
                                                              searchSentence,
                                                          autofocus: false,
                                                          style: TextStyle(
                                                              fontSize:
                                                                  height > 600
                                                                      ? 18.sp
                                                                      : 28.sp,
                                                              color: Theme
                                                                  .Colors
                                                                  .orange500,
                                                              fontFamily:
                                                                  'UTMCooperBlack'),
                                                          decoration: InputDecoration(
                                                              isCollapsed: true,
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical: 2
                                                                          .w,
                                                                      horizontal:
                                                                          6.w),
                                                              focusedBorder:
                                                                  styleOutline,
                                                              enabledBorder:
                                                                  styleUnderline,
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  'searchFor'
                                                                      .tr(),
                                                              hintStyle: TextStyle(
                                                                  fontSize: height >
                                                                          600
                                                                      ? 18.sp
                                                                      : 28.sp,
                                                                  color: Theme
                                                                      .Colors
                                                                      .orange500,
                                                                  fontFamily:
                                                                      'UTMCooperBlack')),
                                                        ),
                                                      )
                                                    ])),
                                              ),
                                            ],
                                          ))
                                    ]),
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
                            onTap: () {}),
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
  String language;
  String toLang;
  String vietnameseNorth;
  String vietnameseSouth;
  String spanish;
  String japanese;
  String chinese;
  String french;
  String englist;
  String american;
  TranslateModel({
    this.id,
    this.language,
    this.toLang,
    this.vietnameseNorth,
    this.vietnameseSouth,
    this.spanish,
    this.japanese,
    this.chinese,
    this.french,
    this.englist,
    this.american,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'language': language,
      'toLang': toLang,
      'vietnameseNorth': vietnameseNorth,
      'vietnameseSouth': vietnameseSouth,
      'spanish': spanish,
      'japanese': japanese,
      'chinese': chinese,
      'french': french,
      'englist': englist,
      'american': american,
    };
  }

  factory TranslateModel.fromJson(Map<String, dynamic> parsedJson) {
    return TranslateModel(
      id: parsedJson['_id'],
      language: parsedJson['language'] ?? "",
      toLang: parsedJson['toLang'] ?? "",
      vietnameseNorth: parsedJson['text'] ?? "",
      vietnameseSouth: parsedJson['text'] ?? "",
      spanish: parsedJson['spanish'] ?? "",
      japanese: parsedJson['japanese'] ?? "",
      chinese: parsedJson['chinese'] ?? "",
      french: parsedJson['french'] ?? "",
      englist: parsedJson['textTrans'] ?? "",
      american: parsedJson['textTrans'] ?? "",
    );
  }
}
