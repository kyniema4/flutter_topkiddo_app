import 'package:flutter/material.dart';
import 'package:topkiddo/Utils/http_service.dart';
import '../../../theme/style.dart';
import '../../../components/languages_app.dart';
import '../../../components/swipe-configuration.dart';
import '../../home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  Tween<double> _tween = Tween(begin: 1.5, end: 2);

  void initState() {
    super.initState();
    s = PageController();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
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
                        height: 158.w,
                        width: 342.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/lesson/ip-full-board-white.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          // color: Colors.red,
                          margin: EdgeInsets.all(13.w),
                          // child: Text('Common Animals',
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //         fontSize: height > 600 ? 80.sp : 140.sp,
                          //         // fontWeight: FontWeight.w900,
                          //         color: Colors.red,
                          //         fontFamily: 'UTMCooperBlack')),
                          // child: Text('Cat And Dog',
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //         fontSize: height > 600 ? 70.sp : 100.sp,
                          //         // fontWeight: FontWeight.w900,
                          //         color: Colors.red,
                          //         fontFamily: 'UTMCooperBlack')),
                          child: SwipeDetector(
                            child: PageView(
                              physics: BouncingScrollPhysics(),
                              onPageChanged: _onPageViewChange,
                              children: [
                                Container(
                                    child: Column(
                                  children: [
                                    Text('Click Vào Từng Hình Để Nghe Cách Đọc',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                height > 600 ? 30.sp : 45.sp,
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
                                Center(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(
                                        parent: _controller,
                                        curve: Curves.elasticOut)),
                                    child: SizedBox(
                                      child: Text('Rose',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize:
                                                  height > 600 ? 30.sp : 70.sp,
                                              // fontWeight: FontWeight.w900,
                                              color: Colors.red,
                                              fontFamily: 'UTMCooperBlack')),
                                    ),
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
