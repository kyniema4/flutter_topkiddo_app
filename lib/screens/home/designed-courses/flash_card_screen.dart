import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:topkiddo/screens/home/designed-courses/flashcard_store.dart';
import 'package:video_player/video_player.dart';

import 'package:topkiddo/Utils/download_data.dart';
import 'package:topkiddo/Utils/http_service.dart';

import 'dart:async';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../../components/languages_app.dart';
import '../../../components/swipe-configuration.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
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
  //bool isShowTopButton = true;
  //bool isShowQuestion = false;
  int number = 0;
  int _lastReportedPage = 0;
  int previousPage = 0;
  ScrollController s;
  AnimationController animationController;
  Animation animation;
  PageController _pageController =
      PageController(viewportFraction: 1, keepPage: true);
  int currentPage = 0;
  Tween<double> tween = Tween(begin: 1.5, end: 5);
  //Tween<double> _tween = Tween(begin: 1.5, end: 5);
  FlickManager flickManager;

  List listFlashCard = [];
  HandleDownload download = HandleDownload();
  String idAudio = "";
  final FlashCardStore store = FlashCardStore();

  checkBeforeCreateFlashCard() async {
    //mới học lần đầu
    if (true) {
      List tempList = [];
      var flashCard = FlashCard();
      flashCard.height = MediaQuery.of(context).size.height;
      Map<String, dynamic> oneFlashCard = {
        'data': flashCard,
        'widget': flashCard.cardMultisensory()
      };
      tempList.add(oneFlashCard);
      store.setListFlashCard(tempList);

      createFlashCard();
    }
  }

  //check part and add data
  createFlashCard() async {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Map data = widget.lessonDetail;
    List tempList = [...store.listFlashCard];
    if (data != null) {
      List listPart = data['part'];
      if (listPart.length > 0) {
        await Future.forEach(listPart, (part) async {
          List listContent = part['content'];
          //lấy content của topic
          if (part['topic'] != null) {
            try {
              var result = await dealerWidget(part);
              print('debugging');
              tempList.addAll(result);
            } catch (e) {
              print(e);
            }
          }
          // lấy content trong topic
          if (listContent.length > 0) {
            await Future.forEach(listContent, (content) async {
              try {
                var result = await dealerWidget(content);
                if (result != null) {
                  tempList.addAll(result);
                }
              } catch (e) {
                print(e);
                return;
              }
            });
            // for (var i = 0; i < 2; i++) {
            //   var result = await dealerWidget(listContent[i]);
            //   tempList.addAll(result);
            // }

          }
        });
      }
    } else {
      //fetch data;
    }
    _pageController.jumpToPage(currentPage);
    store.setListFlashCard(tempList);
  }

  Future dealerWidget(Map data) async {
    List tempList = [];
    Map<String, dynamic> oneFlashCard;
    var flashCard = FlashCard();
    flashCard = FlashCard.fromJson(Map<String, dynamic>.from(data));
    flashCard.height = MediaQuery.of(context).size.height;
    flashCard.lessonId = widget.lessonDetail['_id'];
    flashCard.animation = animation;
    flashCard.animationController = animationController;
    List listResource = flashCard.resource;
    List listLetterResource = flashCard.letterResources;
    //List listOutSideResource=flashCard.letterResources;
    print('debugging');
    //trường hợp title có hoặc k có ảnh, âm thanh
    if (data['topic'] != null) {
      flashCard.sourceAudio = data['audio'] != null
          ? {
              '_id': data['audio']['_id'] ?? "",
              'localPath': data['audio']['localPath'] ?? ""
            }
          : {};

      tempList.add(oneFlashCard = {
        'data': flashCard,
        'widget': flashCard.cardTitle(context)
      });
      flashCard.sourceImage = data['image'] != null
          ? {
              '_id': data['image']['_id'] ?? "",
              'localPath': data['image']['localPath'] ?? ""
            }
          : {};
      data['image'] != null
          ? tempList.add(oneFlashCard = {
              'data': flashCard,
              'widget': flashCard.cardImageFull(
                  pathImg: await getPathImage(flashCard.sourceImage))
            })
          : tempList;
      return tempList;
    }
    // trương hợp chữ ngắn
    if (data['type'] == 1 &&
        listResource.length >= 0 &&
        listResource.length < 2) {
      for (var item in listResource) {
        print(data['content']);
        bool check = data['content'].contains(' ');

        if (item["type"] == 2 && check) {
          flashCard.sourceAudio = {
            '_id': item['_id'] ?? "",
            'localPath': item['localPath'] ?? ""
          };
          oneFlashCard = {
            'data': flashCard,
            'widget': flashCard.cardShortText()
          };
          tempList.add(oneFlashCard);
          return tempList;
        }
        if (item["type"] == 2 && !check) {
          flashCard.sourceAudio = {
            '_id': item['_id'] ?? "",
            'localPath': item['localPath'] ?? ""
          };
          oneFlashCard = {'data': flashCard, 'widget': flashCard.cardFewText()};
          tempList.add(oneFlashCard);
          return tempList;
        }
      }
    }
    // trường hợp click vào từng hình để nghe
    if (data['type'] == 3 && listLetterResource.length > 0) {
      List listPathImage = [];
      List listPathAudio = [];

      for (var i in listLetterResource) {
        var type = i['resources'][0]['type'];
        if (type == 1) {
          Map sourceImage = {
            '_id': i['resources'][0]['_id'],
            'localPath': i['resources'][0]['localPath']
          };
          var pathImage = await getPathImage(sourceImage);
          listPathImage.add(pathImage);
        }
        if (type == 2) {
          Map sourceAudio = {
            '_id': i['resources'][0]['_id'],
            'localPath': i['resources'][0]['localPath']
          };
          listPathAudio.add(sourceAudio);
        }
      }
      oneFlashCard = {
        'data': flashCard,
        'widget': flashCard.cardClickEachImage(
            pathImg1: listPathImage[0] ?? "",
            pathImg2: listPathImage[1] ?? "",
            pathSound1: listPathAudio[0] ?? "",
            pathSound2: listPathAudio[1] ?? "")
      };
      tempList.add(oneFlashCard);
      return tempList;
    }
    //trương hợp image full
    if (data['type'] == 1 &&
        listResource.length > 0 &&
        listResource.length < 3 &&
        listResource[0]['type'] < 3) {
      for (var item in listResource) {
        if (item["type"] == 1) {
          flashCard.sourceImage = {
            '_id': item['_id'] ?? "",
            'localPath': item['localPath'] ?? ""
          };
        }
        if (item["type"] == 2) {
          flashCard.sourceAudio = {
            '_id': item['_id'] ?? "",
            'localPath': item['localPath'] ?? ""
          };
        }
      }
      oneFlashCard = {
        'data': flashCard,
        'widget': flashCard.cardImageFull(
            pathImg: await getPathImage(flashCard.sourceImage))
      };
      tempList.add(oneFlashCard);

      return tempList;
    }
    //trường hợp video
    if (data['type'] == 1 && listResource[0]['type'] >= 3) {
      print('debugging');
      oneFlashCard = {'data': flashCard, 'widget': flashCard.cardVideo()};
      tempList.add(oneFlashCard);
      return tempList;
    }
    //trường hợp câu lồng ảnh nhỏ
    if (data['type'] == 2 &&
        listResource.length > 0 &&
        listLetterResource.length > 0) {
      //flashcard image và audio
      if (data['timeFrame'] != null) {
        flashCard.timeFrame = jsonDecode(data['timeFrame']);
      }
      for (var item in listResource) {
        if (item["type"] == 1) {
          flashCard.sourceImage = {
            '_id': item['_id'] ?? "",
            'localPath': item['localPath'] ?? ""
          };
        }
        if (item["type"] == 2) {
          flashCard.sourceAudio = {
            '_id': item['_id'] ?? "",
            'localPath': item['localPath'] ?? ""
          };
        }
      }
      oneFlashCard = {
        'data': flashCard,
        'widget': flashCard.cardImageFull(
            pathImg: await getPathImage(flashCard.sourceImage))
      };
      tempList.add(oneFlashCard);
      //thêm chữ

      List<Widget> listSubSentence = [];

      for (var item in listLetterResource) {
        if (item['resources'].length == 1) {
          Map letterAudio = {
            '_id': item['resources'][0]['_id'] ?? "",
            'localPath': item['resources'][0]['localPath'] ?? ""
          };
          var subSentence = flashCard.cardSubSentence(
              text: item['letter'], pathSound: letterAudio);
          listSubSentence.addAll(subSentence);
        }
        if (item['resources'].length < 1) {
          print('debugging');
          // checkAudioLetter(item['letter']);
          // Map letterAudio = {
          //   '_id': item['_id'] ?? "",
          //   'localPath': item['resources'][0]['localPath'] ?? ""
          // };
          var subSentence = flashCard.cardSubSentence(text: item['letter']);
          listSubSentence.addAll(subSentence);
        }
        if (item['resources'].length >= 2) {
          var sourceImage = item['resources'].where((e) => e['type'] == 1);
          var sourceAudio = item['resources'].where((e) => e['type'] == 2);
          Map letterImage = {
            '_id': sourceImage.single['_id'] ?? "",
            'localPath': sourceImage.single['localPath'] ?? ""
          };
          Map letterAudio = {
            '_id': sourceAudio.single['_id'] ?? "",
            'localPath': sourceAudio.single['localPath'] ?? "",
          };
          var subSentence = flashCard.cardSubSentence(
            text: item['letter'],
            isImage: true,
            pathSound: letterAudio,
            pathImage: await getPathImage(letterImage),
          );
          listSubSentence.addAll(subSentence);
        }
      }
      print(listSubSentence);
      oneFlashCard = {
        'data': flashCard,
        'widget': flashCard.cardSentence(listSubSentence)
      };
      print(flashCard.timeFrame);
      print('debugging');
      tempList.add(oneFlashCard);
      return tempList;
    }
  }

  // checkAudioLetter(String letter) async {
  //   //let sound = await fetch('https://www.dictionaryapi.com/api/v3/references/collegiate/json/' + letter.letter.toLowerCase() + '?key=' + this.keyId).then(json => {
  //   String soundPath = await fetchAudioLetter(letter);
  //   print('debugging');
  // }

  playAudioTest(
      String lessonId, Map sourceAudio, List timeFrame, String letter) async {
    // print('tap here');
    // //https://media.merriam-webster.com/soundc11/i/i0000001.wav
    // String path = "https://media.merriam-webster.com/soundc11/i/i0000001.wav";
    // audioPlayer.play(path);
    // print(timeFrame);
    // print('debugging');
    print(timeFrame);
    AudioPlayer audioPlayer = AudioPlayer();
    var typeFile = sourceAudio['localPath']
        .substring(sourceAudio['localPath'].indexOf('.'));
    String subPath = "/$lessonId/${sourceAudio['_id']}$typeFile";

    var path = await download.getFileFromLocal(subPath);
    audioPlayer.seek(Duration(milliseconds: 1734));
    audioPlayer.play(path, isLocal: true);
    await Future.delayed(Duration(milliseconds: 571), () {
      audioPlayer.stop();
    });
  }

  playAudio(sourceAudio) async {
    String lessonId = widget.lessonDetail['_id'];
    print('debugging');
    if (sourceAudio != null) {
      var typeFile = sourceAudio['localPath']
          .substring(sourceAudio['localPath'].indexOf('.'));
      String subPath = "/$lessonId/${sourceAudio['_id']}$typeFile";
      var path = await download.getFileFromLocal(subPath);
      //var result = await audioPlayer.play(path, isLocal: true);
    } else
      return;
    // print(sourceAudio);
    // try {
    //   var result = await audioPlayer.play(
    //       "/data/user/0/com.example.topkiddo/app_flutter/60b7862add38fc1918816a24/60b84655dd38fc1918818b0b.mp3",
    //       isLocal: true);
    //   print('debugging');
    // } catch (e) {
    //   print(e);
    // }
  }

  getPathImage(sourceImage) async {
    String lessonId = widget.lessonDetail['_id'];
    if (sourceImage is Map && sourceImage != null) {
      var typeFile = sourceImage['localPath']
          .substring(sourceImage['localPath'].indexOf('.'));
      String subPath = "/$lessonId/${sourceImage['_id']}$typeFile";
      var path = await download.getFileFromLocal(subPath);
      return path;
    } else
      return;
  }

  test() {
    animationController.repeat();
  }

  VideoPlayerController _controllerVideo;
  Future<void> _initializeVideoPlayerFuture;

  void initState() {
    super.initState();
    s = PageController();
    // animationController = AnimationController(
    //     duration: const Duration(milliseconds: 700), vsync: this);
    // flickManager = FlickManager(
    //   videoPlayerController: VideoPlayerController.network(
    //       "http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4"),
    // );
    animationController = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    animation = tween.animate(
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut));
  }

  callAnimation() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    // animation = tween.animate(
    //     CurvedAnimation(parent: animationController, curve: Curves.elasticOut))
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // createFlashCard();
    checkBeforeCreateFlashCard();
    _controllerVideo = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _controllerVideo.initialize();

    _controllerVideo.setLooping(true);
  }

  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    previousPage = page;
    store.setPageViewChange(page);
    print(store.pageCurrent);
    print('debugging');
    store.setSourceAudio();
    List dataFlashCard = [...store.listFlashCard.map((e) => e['data'])];
    List dataWidget = [...store.listFlashCard.map((e) => e['widget'])];
    FlashCard data = dataFlashCard[page];
    Widget getWidget = dataWidget[page];

    print('debugging');
    animationController.forward().then((value) {
      animationController.reverse();
    });
    // tween = Tween(begin: 1.5, end: 1.8);
    // animationController = AnimationController(
    //     duration: const Duration(milliseconds: 700), vsync: this);
    // animation = tween.animate(
    //     CurvedAnimation(parent: animationController, curve: Curves.elasticOut));

    print(data.sourceAudio);
    if (data != null) {
      playAudio(data.sourceAudio);
    }
    // setState(() {
    //   number = page;
    //   // nếu page number = 0 hoặc
    //   // kết thúc bài học chuyển sang phần câu hỏi thì mất bảng trắng
    //   if (page == 0 || page > 8) {
    //     isShowQuestion = true;
    //   } else {
    //     isShowQuestion = false;
    //   }

    //   if (page == 7) {
    //     _controllerVideo.play();
    //   } else {
    //     _controllerVideo.pause();
    //   }
    // });
  }

  reset() {
    print("Previous page: $number");
    animationController.repeat();
    // _controller.forward();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    animationController.repeat(reverse: false);
    animationController.dispose();
    //flickManager.dispose();
    _controllerVideo.dispose();
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    print('rebuild');
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
            Observer(
              name: 'flashCard',
              builder: (_) => Container(
                  width: width,
                  height: height,
                  decoration: blackBackground,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: store.isShowQuestion
                              ? (height > 600 ? 0.85.sh : null)
                              : 165.w,
                          width: store.isShowQuestion ? 0.9.sw : 321.w,
                          // khi đến phần câu hỏi thì bỏ bảng trắng
                          decoration: store.isShowQuestion
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
                                  children: store.listWidget != null
                                      ? [...store.listWidget]
                                      : []),
                              // children: [
                              //   GestureDetector(
                              //     child: Container(
                              //       alignment: Alignment.center,
                              //       margin: EdgeInsets.all(8.5.w),
                              //       child: ScaleTransition(
                              //         scale: animationController,
                              //         child: SizedBox(
                              //           child: Text('Cat',
                              //               textAlign: TextAlign.center,
                              //               style: TextStyle(
                              //                   fontSize: height > 600
                              //                       ? 35.sp
                              //                       : 75.sp,
                              //                   // fontWeight: FontWeight.w900,
                              //                   color:
                              //                       Theme.Colors.orange900,
                              //                   fontFamily:
                              //                       'UTMCooperBlack')),
                              //         ),
                              //       ),
                              //     ),
                              //     onTap: () {

                              //       animationController
                              //           .forward()
                              //           .then((value) {
                              //         animationController.reverse();
                              //       });
                              //     },
                              //   ),
                              // ]),
                              onSwipeUp: () {
                                setState(() {
                                  _swipeDirection = "Swipe Up";
                                  reset();
                                });
                                //playAudio();
                              },
                              onSwipeDown: () {
                                // playAudio();
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
                      true ? TopButton() : Container(),
                    ],
                  )),
            ),
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
  final FlashCardStore store = FlashCardStore();
  String id;
  String lessonId;
  String content;
  int language;
  int sizeContent;
  int contentPosition;
  String colorContent;
  int animationContent;
  String highlightColor;
  List timeFrame;
  Map sourceAudio;
  Map sourceImage;
  int type;
  List resource;
  List letterResources;
  double height;
  Widget widget;
  // double width;
  Tween<double> tween;
  AnimationController animationController;
  Animation animation;
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
      this.timeFrame,
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
  //multisensory cho người mới bắt đầu
  cardMultisensory() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Multisensory',
              style: TextStyle(
                  fontSize: height > 600 ? 80.sp : 120.sp,
                  color: Colors.white,
                  fontFamily: 'UTMCooperBlack')),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 60.w,
                height: 35.w,
                child: Image.asset(
                  'assets/images/lesson/hand/swipt-arrow.png',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 0,
                bottom: -16.w,
                child: Container(
                  height: 35.w,
                  child: Image.asset(
                    'assets/images/lesson/hand/hand-click1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 6.w,
          )
        ],
      ),
    );
  }

  //trường hợp chữ tiêu đề
  Widget cardTitle(BuildContext context,
      {pathAudio, pathImg, isShowHand: true}) {
    //final store = Provider.of<FlashCardStore>(context);
    return Observer(
        name: 'cardTittle',
        builder: (_) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(8.5.w),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  child: Text(content,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.2,
                          fontSize: height > 600 ? 80.sp : 140.sp,
                          // fontWeight: FontWeight.w900,
                          color: Theme.Colors.orange900,
                          fontFamily: 'UTMCooperBlack')),
                ),

                //mũi tên phía trái
                isShowHand
                    ? Positioned(
                        left: 10.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 50.w,
                              height: 28.w,
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: Image.asset(
                                  'assets/images/lesson/hand/swipt-arrow.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10.w,
                              top: 9.w,
                              // bottom: -12.w,
                              child: Text('Previous',
                                  style: TextStyle(
                                      fontSize: height > 600 ? 21.sp : 25.sp,
                                      color: Theme.Colors.yellow300,
                                      fontFamily: 'UTMCooperBlack')),
                            ),
                            Positioned(
                              left: 0,
                              bottom: -12.w,
                              child: Container(
                                height: 25.w,
                                child: Image.asset(
                                  'assets/images/lesson/hand/hand-click1.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),

                //mũi tên ở giữa
                isShowHand
                    ? Positioned(
                        top: height > 600 ? 30.w : 0.25.sh,
                        // bottom: 0,
                        // bottom: -30.w,
                        // left: 10.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            RotatedBox(
                              quarterTurns: -1,
                              child: Container(
                                width: 40.w,
                                height: 28.w,
                                child: Image.asset(
                                  'assets/images/lesson/hand/swipt-arrow.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 11.w,
                              top: 6.w,
                              // bottom: -12.w,
                              child: RotatedBox(
                                quarterTurns: -1,
                                child: Text('Repeat',
                                    style: TextStyle(
                                        fontSize: height > 600 ? 21.sp : 25.sp,
                                        color: Theme.Colors.yellow300,
                                        fontFamily: 'UTMCooperBlack')),
                              ),
                            ),
                            Positioned(
                                right: -30,
                                top: 0,
                                child: RotatedBox(
                                  quarterTurns: -1,
                                  child: Container(
                                    height: 25.w,
                                    child: Image.asset(
                                      'assets/images/lesson/hand/hand-click1.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )
                    : Container(),

                //mũi tên phía phải
                isShowHand
                    ? Positioned(
                        right: 10.w,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 50.w,
                              height: 28.w,
                              child: Image.asset(
                                'assets/images/lesson/hand/swipt-arrow.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 15.w,
                              top: 9.w,
                              // bottom: -12.w,
                              child: Text('Next',
                                  style: TextStyle(
                                      fontSize: height > 600 ? 21.sp : 25.sp,
                                      color: Theme.Colors.yellow300,
                                      fontFamily: 'UTMCooperBlack')),
                            ),
                            Positioned(
                              right: 0,
                              bottom: -12.w,
                              child: Container(
                                height: 25.w,
                                child: Image.asset(
                                  'assets/images/lesson/hand/hand-click1.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        });
  }

  //trường hợp ảnh full
  cardImageFull({pathImg: ''}) {
    // var newPath = _FlashCardScreen().getPathImage(lessonId, sourceImage);
    // pathImg = newPath;
    return GestureDetector(
      child: Center(
          child: pathImg != null
              ? Image(
                  image: FileImage(File(pathImg)),
                  fit: BoxFit.contain,
                )
              : Image.asset(
                  'assets/images/flashcard/image1.jpg',
                  fit: BoxFit.contain,
                )),
      onTap: () async {
        print('tap image full');
      },
    );
  }

  // trường hợp chữ ngắn
  cardShortText() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.5.w),
      child: Text(content ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: height > 600 ? 70.sp : 100.sp,
              // fontWeight: FontWeight.w900,
              color: Color(int.parse(colorContent.replaceAll('#', '0xff'))) ??
                  Theme.Colors.orange900,
              fontFamily: 'UTMCooperBlack')),
    );
  }

  //trường hợp click từng hình để nghe
  cardClickEachImage(
      {pathImg1: '', pathImg2: '', pathSound1: '', pathSound2: ''}) {
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
                GestureDetector(
                  child: pathImg1 != null
                      ? Image(
                          image: FileImage(File(pathImg1)),
                          fit: BoxFit.contain,
                          height: 70.w,
                        )
                      : Image.asset('assets/images/flashcard/image4.jpg',
                          fit: BoxFit.contain, height: 70.w),
                  onTap: () async {
                    print(pathSound1);
                  },
                ),
                GestureDetector(
                  child: pathImg2 != null
                      ? Image(
                          image: FileImage(File(pathImg2)),
                          fit: BoxFit.contain,
                          height: 70.w)
                      : Image.asset('assets/images/flashcard/image6.jpg',
                          fit: BoxFit.contain, height: 70.w),
                  onTap: () async {
                    print(pathSound2);
                  },
                ),
              ],
            )
          ],
        ));
  }

  //trường hợp chỉ sử dụng cho text ít chữ
  cardFewText() {
    //  cardFewText({Animation animation, AnimationController controller}) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(8.5.w),
        child: ScaleTransition(
          // scale: _FlashCardScreen().tween.animate(CurvedAnimation(
          //     parent: _FlashCardScreen().controller, curve: Curves.elasticOut)),
          scale: animation,
          child: SizedBox(
            child: Text(content ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: height > 600 ? 35.sp : 75.sp,
                    // fontWeight: FontWeight.w900,
                    color: Color(
                            int.parse(colorContent.replaceAll('#', '0xff'))) ??
                        Theme.Colors.orange900,
                    //Theme.Colors.orange900,

                    fontFamily: 'UTMCooperBlack')),
          ),
        ),
      ),
      onTap: () async {
        // animationController.repeat();
        // _FlashCardScreen().test();
      },
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
          child: FutureBuilder(
            future: _FlashCardScreen()._initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                return AspectRatio(
                  aspectRatio:
                      _FlashCardScreen()._controllerVideo.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  child: VideoPlayer(_FlashCardScreen()._controllerVideo),
                );
              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  //trường hợp câu có ảnh nhỏ

  cardSentence(List listSubsentence) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.5.w),
      child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: listSubsentence ?? []),
    );
  }

  cardSubSentence({text: "", pathSound: "", isImage: false, pathImage: ""}) {
    return [
      GestureDetector(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: isImage
                ? [
                    Container(
                      margin: EdgeInsets.only(top: 3.w),
                      child: Image(
                        image: FileImage(File(pathImage)),
                        fit: BoxFit.contain,
                        height: 17.w,
                      ),
                    ),
                    Text(text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: height > 600 ? 45.sp : 65.sp,
                            color: Color(int.parse(
                                    colorContent.replaceAll('#', '0xff'))) ??
                                Theme.Colors.orange900,
                            fontFamily: 'UTMCooperBlack'))
                  ]
                : [
                    AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 10000),
                        curve: Curves.bounceInOut,
                        style: TextStyle(
                          fontSize: height > 600 ? 140.sp : 200.sp,
                          color: Theme.Colors.red100,
                          fontWeight: FontWeight.bold,
                        ),
                        child: Text(text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height > 600 ? 70.sp : 100.sp,
                                color: Color(int.parse(colorContent.replaceAll(
                                        '#', '0xff'))) ??
                                    Theme.Colors.orange900,
                                fontFamily: 'UTMCooperBlack'))),
                  ]),
        onTap: () async {
          await _FlashCardScreen()
              .playAudioTest(lessonId, sourceAudio, timeFrame, text);
        },
      ),
      SizedBox(width: 5.w),
    ];
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
      // sourceImage: {
      //   '_id': parsedJson['image']['_id'] ?? "",
      //   'localPath': parsedJson['image']['localPath'] ?? ""
      // },
      // sourceAudio: {
      //   '_id': parsedJson['audio']['_id'] ?? "",
      //   'localPath': parsedJson['audio']['localPath'] ?? ""
      // },
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

  // String toString() => sourceImage['_id'];
}
