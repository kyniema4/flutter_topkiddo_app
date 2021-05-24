import 'package:flutter/material.dart';
import 'package:topkiddo/screens/home/directory-page/directory_screen.dart';
import 'package:topkiddo/theme/style.dart';
import 'package:topkiddo/theme/theme.dart' as Theme;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/database_helpers.dart';

class ShowDetailSentence extends StatelessWidget {
  final TranslateModel sentences;

  const ShowDetailSentence({Key key, this.sentences}) : super(key: key);

  insertSetenceToFavorite() async {
    final dbHelper = DatabaseHelper.instance;
    Map row = sentences.toJson();
    bool check = await dbHelper.checkIdExists(sentences.id);

    if (!check) {
      await dbHelper.insert(row);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    print(sentences.english);
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
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/directory/search-bar.png'),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        height: 28.w,
                                        padding: EdgeInsets.only(
                                            left: 15.w, right: 15.w),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: SingleChildScrollView(
                                                    scrollDirection: Axis
                                                        .horizontal,
                                                    child: Text(
                                                        sentences
                                                            .vietnameseNorth,
                                                        style: TextStyle(
                                                            color: Theme.Colors
                                                                .orange500,
                                                            fontSize:
                                                                height > 600
                                                                    ? 25.sp
                                                                    : 30.sp,
                                                            fontFamily:
                                                                'UTMCooperBlack'))))
                                          ],
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(top: 3.w),
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 5.w, right: 10.w),
                                        height: 85.w,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/directory/board.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        child: Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Text(sentences.english,
                                                    style: TextStyle(
                                                        color: Theme
                                                            .Colors.orange500,
                                                        fontSize: height > 600
                                                            ? 25.sp
                                                            : 30.sp,
                                                        fontFamily:
                                                            'UTMCooperBlack'))),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: GestureDetector(
                                                    child: Image.asset(
                                                      'assets/images/directory/add.png',
                                                      fit: BoxFit.contain,
                                                      width: 15,
                                                    ),
                                                    onTap: () async {
                                                      await insertSetenceToFavorite();
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0),
                                                  child: GestureDetector(
                                                    child: Image.asset(
                                                      'assets/images/directory/volume.png',
                                                      fit: BoxFit.contain,
                                                      width: 20,
                                                    ),
                                                    onTap: () {},
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                  ])),
                            )
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
