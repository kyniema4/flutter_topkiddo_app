import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../../components/back.dart';

class ModalNotification extends StatefulWidget {
  @override
  _ModalNotification createState() => _ModalNotification();
}

class _ModalNotification extends State<ModalNotification> {
  _contentNotificate(context, String text) {
    double height = MediaQuery.of(context).size.height;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 7.w,
          width: 7.w,
          alignment: Alignment.centerLeft,
          child: Icon(Icons.brightness_1,
              color: Theme.Colors.orangeDark, size: 3.w),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: height > 600 ? 16.sp : 23.sp,
              fontFamily: 'UTMCooperBlack',
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
              color: Theme.Colors.orangeDark,
            ),
          ),
        ),
      ],
    );
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
                    child: Stack(children: <Widget>[
                      Center(
                          child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                              height: 158.w,
                              // height: 145.w,
                              margin: EdgeInsets.only(top: 8.w),
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/menu/board.png",
                                    // "assets/images/directory/board-notitle.png",
                                    fit: BoxFit.contain,
                                    height: double.infinity,
                                  ),
                                  Positioned(
                                      top: 26.w,
                                      child: Container(
                                        // height: 125.w,
                                        width: 260.w,
                                        // color:
                                        //     Colors.blueAccent.withOpacity(0.5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 100.w,
                                              width: double.infinity,
                                              padding: EdgeInsets.fromLTRB(
                                                  13.w, 4.w, 13.w, 4.w),
                                              decoration: BoxDecoration(
                                                // color: Colors.pink,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/directory/board.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              child: SingleChildScrollView(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 8.w, 0, 5.w),
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Tham gia cộng đồng phụ huynh TOPKIDDO để nhận nhiều quyền lợi và lời khuyên học tập hiệu quả nhất.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: height > 600
                                                              ? 19.sp
                                                              : 26.sp,
                                                          fontFamily:
                                                              'UTMCooperBlack',
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          letterSpacing: 0.5,
                                                          color: Theme
                                                              .Colors.orange900,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 6.w,
                                                      ),
                                                      _contentNotificate(
                                                          context,
                                                          'Hỗ trợ chuyên môn từ đội ngũ giáo viên của TOPKIDDO, bao gồm giáo viên Việt Nam và giáo viên bản xứ: Anh, Mỹ, Canada'),
                                                      SizedBox(height: 4.w),
                                                      _contentNotificate(
                                                          context,
                                                          'Kinh nghiệm học tập và dạy con từ hàng triệu phụ huynh tin dùng'),
                                                      SizedBox(height: 4.w),
                                                      _contentNotificate(
                                                          context,
                                                          'Các hoạt động và bài viết độc quyền từ TOPKIDDO cho bé từ lúc còn trong bụng mẹ đến khi chào đời, và lớn lên"'),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  3.w, 4.w, 3.w, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Image.asset(
                                                          'assets/images/menu/fb-icon.png',
                                                          height: 15.w,
                                                          fit: BoxFit.contain),
                                                      SizedBox(width: 5.w),
                                                      Text(
                                                        'Đồng hành cùng con học TOPKIDO',
                                                        style: TextStyle(
                                                          fontSize: height > 600
                                                              ? 16.sp
                                                              : 23.sp,
                                                          fontFamily:
                                                              'UTMCooperBlack',
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          letterSpacing: 0.5,
                                                          color: Theme
                                                              .Colors.blue500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Image.asset(
                                                        'joinBtn'.tr(),
                                                        height: 15.w,
                                                        fit: BoxFit.contain),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                  Positioned(
                                    top: 0,
                                    child: Container(
                                        // color: Color(0x3Fcc2eee),
                                        height: 20.w,
                                        alignment: Alignment.center,
                                        child: Text('notifications'.tr(),
                                            style: TextStyle(
                                                height: 1.2,
                                                color: Theme.Colors.yellow300,
                                                fontSize: height > 600
                                                    ? 28.sp
                                                    : 42.sp,
                                                fontFamily: 'UTMCooperBlack'),
                                            textAlign: TextAlign.center)),
                                  ),
                                ],
                              )),
                        ],
                      )),
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
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Back(buttonImage: 'assets/images/button/close-button.png'),
            ),
          ],
        ));
  }
}
