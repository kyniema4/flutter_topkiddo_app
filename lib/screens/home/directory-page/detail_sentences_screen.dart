import 'package:flutter/material.dart';
import './directory_screen.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
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
                      alignment: Alignment.center,
                      height: height - 40.w,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              // width: 300.w,
                              // height: 180.w,
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
                                  // height: 118.w,
                                  // width: 250.w,
                                  height: 111.5.w,
                                  width: 243.w,
                                  decoration: BoxDecoration(
                                      // color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(7.w),
                                    bottomRight: Radius.circular(7.w),
                                  )),
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
                                            left: 15.w, top: 8.w, right: 15.w),
                                        height: 77.w,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/directory/board.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Text(sentences.english,
                                                    style: TextStyle(
                                                        height: 1.3,
                                                        color: Theme
                                                            .Colors.orange500,
                                                        fontSize: height > 600
                                                            ? 25.sp
                                                            : 30.sp,
                                                        fontFamily:
                                                            'UTMCooperBlack'))),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  child: Image.asset(
                                                    'assets/images/directory/add.png',
                                                    fit: BoxFit.contain,
                                                    width: 9.w,
                                                  ),
                                                  onTap: () async {
                                                    await insertSetenceToFavorite();
                                                  },
                                                ),
                                                SizedBox(width: 8.w),
                                                GestureDetector(
                                                  child: Image.asset(
                                                    'assets/images/directory/volume.png',
                                                    fit: BoxFit.contain,
                                                    width: 10.w,
                                                  ),
                                                  onTap: () {},
                                                ),
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
