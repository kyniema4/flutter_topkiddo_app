import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/database_helpers.dart';
import 'directory_screen.dart';
import '../../../components/back.dart';
import 'package:easy_localization/easy_localization.dart';

class DirectoryFavorite extends StatefulWidget {
  DirectoryFavorite({Key key}) : super(key: key);

  @override
  _DirectoryFavoriteState createState() => _DirectoryFavoriteState();
}

class _DirectoryFavoriteState extends State<DirectoryFavorite> {
  final dbHelper = DatabaseHelper.instance;
  List listFavoriteSentences = [];
  String dataBoxName = "sentence";

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
                                padding: EdgeInsets.only(top: 8.w),
                                alignment: Alignment.topCenter,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/directory/board-notitle.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                child: Container(
                                  height: 122.w,
                                  width: 245.w,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.elliptical(150.w, 7.w),
                                    topRight: Radius.elliptical(150.w, 7.w),
                                    bottomLeft: Radius.circular(15.w),
                                    bottomRight: Radius.circular(15.w),
                                  )),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            padding: EdgeInsets.only(
                                                top: 7.w, bottom: 8.w),
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
                                                                          .center,
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
                                                                                ? 25.sp
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
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(right: 1.w, left: 5.w),
                                                                            child: GestureDetector(
                                                                                child: Image.asset(
                                                                                  'assets/images/directory/minus.png',
                                                                                  fit: BoxFit.contain,
                                                                                  width: 9.w,
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
                                                                                .Colors.grey600,
                                                                            fontSize: height > 600
                                                                                ? 17.sp
                                                                                : 22.sp,
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

class TopButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        height: 32.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Back(buttonImage: 'assets/images/button/back-button.png'),
            ),
            Expanded(
                child: Text(
              'favoriteList'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.3,
                  color: Theme.Colors.yellow50,
                  fontSize: height > 600 ? 25.sp : 40.sp,
                  fontFamily: 'UTMCooperBlack'),
            )),
            Expanded(child: Container()),
          ],
        ));
  }
}
