import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:topkiddo/data_local/favorite_sentence_model.dart';
import 'package:topkiddo/screens/home/designed-courses/design_course_screen.dart';
import 'package:topkiddo/theme/style.dart';
import 'package:topkiddo/theme/theme.dart' as Theme;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/database_helpers.dart';
import 'directory_screen.dart';
import 'directory_screen.dart';

class DirectoryFavorite extends StatefulWidget {
  DirectoryFavorite({Key key}) : super(key: key);

  @override
  _DirectoryFavoriteState createState() => _DirectoryFavoriteState();
}

class _DirectoryFavoriteState extends State<DirectoryFavorite> {
  final dbHelper = DatabaseHelper.instance;
  List listFavoriteSentences = [];
  String dataBoxName = "sentence";

  show() async {
    print('run show');
    var box = Hive.box(dataBoxName);
    
    print('debugging');
  }

  getListSentenceFavoriteFromLocal() async {
    var result = await dbHelper.queryAllRows();
    if (result.isNotEmpty) {
      var listData = result.map((e) => TranslateModel.fromJson(e)).toList();
      if (!mounted) return;
      setState(() {
        this.listFavoriteSentences = listData;
      });
    } else {
      setState(() {
        this.listFavoriteSentences = [];
      });
    }
  }

  deleteSentenceFromLocal(String id) async {
    print(id);
    bool result = await dbHelper.delete(id);
    if (result) {
      await getListSentenceFavoriteFromLocal();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListSentenceFavoriteFromLocal();
    show();
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
                children: [
                  Container(
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
                                    ],
                                  )),
                            ]),
                          ),
                        ],
                      )),
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
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listFavoriteSentences.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                        child: Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border(
                                                                  bottom: listFavoriteSentences.length -
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
                                                                EdgeInsets.only(
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
                                                                        listFavoriteSentences[index]
                                                                            .vietnameseNorth,
                                                                        style: TextStyle(
                                                                            color: Theme
                                                                                .Colors.orange500,
                                                                            fontSize: height > 600
                                                                                ? 20.sp
                                                                                : 30.sp,
                                                                            fontFamily: 'UTMCooperBlack'),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(right: 10, left: 10),
                                                                            child: GestureDetector(
                                                                                child: Image.asset(
                                                                                  'assets/images/directory/minus.png',
                                                                                  fit: BoxFit.contain,
                                                                                  width: 15,
                                                                                ),
                                                                                onTap: () async {
                                                                                  await deleteSentenceFromLocal(listFavoriteSentences[index].id);
                                                                                }),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        listFavoriteSentences[index]
                                                                            .english,
                                                                        style: TextStyle(
                                                                            color: Theme
                                                                                .Colors.green200,
                                                                            fontSize: height > 600
                                                                                ? 10.sp
                                                                                : 20.sp,
                                                                            fontFamily: 'UTMCooperBlack'),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            )),
                                                        onTap: () {
                                                          // Navigator.push(
                                                          //     context,
                                                          //     MaterialPageRoute(
                                                          //         builder: (BuildContext
                                                          //                 context) =>
                                                          //             ShowDetailSentence(
                                                          //               sentences:
                                                          //                   listSentences[index],
                                                          //             )));
                                                        })
                                                  ],
                                                ),
                                              );
                                            }),
                                      )
                                    ],
                                  ),
                                ))
                          ]))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
