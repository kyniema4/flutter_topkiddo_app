import 'package:audioplayers/audioplayers.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:topkiddo/Utils/download_data.dart';
import 'package:video_player/video_player.dart';

import 'package:topkiddo/Utils/http_service.dart';

import '../../../components/languages_app.dart';
import '../../../components/swipe-configuration.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../home/home_screen.dart';
import './animation_balloon_screen.dart';
// import 'package:swipedetector/swipedetector.dart';

class FlashCardScreen extends StatefulWidget {
  final lessonDetail;

  const FlashCardScreen({Key key, this.lessonDetail}) : super(key: key);
  @override
  _FlashCardScreen createState() => _FlashCardScreen();
}

class _FlashCardScreen extends State<FlashCardScreen>
    with TickerProviderStateMixin {
  String _swipeDirection = "";
  bool isShowTopButton = true;
  bool isShowQuestion = false;
  int number = 0;
  int _lastReportedPage = 0;
  int previousPage = 0;
  ScrollController s;
  AnimationController _controller;
  Tween<double> _tween = Tween(begin: 1.5, end: 1.8);
  FlickManager flickManager;
  AudioPlayer audioPlayer = AudioPlayer();
  List<Widget> listFlashCard = [];
  HandleDownload download = HandleDownload();
  String idAudio = "";
//content-audio =>image-audio

  playAudio() async {
    await audioPlayer.play(
        "/data/user/0/com.example.topkiddo/app_flutter/60b7862add38fc1918816a24/60b79aa1dd38fc1918818a26.mp3",
        isLocal: true);
  }

  createFlashCard() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // List<Widget> listWidget = [];
    // Map data = widget.lessonDetail;
    // if (data.isNotEmpty) {
    //   if (data['part'].length > 0) {
    //     data['part'].forEach((e) {
    //       String topic = data['part'][e]['topic'];
    //       List content=data['part'][e]['content'];
    //       listWidget
    //           .add(FlashCard(height: height, content: topic).cardTitle());
    //       print(content);
    //       print('debugging');
    //     });
    //   }
    // }

    FlashCard flashCard = FlashCard();
    List<Widget> listWidget = [
      FlashCard(height: height).cardTitle(),
      FlashCard(height: height).cardImageFull(),
      FlashCard(height: height).cardShortText(),
      FlashCard(height: height).cardTitle(),
      FlashCard(height: height).cardImageFull(),
      FlashCard(height: height).cardSentence(),
      FlashCard(height: height).cardClickEachImage()
    ];
    setState(() {
      listFlashCard = [...listWidget];
    });
  }

  void initState() {
    super.initState();
    s = PageController();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    // flickManager = FlickManager(
    //   videoPlayerController: VideoPlayerController.network(
    //       "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4"),
    // );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createFlashCard();
  }

  _onPageViewChange(int page) {
    final flashCardCurrent = listFlashCard[page];
    print(flashCardCurrent);
    print('debugging');
    print("Current Page: " + page.toString());
    previousPage = page;
    setState(() {
      number = page;
      if (page > 3) {
        isShowQuestion = false;
      } else {
        isShowQuestion = false;
      }
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
    //flickManager.dispose();
    super.dispose();
  }

  //trường hợp câu hỏi chữ và trả lời ảnh
  _buildQuestionTypeOne(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(8.5.w),
          child: Text('Câu hỏi: Which One Is "Cat" ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: height > 600 ? 35.sp : 50.sp,
                  // fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontFamily: 'UTMCooperBlack')),
        ),
        Container(
          width: 1.sw,
          height: height > 600 ? 0.65.sh : 0.7.sh,
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              for (var i = 0; i < 4; i++)
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: height > 600 ? 60.w : 50.w,
                      width: height > 600 ? 114.w : 94.w,
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: height > 600 ? 8.w : 4.w),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/lesson/khung.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(3.w),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                height > 600 ? 11.w : 8.5.w)),
                        child: Center(
                          child: Image.asset(
                              'assets/images/flashcard/image5.jpg',
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: -1.w,
                        child: Image.asset(
                          // 'assets/images/lesson/correct.png',
                          'assets/images/lesson/false.png',
                          width: height > 600 ? 25.w : 20.w,
                          fit: BoxFit.contain,
                        ))
                  ],
                )
            ],
          ),
        ),
      ],
    );
  }

  //trường hợp câu hỏi ảnh và trả lời chữ
  _buildQuestionTypeTwo(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(8.5.w),
          child: Text('Câu hỏi: Choose The Word That Goes With The Picture ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: height > 600 ? 30.sp : 45.sp,
                  // fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontFamily: 'UTMCooperBlack')),
        ),
        Container(
          height: height > 600 ? 85.w : 68.w,
          width: height > 600 ? 163.w : 129.w,
          margin: EdgeInsets.symmetric(
              horizontal: 10.w, vertical: height > 600 ? 8.w : 2.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/lesson/khung.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(3.5.w),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(height > 600 ? 17.w : 12.w)),
            child: Center(
              child: Image.asset('assets/images/flashcard/image5.jpg',
                  fit: BoxFit.contain),
            ),
          ),
        ),
        Container(
          height: 0.24.sh,
          width: 1.sw,
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              for (var i = 0; i < 6; i++)
                Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text('Fish',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: height > 600 ? 45.sp : 60.sp,
                                    color: Colors.white,
                                    fontFamily: 'UTMCooperBlack')),
                          ),
                          // Positioned(
                          //     bottom: -1.w,
                          //     child: Image.asset(
                          //       // 'assets/images/lesson/correct.png',
                          //       'assets/images/lesson/false.png',
                          //       width: 20.w,
                          //       fit: BoxFit.contain,
                          //     ))
                        ],
                      )
                    ]),
            ],
          ),
        ),
      ],
    );
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
                        height: isShowQuestion
                            ? (height > 600 ? 0.85.sh : null)
                            : 165.w,
                        width: isShowQuestion ? 0.9.sw : 321.w,
                        // khi đến phần câu hỏi thì bỏ bảng trắng
                        decoration: isShowQuestion
                            ? BoxDecoration(image: null)
                            : BoxDecoration(
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
                              children: listFlashCard,
                              //   children: [
                              //     //trường hợp chữ tiêu đề
                              //     Container(
                              //       alignment: Alignment.center,
                              //       margin: EdgeInsets.all(8.5.w),
                              //       child: Text('Common Animals',
                              //           textAlign: TextAlign.center,
                              //           style: TextStyle(
                              //               fontSize:
                              //                   height > 600 ? 80.sp : 140.sp,
                              //               // fontWeight: FontWeight.w900,
                              //               color: Theme.Colors.orange900,
                              //               fontFamily: 'UTMCooperBlack')),
                              //     ),

                              //     //trường hợp ảnh full
                              //     Center(
                              //       child: Image.asset(
                              //         'assets/images/flashcard/image1.jpg',
                              //         fit: BoxFit.contain,
                              //       ),
                              //     ),

                              //     //trường hợp chữ ngắn
                              //     Container(
                              //       alignment: Alignment.center,
                              //       margin: EdgeInsets.all(8.5.w),
                              //       child: Text('Cat And Dog',
                              //           textAlign: TextAlign.center,
                              //           style: TextStyle(
                              //               fontSize:
                              //                   height > 600 ? 70.sp : 100.sp,
                              //               // fontWeight: FontWeight.w900,
                              //               color: Theme.Colors.orange900,
                              //               fontFamily: 'UTMCooperBlack')),
                              //     ),

                              //     // //trường hợp ảnh full
                              //     // //đoạn này comment lại lướt cho nhanh:v
                              //     Center(
                              //       child: Image.asset(
                              //           'assets/images/flashcard/image2.jpg',
                              //           fit: BoxFit.contain),
                              //     ),

                              //     // //trường hợp click ảnh để nghe
                              //     Container(
                              //         margin: EdgeInsets.all(8.5.w),
                              //         child: Column(
                              //           children: [
                              //             Text(
                              //                 'Click Vào Từng Hình Để Nghe Cách Đọc',
                              //                 textAlign: TextAlign.center,
                              //                 style: TextStyle(
                              //                     fontSize: height > 600
                              //                         ? 25.sp
                              //                         : 35.sp,
                              //                     // fontWeight: FontWeight.w900,
                              //                     color: Theme.Colors.orange900,
                              //                     fontFamily: 'UTMCooperBlack')),
                              //             SizedBox(
                              //               height: 20.w,
                              //             ),
                              //             Row(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.spaceAround,
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.center,
                              //               children: [
                              //                 Image.asset(
                              //                   'assets/images/flashcard/image4.jpg',
                              //                   fit: BoxFit.contain,
                              //                   height: 70.w,
                              //                 ),
                              //                 Image.asset(
                              //                   'assets/images/flashcard/image6.jpg',
                              //                   fit: BoxFit.contain,
                              //                   height: 70.w,
                              //                 ),
                              //               ],
                              //             )
                              //           ],
                              //         )),

                              //     //trường hợp ảnh full
                              //     Center(
                              //       child: Image.asset(
                              //           'assets/images/flashcard/image5.jpg',
                              //           fit: BoxFit.contain),
                              //     ),

                              //     // //trường hợp chỉ sử dụng cho text ít chữ
                              //     Container(
                              //       alignment: Alignment.center,
                              //       margin: EdgeInsets.all(8.5.w),
                              //       child: ScaleTransition(
                              //         scale: _tween.animate(CurvedAnimation(
                              //             parent: _controller,
                              //             curve: Curves.elasticOut)),
                              //         child: SizedBox(
                              //           child: Text('Cat',
                              //               textAlign: TextAlign.center,
                              //               style: TextStyle(
                              //                   fontSize:
                              //                       height > 600 ? 35.sp : 75.sp,
                              //                   // fontWeight: FontWeight.w900,
                              //                   color: Theme.Colors.orange900,
                              //                   fontFamily: 'UTMCooperBlack')),
                              //         ),
                              //       ),
                              //     ),

                              //     // // trường hợp video
                              //     Container(
                              //       height: 1.sh,
                              //       // width: 1.sw,
                              //       color: Colors.black,
                              //       child: ClipRRect(
                              //         child: Center(
                              //           child: FlickVideoPlayer(
                              //             flickVideoWithControls:
                              //                 FlickVideoWithControls(
                              //               controls: FlickLandscapeControls(),
                              //             ),
                              //             // flickVideoWithControlsFullscreen:
                              //             //     FlickVideoWithControls(
                              //             //   controls: FlickLandscapeControls(),
                              //             // ),
                              //             flickManager: flickManager,
                              //           ),
                              //         ),
                              //       ),
                              //     ),

                              //     // trường hợp ảnh full
                              //     Center(
                              //       child: Image.asset(
                              //           'assets/images/flashcard/image7.jpg',
                              //           fit: BoxFit.contain),
                              //     ),

                              //     //trường hợp câu có lồng ảnh nhỏ
                              //     Container(
                              //       alignment: Alignment.center,
                              //       margin: EdgeInsets.all(8.5.w),
                              //       child: Wrap(
                              //         crossAxisAlignment:
                              //             WrapCrossAlignment.center,
                              //         alignment: WrapAlignment.center,
                              //         children: [
                              //           Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             children: [
                              //               Text('I',
                              //                   textAlign: TextAlign.center,
                              //                   style: TextStyle(
                              //                       fontSize: height > 600
                              //                           ? 70.sp
                              //                           : 100.sp,
                              //                       color: Theme.Colors.orange900,
                              //                       fontFamily:
                              //                           'UTMCooperBlack')),
                              //             ],
                              //           ),
                              //           SizedBox(width: 5.w),
                              //           Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             children: [
                              //               Text('Love',
                              //                   textAlign: TextAlign.center,
                              //                   style: TextStyle(
                              //                       fontSize: height > 600
                              //                           ? 70.sp
                              //                           : 100.sp,
                              //                       color: Theme.Colors.orange900,
                              //                       fontFamily:
                              //                           'UTMCooperBlack')),
                              //             ],
                              //           ),

                              //           SizedBox(width: 5.w),
                              //           Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             children: [
                              //               Text('My',
                              //                   textAlign: TextAlign.center,
                              //                   style: TextStyle(
                              //                       fontSize: height > 600
                              //                           ? 70.sp
                              //                           : 100.sp,
                              //                       color: Theme.Colors.orange900,
                              //                       fontFamily:
                              //                           'UTMCooperBlack')),
                              //             ],
                              //           ),
                              //           SizedBox(width: 5.w),
                              //           Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             children: [
                              //               Text('Little',
                              //                   textAlign: TextAlign.center,
                              //                   style: TextStyle(
                              //                       fontSize: height > 600
                              //                           ? 70.sp
                              //                           : 100.sp,
                              //                       color: Theme.Colors.orange900,
                              //                       fontFamily:
                              //                           'UTMCooperBlack')),
                              //             ],
                              //           ),
                              //           SizedBox(width: 5.w),
                              //           Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             children: [
                              //               Container(
                              //                 margin: EdgeInsets.only(top: 3.w),
                              //                 child: Image.asset(
                              //                   'assets/images/flashcard/image3.jpg',
                              //                   height: 17.w,
                              //                   fit: BoxFit.contain,
                              //                 ),
                              //               ),
                              //               Text('Cat',
                              //                   textAlign: TextAlign.center,
                              //                   style: TextStyle(
                              //                       fontSize: height > 600
                              //                           ? 45.sp
                              //                           : 65.sp,
                              //                       color: Theme.Colors.orange900,
                              //                       fontFamily:
                              //                           'UTMCooperBlack')),
                              //             ],
                              //           ),
                              //           //hết bài học chuyển đến page animation_screen.dart
                              //         ],
                              //       ),
                              //     ),

                              //     //trường hợp câu hỏi chữ và trả lời ảnh
                              //     isShowQuestion
                              //         ? Container(
                              //             child: _buildQuestionTypeOne(context),
                              //           )
                              //         : Container(),

                              //     //trường hợp câu hỏi ảnh và trả lời chữ
                              //     (isShowQuestion)
                              //         ? Container(
                              //             // visible: isShowQuestion,
                              //             child: _buildQuestionTypeTwo(context),
                              //           )
                              //         : Container(),
                              //     isShowQuestion
                              //         ? AnimationBalloonScreen()
                              //         : Container(),
                              //   ],
                            ),
                            onSwipeUp: () {
                              // setState(() {
                              //   _swipeDirection = "Swipe Up";
                              //   _reset();
                              // });
                              playAudio();
                            },
                            onSwipeDown: () {
                              playAudio();
                              // setState(() {
                              //   _swipeDirection = "Swipe Down";
                              // });
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

class TopButton extends StatefulWidget {
  @override
  _TopButtonState createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
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

class FlashCard {
  String id;
  String content;
  int language;
  int sizeContent;
  int contentPosition;
  String colorContent;
  int animationContent;
  String highlightColor;
  String sourceAudio;
  String sourceImage;
  int type;
  List resource;
  List letterResources;
  double height;
  double width;
  AnimationController controller;
  Tween<double> tween;
  FlickManager flickManager;
  FlashCard({
    this.id,
    this.content,
    this.language,
    this.sizeContent,
    this.contentPosition,
    this.colorContent,
    this.animationContent,
    this.highlightColor,
    this.type,
    this.resource,
    this.letterResources,
    this.sourceAudio,
    this.sourceImage,
    //style
    this.height,
    this.width,
    this.controller,
    this.tween,
    this.flickManager,
  });
  //trường hợp chữ tiêu đề
  // cardTitle() {
  //   return Container(
  //     alignment: Alignment.center,
  //     margin: EdgeInsets.all(8.5.w),
  //     child: Text("Common Animals",
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //             fontSize: height > 600 ? 80.sp : 140.sp,
  //             // fontWeight: FontWeight.w900,
  //             color: Theme.Colors.orange900,
  //             fontFamily: 'UTMCooperBlack')),
  //   );
  // }
  cardTitle() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(8.5.w),
        child: GestureDetector(
          child: Text('Common Animals',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: height > 600 ? 80.sp : 140.sp,
                  // fontWeight: FontWeight.w900,
                  color: Theme.Colors.orange900,
                  fontFamily: 'UTMCooperBlack')),
          onTap: () async {
            _FlashCardScreen().playAudio();
          },
        ));
  }

  //trường hợp ảnh full
  cardImageFull() {
    return Center(
      child: Image.asset(
        'assets/images/flashcard/image1.jpg',
        fit: BoxFit.contain,
      ),
    );
  }

  // trường hợp chữ ngắn
  cardShortText() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.5.w),
      child: Text('Cat And Dog',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: height > 600 ? 70.sp : 100.sp,
              // fontWeight: FontWeight.w900,
              color: Theme.Colors.orange900,
              fontFamily: 'UTMCooperBlack')),
    );
  }

  //trường hợp click từng hình để nghe
  cardClickEachImage() {
    return Container(
        margin: EdgeInsets.all(8.5.w),
        child: Column(
          children: [
            Text('Click Vào Từng Hình Để Nghe Cách Đọc',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: height > 600 ? 25.sp : 35.sp,
                    // fontWeight: FontWeight.w900,
                    color: Theme.Colors.orange900,
                    fontFamily: 'UTMCooperBlack')),
            SizedBox(
              height: 20.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
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
        ));
  }

  //trường hợp chỉ sử dụng cho text ít chữ
  cardFewText() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.5.w),
      child: ScaleTransition(
        scale: tween.animate(
            CurvedAnimation(parent: controller, curve: Curves.elasticOut)),
        child: SizedBox(
          child: Text('Cat',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: height > 600 ? 35.sp : 75.sp,
                  // fontWeight: FontWeight.w900,
                  color: Theme.Colors.orange900,
                  fontFamily: 'UTMCooperBlack')),
        ),
      ),
    );
  }

  //trường hợp video
  cardVideo() {
    return Container(
      height: 1.sh,
      // width: 1.sw,
      color: Colors.black,
      child: ClipRRect(
        child: Center(
          child: FlickVideoPlayer(
            flickVideoWithControls: FlickVideoWithControls(
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
    );
  }

  //trường hợp câu có ảnh nhỏ

  cardSentence() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.5.w),
      child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('I',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: height > 600 ? 70.sp : 100.sp,
                        color: Theme.Colors.orange900,
                        fontFamily: 'UTMCooperBlack')),
              ],
            ),
            SizedBox(width: 5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Love',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: height > 600 ? 70.sp : 100.sp,
                        color: Theme.Colors.orange900,
                        fontFamily: 'UTMCooperBlack')),
              ],
            ),
            SizedBox(width: 5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('My',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: height > 600 ? 70.sp : 100.sp,
                        color: Theme.Colors.orange900,
                        fontFamily: 'UTMCooperBlack')),
              ],
            ),
            SizedBox(width: 5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Little',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: height > 600 ? 70.sp : 100.sp,
                        color: Theme.Colors.orange900,
                        fontFamily: 'UTMCooperBlack')),
              ],
            ),
            SizedBox(width: 5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        fontSize: height > 600 ? 45.sp : 65.sp,
                        color: Theme.Colors.orange900,
                        fontFamily: 'UTMCooperBlack')),
              ],
            ),
          ]),
    );
  }

  cardSubSentence() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('I',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: height > 600 ? 70.sp : 100.sp,
                color: Theme.Colors.orange900,
                fontFamily: 'UTMCooperBlack')),
      ],
    );
  }

  cardSubSentenceWithImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
                fontSize: height > 600 ? 45.sp : 65.sp,
                color: Theme.Colors.orange900,
                fontFamily: 'UTMCooperBlack')),
      ],
    );
  }
  // hết trường hợp có lồng ảnh nhỏ
}
