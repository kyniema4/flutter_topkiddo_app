import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import 'package:topkiddo/Utils/download_data.dart';
import 'package:topkiddo/Utils/http_service.dart';

import '../../../components/languages_app.dart';
import '../../../components/swipe-configuration.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../home/home_screen.dart';
import './animation_balloon_screen.dart';

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
  int number = 5;
  int _lastReportedPage = 0;
  int previousPage = 0;
  ScrollController s;
  AnimationController _controller;
  PageController _pageController =
      PageController(viewportFraction: 1, keepPage: true);
  int currentPage = 0;
  Tween<double> _tween = Tween(begin: 1.5, end: 1.8);
  FlickManager flickManager;
  AudioPlayer audioPlayer = AudioPlayer();
  List listFlashCard = [];
  List<Widget> listWidget = [];
  HandleDownload download = HandleDownload();
  String idAudio = "";
//content-audio =>image-audio

  playAudio() async {
    try {
      var result = await audioPlayer.play(
          "/data/user/0/com.example.topkiddo/app_flutter/60b7862add38fc1918816a24/60b84655dd38fc1918818b0b.mp3",
          isLocal: true);
      print('debugging');
    } catch (e) {
      print(e);
    }
  }

  getPathImage(String lessonId, sourceImage) async {
    if (sourceImage != null) {
      var typeFile = sourceImage['localPath']
          .substring(sourceImage['localPath'].indexOf('.'));
      String subPath = "/$lessonId/${sourceImage['_id']}$typeFile";
      var path = await download.getFileFromLocal(subPath);

      return path;
    }
  }

  //check part and add data
  createFlashCard() async {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Map data = widget.lessonDetail;
    List tempList = [];

    if (data.isNotEmpty) {
      List listPart = data['part'];
      if (listPart.length > 0) {
        await Future.forEach(listPart, (part) async {
          List listContent = part['content'];
          //lấy content của topic
          if (part['topic'] != null) {
            try {
              var result = await dealerWidget(part);
              tempList.addAll(result);
            } catch (e) {
              print(e);
            }
          }
          //lấy content trong topic
          // if (listContent.length > 0) {
          //   try {
          //     await Future.forEach(listContent, (content) async {
                 
          //       var result = await dealerWidget(content);
          //       tempList.addAll(result);
          //     });
          //     // for (var i = 0; i < 2; i++) {
          //     //   var result = await dealerWidget(listContent[i]);
          //     //   tempList.addAll(result);
          //     // }
          //   } catch (e) {
          //     print(e);
          //   }
          // }
        });
      }
    } else {
      //fetch data;
    }

    // print(tempList);
    // //build widget
    // List tempListWidget = [];
    // for (var item in tempList) {
    //   if (item < 10) {
    //     tempListWidget.add(item.widget);
    //   }
    // }
    setState(() {
      listFlashCard = [...tempList];
    });
    _pageController.jumpToPage(currentPage);
  }

  dealerWidget(Map data) async {
    List tempList = [];
    Map<String, dynamic> oneFlashCard;

    var flashCard = FlashCard.fromJson(Map<String, dynamic>.from(data));
    flashCard.height = MediaQuery.of(context).size.height;
    flashCard.lessonId = widget.lessonDetail['_id'];
    List listResource = flashCard.resource;
    List listLetterResource = flashCard.letterResources;
    
    //trường hợp title có hoặc k có ảnh
    if (data['topic'] != null) {
      tempList.add(
          oneFlashCard = {'data': flashCard, 'widget': flashCard.cardTitle()});

      data['image'].isNotEmpty
          ? tempList.add(oneFlashCard = {
              'data': flashCard,
              'widget': flashCard.cardImageFull(
                  pathImg: await getPathImage(
                      flashCard.lessonId, flashCard.sourceImage))
            })
          : tempList;
      return tempList;
    }
    //trường hợp chữ ngắn
    if (listResource.length > 0 && listResource.length <= 1) {
      if (listResource.where((e) => (e["type"] == 2)).isNotEmpty) {
        oneFlashCard = {'data': flashCard, 'widget': flashCard.cardShortText()};
        tempList.add(oneFlashCard);
        return tempList;
      }
    }
    //add 2 widget CardTittle and ImageFull
    // if (listResource.length > 0 &&
    //     listResource.length <= 2 &&
    //     listLetterResource.length == 0) {
    //   if (listResource.where((e) => (e["type"] == 1)).isNotEmpty) {
    //     oneFlashCard = {'data': flashCard, 'widget': flashCard.cardTitle()};
    //     tempList.add(oneFlashCard);
    //   }
    //   if (listResource.where((e) => (e["type"] == 2)).isNotEmpty) {
    //     oneFlashCard = {'data': flashCard, 'widget': flashCard.cardImageFull()};
    //     tempList.add(oneFlashCard);
    //   }
    // }
    return tempList;
  }

  checkType(int type) {}
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
                                controller: _pageController,
                                physics: BouncingScrollPhysics(),
                                onPageChanged: _onPageViewChange,
                                children: listFlashCard != null
                                    ? [...listFlashCard.map((e) => e['widget'])]
                                    : []
                                //listFlashCard,
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
  String lessonId;
  String content;
  int language;
  int sizeContent;
  int contentPosition;
  String colorContent;
  int animationContent;
  String highlightColor;
  Map sourceAudio;
  Map sourceImage;
  int type;
  List resource;
  List letterResources;
  double height;
  Widget widget;
  // double width;
  // AnimationController controller;
  // Tween<double> tween;
  // FlickManager flickManager;

  FlashCard(
      {this.id,
      this.lessonId,
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
      this.height,
      this.widget});
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

  cardTitle({pathAudio, pathImg}) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(8.5.w),
        child: GestureDetector(
          child: Text(content,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: height > 600 ? 80.sp : 140.sp,
                  // fontWeight: FontWeight.w900,
                  color: Theme.Colors.orange900,
                  fontFamily: 'UTMCooperBlack')),
          onTap: () async {
            print('this is id: ' + id);
            // _FlashCardScreen().playAudio();
          },
        ));
  }

  //trường hợp ảnh full
  cardImageFull({pathImg}) {
    // var newPath = _FlashCardScreen().getPathImage(lessonId, sourceImage);
    // pathImg = newPath;
    return Center(
        child: pathImg.isNotEmpty
            ? Image(
                image: FileImage(File(pathImg)),
                fit: BoxFit.contain,
              )
            : Image.asset(
                'assets/images/flashcard/image1.jpg',
                fit: BoxFit.contain,
              ));
  }

  // trường hợp chữ ngắn
  cardShortText({text: 'Cat and Dog'}) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.5.w),
      child: Text(content,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: height > 600 ? 70.sp : 100.sp,
              // fontWeight: FontWeight.w900,
              color: Theme.Colors.orange900,
              fontFamily: 'UTMCooperBlack')),
    );
  }

  //trường hợp click từng hình để nghe
  cardClickEachImage(
      {pathImg1: 'assets/images/flashcard/image4.jpg',
      pathImg2: 'assets/images/flashcard/image6.jpg'}) {
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
                  pathImg1,
                  fit: BoxFit.contain,
                  height: 70.w,
                ),
                Image.asset(
                  pathImg2,
                  fit: BoxFit.contain,
                  height: 70.w,
                ),
              ],
            )
          ],
        ));
  }

  //trường hợp chỉ sử dụng cho text ít chữ
  cardFewText({tween, controller, text}) {
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
  cardVideo({flickManager}) {
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

  cardSubSentence({text}) {
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

  cardSubSentenceWithImage({pathImg, text}) {
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

  factory FlashCard.fromJson(Map<String, dynamic> parsedJson) {
    return FlashCard(
      id: parsedJson['_id'] ?? '',
      content: parsedJson['topic'] ?? parsedJson['content'] ?? '',
      language: parsedJson['language'] ?? 2,
      sizeContent: parsedJson['sizeContent'] ?? null,
      contentPosition: parsedJson['contentPosition'] ?? null,
      colorContent: parsedJson['colorContent'] ?? null,
      animationContent: parsedJson['animationContent'] ?? null,
      highlightColor: parsedJson['highlightColor'] ?? null,
      type: parsedJson['type'] ?? null,
      sourceImage: {
        '_id': parsedJson['image']['_id'] ?? "",
        'localPath': parsedJson['image']['localPath'] ?? ""
      },
      sourceAudio: {
        '_id': parsedJson['audio']['_id'] ?? "",
        'localPath': parsedJson['audio']['localPath'] ?? ""
      },
      // sourceImage: parsedJson['resources']['type'] == '1'
      //     ? {
      //         '_id': parsedJson['resources']['_id'],
      //         'localPath': parsedJson['resources']['localPath']
      //       }
      //     : null
      resource: parsedJson['resources'] ?? null,
      letterResources: parsedJson['letterResources'] ?? null,
    );
  }
}
