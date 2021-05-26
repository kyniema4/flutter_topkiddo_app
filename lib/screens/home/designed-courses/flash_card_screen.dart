import 'package:flutter/material.dart';
import 'package:topkiddo/Utils/http_service.dart';
import '../../../theme/style.dart';
import '../../../components/languages_app.dart';
import '../../../components/swipe-configuration.dart';
import '../../home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
// import 'package:swipedetector/swipedetector.dart';

class FlashCardScreen extends StatefulWidget {
  final lessonDetail;

  const FlashCardScreen({this.lessonDetail});
  @override
  _FlashCardScreen createState() => _FlashCardScreen();
}

class _FlashCardScreen extends State<FlashCardScreen>
    with TickerProviderStateMixin {
  String _swipeDirection = "";
  bool isShowTopButton = true;
  int number = 0;
  int _lastReportedPage = 0;
  int previousPage = 0;
  ScrollController s;
  AnimationController _controller;
  Tween<double> _tween = Tween(begin: 1.5, end: 1.8);
  FlickManager flickManager;
  void initState() {
    super.initState();
    s = PageController();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4"),
    );
  }

  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    previousPage = page;
    setState(() {
      number = page;
    });
  }

  _reset() {
    print("Previous page: $number");
    _controller.repeat();
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.repeat(reverse: false);
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.lessonDetail);
    print('debugging');
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                width: width,
                height: height,
                decoration: blackBackground,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 165.w,
                        width: 321.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/lesson/ip-full-board-white.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(4.5.w),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11.5.w)),
                          child: SwipeDetector(
                            child: PageView(
                              physics: BouncingScrollPhysics(),
                              onPageChanged: _onPageViewChange,
                              children: [
                                //trường hợp chữ tiêu đề
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(8.5.w),
                                  child: Text('Common Animals',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              height > 600 ? 80.sp : 140.sp,
                                          // fontWeight: FontWeight.w900,
                                          color: Colors.red,
                                          fontFamily: 'UTMCooperBlack')),
                                ),

                                //trường hợp ảnh full
                                Center(
                                  child: Image.asset(
                                    'assets/images/flashcard/image1.jpg',
                                    fit: BoxFit.contain,
                                  ),
                                ),

                                //trường hợp chữ ngắn
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(8.5.w),
                                  child: Text('Cat And Dog',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              height > 600 ? 70.sp : 100.sp,
                                          // fontWeight: FontWeight.w900,
                                          color: Colors.red,
                                          fontFamily: 'UTMCooperBlack')),
                                ),

                                //trường hợp ảnh full
                                Center(
                                  child: Image.asset(
                                      'assets/images/flashcard/image2.jpg',
                                      fit: BoxFit.contain),
                                ),

                                //trường hợp click ảnh để nghe
                                Container(
                                    margin: EdgeInsets.all(8.5.w),
                                    child: Column(
                                      children: [
                                        Text(
                                            'Click Vào Từng Hình Để Nghe Cách Đọc',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: height > 600
                                                    ? 25.sp
                                                    : 35.sp,
                                                // fontWeight: FontWeight.w900,
                                                color: Colors.red,
                                                fontFamily: 'UTMCooperBlack')),
                                        SizedBox(
                                          height: 20.w,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/flashcard/image4.jpg',
                                              fit: BoxFit.contain,
                                              height: 70.w,
                                            ),
                                            Image.asset(
                                              'assets/images/flashcard/image6.jpg',
                                              fit: BoxFit.contain,
                                              height: 70.w,
                                            ),
                                          ],
                                        )
                                      ],
                                    )),

                                //trường hợp ảnh full
                                Center(
                                  child: Image.asset(
                                      'assets/images/flashcard/image5.jpg',
                                      fit: BoxFit.contain),
                                ),

                                //trường hợp chỉ sử dụng cho text ít chữ
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(8.5.w),
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(
                                        parent: _controller,
                                        curve: Curves.elasticOut)),
                                    child: SizedBox(
                                      child: Text('Cat',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize:
                                                  height > 600 ? 35.sp : 75.sp,
                                              // fontWeight: FontWeight.w900,
                                              color: Colors.red,
                                              fontFamily: 'UTMCooperBlack')),
                                    ),
                                  ),
                                ),

                                // trường hợp video
                                Container(
                                  height: 1.sh,
                                  // width: 1.sw,
                                  color: Colors.black,
                                  child: ClipRRect(
                                    child: Center(
                                      child: FlickVideoPlayer(
                                        flickVideoWithControls:
                                            FlickVideoWithControls(
                                          controls: FlickLandscapeControls(),
                                        ),
                                        // flickVideoWithControlsFullscreen:
                                        //     FlickVideoWithControls(
                                        //   controls: FlickLandscapeControls(),
                                        // ),
                                        flickManager: flickManager,
                                      ),
                                    ),
                                  ),
                                ),

                                // trường hợp ảnh full
                                Center(
                                  child: Image.asset(
                                      'assets/images/flashcard/image7.jpg',
                                      fit: BoxFit.contain),
                                ),

                                // trường hợp câu có lồng ảnh nhỏ
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(8.5.w),
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('I',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: height > 600
                                                      ? 70.sp
                                                      : 100.sp,
                                                  // fontWeight: FontWeight.w900,
                                                  color: Colors.red,
                                                  fontFamily:
                                                      'UTMCooperBlack')),
                                        ],
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('Love',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: height > 600
                                                      ? 70.sp
                                                      : 100.sp,
                                                  // fontWeight: FontWeight.w900,
                                                  color: Colors.red,
                                                  fontFamily:
                                                      'UTMCooperBlack')),
                                        ],
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('Love',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: height > 600
                                                      ? 70.sp
                                                      : 100.sp,
                                                  // fontWeight: FontWeight.w900,
                                                  color: Colors.red,
                                                  fontFamily:
                                                      'UTMCooperBlack')),
                                        ],
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('Love',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: height > 600
                                                      ? 70.sp
                                                      : 100.sp,
                                                  // fontWeight: FontWeight.w900,
                                                  color: Colors.red,
                                                  fontFamily:
                                                      'UTMCooperBlack')),
                                        ],
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('Love',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: height > 600
                                                      ? 70.sp
                                                      : 100.sp,
                                                  // fontWeight: FontWeight.w900,
                                                  color: Colors.red,
                                                  fontFamily:
                                                      'UTMCooperBlack')),
                                        ],
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('My',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: height > 600
                                                      ? 70.sp
                                                      : 100.sp,
                                                  // fontWeight: FontWeight.w900,
                                                  color: Colors.red,
                                                  fontFamily:
                                                      'UTMCooperBlack')),
                                        ],
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('Little',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: height > 600
                                                      ? 70.sp
                                                      : 100.sp,
                                                  // fontWeight: FontWeight.w900,
                                                  color: Colors.red,
                                                  fontFamily:
                                                      'UTMCooperBlack')),
                                        ],
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 3.w),
                                            child: Image.asset(
                                              'assets/images/flashcard/image3.jpg',
                                              height: 17.w,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Text('Cat',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: height > 600
                                                      ? 45.sp
                                                      : 65.sp,
                                                  // fontWeight: FontWeight.w900,
                                                  color: Colors.red,
                                                  fontFamily:
                                                      'UTMCooperBlack')),
                                        ],
                                      ),
                                      //hết bài học chuyển đến page animation_screen.dart
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onSwipeUp: () {
                              setState(() {
                                _swipeDirection = "Swipe Up";
                                _reset();
                              });
                            },
                            onSwipeDown: () {
                              setState(() {
                                _swipeDirection = "Swipe Down";
                              });
                            },
                            swipeConfiguration: SwipeConfiguration(
                                verticalSwipeMinVelocity: 100.0,
                                verticalSwipeMinDisplacement: 50.0,
                                verticalSwipeMaxWidthThreshold: 100.0,
                                horizontalSwipeMaxHeightThreshold: 50.0,
                                horizontalSwipeMinDisplacement: 50.0,
                                horizontalSwipeMinVelocity: 200.0),
                          ),
                        ),
                      ),
                    ),
                    isShowTopButton ? TopButton() : Container(),
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
    return Container(
        height: 32.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 13.5.w,
                      left: -13.5.w,
                      child: Align(
                        child: Image.asset(
                          'assets/images/button/bar-long.png',
                          height: 12.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.w,
                      left: 15.w,
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
                                          'assets/images/button/home-button.png',
                                        ),
                                        fit: BoxFit.contain),
                                  )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomeScreen()));
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
                                          'assets/images/button/musicon-button.png',
                                        ),
                                        fit: BoxFit.contain),
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: LanguagesApp()),
          ],
        ));
  }
}
