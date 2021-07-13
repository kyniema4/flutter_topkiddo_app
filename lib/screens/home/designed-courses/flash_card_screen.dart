import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:topkiddo/Utils/hive_service.dart';
import 'package:topkiddo/components/Loading_dialog.dart';
import 'package:topkiddo/screens/home/designed-courses/design_course_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:topkiddo/Utils/download_data.dart';
import 'package:topkiddo/Utils/http_service.dart';
import 'package:http/http.dart' as http;
import 'package:topkiddo/screens/home/designed-courses/flashcard_store.dart';
import 'package:volume_control/volume_control.dart';

import '../../../components/languages_app.dart';
import '../../../components/swipe-configuration.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../home/home_screen.dart';
// import 'package:swipedetector/swipedetector.dart';

class FlashCardScreen extends StatefulWidget {
  final lessonDetail;

  FlashCardScreen({Key key, this.lessonDetail}) : super(key: key);
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
  List listFlashCard = [];
  HandleDownload download = HandleDownload();
  final FlashCardStore store = FlashCardStore();

  AudioPlayer audioPlayer = AudioPlayer();
  final HiveService hiveService = HiveService();
  String boxFlashCard = "flashCard";
  int pageInPart = 0;
  // VideoPlayerController _controllerVideo;
  // ChewieController _chewieController;
  // Future<void> _initializeVideoPlayerFuture;
  // BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();
    // store.setup();
    s = PageController();

    animationController = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    // animation = tween.animate(CurvedAnimation(parent: animationController, curve: Curves.elasticOut));
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    checkBeforeCreateFlashCard();
  }

  checkBeforeCreateFlashCard() async {
    Map fashCardIsLearning = await hiveService.getBoxesWithKey(
        hiveService.keyFlashCard, boxFlashCard);
    print('debugging');
    //mới học lần đầu check show hướng dẫn

    if (fashCardIsLearning != null &&
        fashCardIsLearning['flashCardId'] != null) {
      List listData = widget.lessonDetail['part'];
      String flashCardId = fashCardIsLearning['flashCardId'];
      int ordinalNumber = fashCardIsLearning['ordinalNumber'] ?? 0;
      //store.setShowQuestion(true);
      createFlashCard(
          idPageLearning: flashCardId, ordinalNumber: ordinalNumber);
    } else {
      print('debugging');
      if (fashCardIsLearning['showGuide'] == true) {
        List tempList = [];
        var flashCard = FlashCard();
        flashCard.height = MediaQuery.of(context).size.height;
        Map<String, dynamic> oneFlashCard = {
          'data': flashCard,
          'widget': cardMultisensory()
        };
        tempList.add(oneFlashCard);
        store.setListFlashCard(tempList);
        store.setShowQuestion(true);
      }

      createFlashCard();
    }
  }

  //check part and add data
  createFlashCard({idPageLearning: "", ordinalNumber: 0}) async {
    Map data = widget.lessonDetail;
    List tempList = [...store.listFlashCard];
    if (data != null) {
      List listPart = data['part'];

      if (data.length > 0) {
        // for (var i = partCurrent; i < numberGetPath; i++) {
        for (var i = 0; i < listPart.length; i++) {
          List listContent = listPart[i]['content'];
          //lấy content của topic
          if (listPart[i]['topic'] != null) {
            try {
              var result = await dealerWidget(listPart[i], listPart[i]['_id']);
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
                var result = await dealerWidget(content, listPart[i]['_id']);
                if (result != null) {
                  tempList.addAll(result);
                  print('debugging');
                }
              } catch (e) {
                print(e);
                return;
              }
            });
          }
        }
        // await Future.forEach(listPart, (part) async {
        //   List listContent = part['content'];
        //   //lấy content của topic
        //   if (part['topic'] != null) {
        //     try {
        //       var result = await dealerWidget(part);
        //       print('debugging');
        //       tempList.addAll(result);
        //     } catch (e) {
        //       print(e);
        //     }
        //   }
        //   // lấy content trong topic
        //   if (listContent.length > 0) {
        //     await Future.forEach(listContent, (content) async {
        //       try {
        //         var result = await dealerWidget(content);
        //         if (result != null) {
        //           tempList.addAll(result);
        //         }
        //       } catch (e) {
        //         print(e);
        //         return;
        //       }
        //     });
        //   }
        // });
      }
    } else {
      //fetch data;
    }
    print(ordinalNumber);
    print('debugging');
    //tới flashcard đã học
    int pageNumber =
        tempList.indexWhere((e) => e["data"].id == idPageLearning) ?? 0;
    _pageController
        .jumpToPage(pageNumber >= 0 ? (pageNumber + ordinalNumber) : 0);
    //_pageController.jumpToPage(90);
    print(tempList);
    print('debugging');
    store.setListFlashCard(tempList);
    await handleInitial(pageNumber + ordinalNumber);
  }

  // khởi chạy lại flashcard học dở
  handleInitial(int page) async {
    if (page >= 0) {
      Map sourceAudio = store.listDataFlashCard[page].sourceAudio;
      // List dataFlashCard = store.listDataFlashCard;
      // print('debugging');
      // await checkExistDataFuture(page, dataFlashCard);
      playAudio(sourceAudio);
      if (store.listDataFlashCard[page].timeFrame != null &&
          store.listDataFlashCard[page].isAnimation == true) {
        store.setAnimation(true);
        animationLetter(
            timeFrame: store.listDataFlashCard[page].timeFrame,
            letterResources: store.listDataFlashCard[page].letterResources);
      }
    }
    if (page < 0 && store.listDataFlashCard[0].sourceAudio != null) {
      playAudio(store.listDataFlashCard[0].sourceAudio);
    }

    List dataFlashCard = store.listDataFlashCard;
    await checkExistDataFuture(page < 0 ? 0 : page, dataFlashCard);
  }

  //chia flashcard
  Future dealerWidget(Map data, String partId) async {
    List tempList = [];
    Map<String, dynamic> oneFlashCard;
    var flashCard = FlashCard();
    flashCard = FlashCard.fromJson(Map<String, dynamic>.from(data));
    flashCard.height = MediaQuery.of(context).size.height;
    flashCard.partId = partId;
    flashCard.lessonId = widget.lessonDetail['_id'];
    flashCard.unitId = widget.lessonDetail['unit'];
    List listResource = flashCard.resources;
    List listLetterResource = flashCard.letterResources;
    //-------------------------trường hợp title có hoặc k có ảnh, âm thanh
    if (data['topic'] != null) {
      flashCard.sourceAudio = data['audio'] != null
          ? {
              '_id': data['audio']['_id'] ?? "",
              'localPath': data['audio']['localPath'] ?? ""
            }
          : {};

      tempList.add(oneFlashCard = {
        'data': flashCard,
        'widget': cardTitle(context, flashCard)
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
              'widget': cardImageFull(
                  pathImage: await getPathImage(flashCard.sourceImage))
            })
          : tempList;
      return tempList;
    }
    //-------------------------trương hợp chữ ngắn
    if (data['type'] == 1 &&
        listResource.length >= 0 &&
        listResource.length < 2) {
      for (var item in listResource) {
        bool check = data['content'].contains(' ');

        if (item["type"] == 2 && check) {
          flashCard.sourceAudio = {
            '_id': item['_id'] ?? "",
            'localPath': item['localPath'] ?? ""
          };
          oneFlashCard = {
            'data': flashCard,
            'widget': cardShortText(flashCard)
          };
          tempList.add(oneFlashCard);
          return tempList;
        }
        if (item["type"] == 2 && !check) {
          flashCard.sourceAudio = {
            '_id': item['_id'] ?? "",
            'localPath': item['localPath'] ?? ""
          };
          oneFlashCard = {'data': flashCard, 'widget': cardFewText(flashCard)};
          tempList.add(oneFlashCard);
          return tempList;
        }
      }
    }
    //-------------------------trường hợp click vào từng hình để nghe
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
        'widget': cardClickEachImage(
            pathImg1: listPathImage[0] ?? "",
            pathImg2: listPathImage[1] ?? "",
            pathSound1: listPathAudio[0] ?? "",
            pathSound2: listPathAudio[1] ?? "")
      };
      tempList.add(oneFlashCard);
      return tempList;
    }
    //-------------------------trương hợp image full
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
        'widget':
            cardImageFull(pathImage: await getPathImage(flashCard.sourceImage))
      };
      tempList.add(oneFlashCard);

      return tempList;
    }
    //-------------------------trường hợp video
    if (data['type'] == 1 && listResource[0]['type'] >= 3) {
      flashCard.isVideo = true;
      String resourecId = listResource[0]['_id'] ?? "";
      String videoUrl = BaseUrl +
          "resources/get_resource_from_local" +
          '?token=${(await getToken())}&resourceId=${resourecId}&time=${DateTime.now().toString()}';

      oneFlashCard = {
        'data': flashCard,
        'widget': CardVideo(
          // videoPlayerController: VideoPlayerController.network(videoUrl),
          videoUrl: videoUrl,
        )
      };
      //oneFlashCard = {'data': flashCard, 'widget': cardVideo()};
      tempList.add(oneFlashCard);
      return tempList;
    }
    //----------------------------trường hợp câu lồng ảnh nhỏ
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
      FlashCard flashCardImage = flashCard.copyWith();
      flashCardImage.letterResources = null;
      oneFlashCard = {
        'data': flashCardImage,
        'widget':
            cardImageFull(pathImage: await getPathImage(flashCard.sourceImage))
      };
      tempList.add(oneFlashCard);
      //thêm chữ

      List<Widget> listSubSentence = [];

      for (var item in listLetterResource) {
        if (item['resources'].length == 1) {
          print('debugging');
          Map letterAudio = {
            '_id': item['resources'][0]['_id'] ?? "",
            'localPath': item['resources'][0]['localPath'] ?? "",
          };
          var subSentence = cardSubSentence(flashCard,
              idLetter: item['_id'],
              text: item['letter'],
              pathSound: letterAudio);
          listSubSentence.add(subSentence);
        }
        if (item['resources'].length < 1) {
          // checkAudioLetter(item['letter']);
          // Map letterAudio = {
          //   '_id': item['_id'] ?? "",
          //   'localPath': item['resources'][0]['localPath'] ?? ""
          // };
          var subSentence = cardSubSentence(flashCard,
              idLetter: item['_id'], text: item['letter']);
          listSubSentence.add(subSentence);
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
          var subSentence = cardSubSentence(
            flashCard,
            idLetter: item['_id'],
            text: item['letter'],
            isImage: true,
            pathSound: letterAudio,
            pathImage: await getPathImage(letterImage),
          );
          listSubSentence.add(subSentence);
        }
      }
      FlashCard flashCardLetter = flashCard.copyWith();
      flashCardLetter.isAnimation = true;
      flashCardLetter.resources = null;
      flashCardLetter.ordinalNumber = 1;
      oneFlashCard = {
        'data': flashCardLetter,
        'widget': cardSentence(listSubSentence)
      };
      tempList.add(oneFlashCard);
      return tempList;
    }
  }

  // lấy ảnh trong local
  getPathImage(sourceImage) async {
    String lessonId = widget.lessonDetail['_id'];
    if (sourceImage is Map && sourceImage != null) {
      var typeFile = sourceImage['localPath']
          .substring(sourceImage['localPath'].indexOf('.'));
      String subPath = "/$lessonId/${sourceImage['_id']}$typeFile";
      var path = await download.getFileFromLocal(subPath);
      if (path != null) return {"type": 1, "path": path};
      if (path == null) {
        //chưa save ảnh vào local
        // var isDownload = await download.downloadFile(sourceImage, lessonId);
        // if (isDownload)
        //   return await download.getFileFromLocal(subPath);
        // else {
        //   String params =
        //       '?token=${(await getToken())}&resourceId=${sourceImage['_id']}&time=${DateTime.now().toString()}';

        //   return BaseUrl + "resources/get_resource_from_local" + params;
        // }

        //lấy ảnh từ api
        String sourceUrl = BaseUrl +
            "resources/get_resource_from_local" +
            '?token=${(await getToken())}&resourceId=${sourceImage['_id']}&time=${DateTime.now().toString()}';

        return {"type": 2, "path": sourceUrl};
      }
    } else
      return;
  }

  // checkAudioLetter(String letter) async {
  //   //let sound = await fetch('https://www.dictionaryapi.com/api/v3/references/collegiate/json/' + letter.letter.toLowerCase() + '?key=' + this.keyId).then(json => {
  //   String soundPath = await fetchAudioLetter(letter);
  //   print('debugging');
  // }

  // playAudioTest(
  //     String lessonId, Map sourceAudio, List timeFrame, String letter) async {
  //   // print('tap here');
  //   // //https://media.merriam-webster.com/soundc11/i/i0000001.wav
  //   // String path = "https://media.merriam-webster.com/soundc11/i/i0000001.wav";
  //   // audioPlayer.play(path);
  //   // print(timeFrame);
  //   // print('debugging');
  //   print(timeFrame);
  //   AudioPlayer audioPlayer = AudioPlayer();
  //   var typeFile = sourceAudio['localPath']
  //       .substring(sourceAudio['localPath'].indexOf('.'));
  //   String subPath = "/$lessonId/${sourceAudio['_id']}$typeFile";

  //   var path = await download.getFileFromLocal(subPath);
  //   audioPlayer.seek(Duration(milliseconds: 1734));
  //   audioPlayer.play(path, isLocal: true);
  //   await Future.delayed(Duration(milliseconds: 571), () {
  //     audioPlayer.stop();
  //   });
  // }

  // playAudioTest() async {
  //   print('play audio test');
  //   String lessonId = widget.lessonDetail['_id'];
  //   String subPath = "/$lessonId/60bb5eb2dd38fc1918818dbf.wav";
  //   await audioPlayer.stop();
  //   var path = await download.getFileFromLocal(subPath);
  //   if (path != null) await audioPlayer.play(path, isLocal: true);
  // }

  //http://backend.topkiddovn.com/resources/get_resource_from_local?token=eyJhbGciOiJIUzI1NiJ9.NjBlNjcwNjJkZDM4ZmMxOTE4ODFhMzcw.EzgjXON02uXmC25w8vUyPkSbxITURx5ttBrMq-Xzvy0&resourceId=60d088e9dd38fc19188193c6&time=1625826548939
  //http://backend.topkiddovn.com/resources/get_resource_from_local?token=eyJhbGciOiJIUzI1NiJ9.NjBlN2Y4MTZkZDM4ZmMxOTE4ODFhNjlm.ixdMoMf_o-AyfPuJNpZZ7CTHwfm8hg5OgqK45QiVZkw&resourceId=60dc7dd8dd38fc191881a16b&time=2021-07-09 17:27:51.733820
  playAudio(sourceAudio) async {
    String lessonId = widget.lessonDetail['_id'];
    audioPlayer.setVolume(0.5);
    
    await audioPlayer.stop();

    try {
      if (sourceAudio != null) {
        var typeFile = sourceAudio['localPath'] != null
            ? sourceAudio['localPath']
                .substring(sourceAudio['localPath'].indexOf('.'))
            : ".wav";
        String subPath = "/$lessonId/${sourceAudio['_id']}$typeFile";
        //60b7862add38fc1918816a24/60cb4337dd38fc19188193b6.wav
        var path = await download.getFileFromLocal(subPath);

        //play source đã lưu trong local
        if (path != null) {
          store.setPlayAudio(false);
          await audioPlayer.play(path, isLocal: true);

          audioPlayer.onPlayerCompletion.listen((event) {
            store.setPlayAudio(true);
          });
        }
        //play source trên server sau đó lưu vào local
        if (path == null && sourceAudio['localPath'] != null) {
          String sourceUrl = BaseUrl +
              "resources/get_resource_from_local" +
              '?token=${(await getToken())}&resourceId=${sourceAudio['_id']}&time=${DateTime.now().toString()}';

          store.setPlayAudio(false);
          print('debugging');
          await audioPlayer.play(sourceUrl);

          audioPlayer.onPlayerCompletion.listen((event) async {
            store.setPlayAudio(true);
            await download.downloadFile(sourceAudio, lessonId);
          });
        }
        //trường hợp lấy audioOutSide resource sau đó lưu vào local
        if (path == null && sourceAudio['localPath'] == null) {
          playAudioOutsideResources(sourceAudio, lessonId);
        }
      } else
        return false;
    } catch (e) {
      print(e);
    }
  }

  playAudioOutsideResources(Map sourceAudio, String lessonId) async {
    String letter = sourceAudio['letter'] ?? "";
    audioPlayer.setVolume(0.5);
    if (letter.length > 0 && store.isPlayAudio) {
      String soundPath = await fetchAudioLetter(letter);
      if (soundPath != null) {
        // Map resource = {'_id': e['_id'], 'localPath': soundPath};
        // e['resources'].add(resource);
        // print(content);
        // print(soundPath);
        // String path =
        //     "https://media.merriam-webster.com/soundc11/l/love0001.wav";
        var result = await audioPlayer.play(soundPath);
        if (result == 1) {
          sourceAudio['localPath'] = soundPath;
          await download.downloadFile(sourceAudio, lessonId);
        } else
          return;
      }
    }
  }

  //   initializeAndPlayVideo()async{
  //    String pathVideo="";
  //   final controller = VideoPlayerController.network(pathVideo);
  //   final old = _controllerVideo;
  // if (old != null) {
  //   old.removeListener(_onControllerUpdated);
  //   old.pause(); // mute instantly
  // }
  // _controller = controller;
  // setState(() {
  //   debugPrint("---- controller changed");
  // });

  // controller
  //   ..initialize().then((_) {
  //     debugPrint("---- controller initialized");
  //     old?.dispose();
  //     _playingIndex = index;
  //     controller.addListener(_onControllerUpdated);
  //     controller.play();
  //     setState(() {});
  //   });
  //   }

  _onPageViewChange(int page) async {
    // if (page == 0) {
    //   print('debugging');
    // }
    print('checkData ' + store.checkData.toString());
    store.setCheckData(false);
    store.setShowTopButton(false);
    print("Current Page: " + page.toString());
    print(store.listFlashCard.length);

    store.setAnimation(false);
    List dataFlashCard = store.listDataFlashCard;
    FlashCard data = dataFlashCard[page];
    if (data.isVideo) {}
    //animation cho câu
    if (data.timeFrame != null && data.isAnimation == true) {
      store.setAnimation(true);
      animationLetter(
          timeFrame: data.timeFrame, letterResources: data.letterResources);
    }
    //animation chữ
    animationController.repeat(reverse: true);
    //play audio
    if (data != null && data?.sourceAudio != null) {
      playAudio(data.sourceAudio);
    }
    //lưu vị trí
    await savePositionFlashCard(data);

    if (page == 1) {
      checkRemoveGuideFlashCard(page);
    }
    //kiểm tra trước data đã có chưa
    if (page % 10 == 0 && (page + 10) < dataFlashCard.length) {
      print('debugging');
      checkExistDataFuture(page + 10, dataFlashCard);
    }
  }

  savePositionFlashCard(FlashCard data) async {
    Map items = {
      "flashCardId": data?.id ?? "",
      "partId": data?.partId ?? "",
      "lessonId": data?.lessonId ?? "",
      "unitId": data?.unitId ?? "",
      "ordinalNumber": data?.ordinalNumber ?? 0,
      "showGuide": false
    };

    await hiveService.putBoxesWithKey(
        hiveService.keyFlashCard, items, boxFlashCard);
    print(hiveService.getBoxesWithKey(hiveService.keyFlashCard, boxFlashCard));
    print('debugging');
  }

  checkRemoveGuideFlashCard(int page) {
    List tempList = [...store.listFlashCard];
    if (tempList[0]['data'].id == null) {
      tempList.removeAt(0);
      store.setListFlashCard(tempList);
      store.setShowQuestion(false);
      _pageController.jumpToPage(0);
    }
  }

  checkExistDataFuture(int pageCheck, List listData) async {
    //List tempList = [...listData.sublist(pageCheck, pageCheck + 10)];
    // var data1 = listData[pageCheck];
    // var data2 = listData[pageCheck + 10];

    List tempList = [];
    if ((listData.length - pageCheck) < 10) {
      tempList = [...listData.sublist(pageCheck, listData.length)];
    } else {
      tempList = [...listData.sublist(pageCheck, pageCheck + 10)];
    }
    print('debugging');
    if (tempList.length > 0) {
      List<Future> data = [];
      // tempList.forEach((content) async {
      for (var content in tempList) {
        if (content?.resources != null && content?.resources.length > 0) {
          print('debugging');
          data.add(downloadData(content.resources, widget.lessonDetail['_id']));
        }
        if (content?.letterResources != null &&
            content?.letterResources.length > 0) {
          print('debugging');
          List dataLetterResources = content.letterResources;
          // dataLetterResources.forEach((e) async {
          for (var e in dataLetterResources) {
            if (e['resources'].length == 0) {
              String soundPath = await fetchAudioLetter(e['letter']);
              print('debugging');
              if (soundPath != null) {
                Map resource = {
                  '_id': e['_id'],
                  'localPath': soundPath,
                  'type': 2
                };
                e['resources'].add(resource);
                print(content);

                print('debugging');
              }
            }

            data.add(downloadData(e['resources'], widget.lessonDetail['_id']));
          }
        }
      }
      // for (var i = 0; i < tempList.length; i++) {
      //   List listContent = tempList[i]['content'];
      //Future.forEach(tempList, (content) {
      //List data = [];
      // if (content?.resources != null && content?.resources.length > 0) {
      //   data.addAll(content.resources);
      // }
      // if (content?.letterResources != null &&
      //     content?.letterResources.length > 0) {
      //   List dataLetterResources = content.letterResources;
      //   dataLetterResources.forEach((e) async {
      //     if (e['resources'].length == 0) {
      //       String soundPath = await fetchAudioLetter(e['letter']);
      //       print('debugging');
      //       if (soundPath != null) {
      //         Map resource = {'_id': e['_id'], 'localPath': soundPath};
      //         e['resources'].add(resource);
      //         print(content);

      //         print('debugging');
      //       }
      //     }

      //     data.addAll(e['resources']);
      //   });
      // }
      // if (content?.outsideResources.length > 0) {
      //   data.addAll(content.outsideResources);
      // }

      //downloadData(data, widget.lessonDetail['_id']);
      //});
      await Future.wait(data);
    }
  }

  Future downloadData(List listResource, String lessonId) async {
    if (listResource.length > 0 && listResource.isNotEmpty) {
      List<Future> listDataHandle = [];
      listResource.forEach((resource) async {
        if (resource['type'] < 3) {
          listDataHandle.add(download.downloadFile(resource, lessonId));
          print('debugging');
        } else {
          return;
        }
      });
      await Future.wait(listDataHandle);
    }
  }

  animationLetter({List timeFrame, List letterResources}) async {
    //store.setPreventSwipe(false);
    if (timeFrame != null && letterResources != null) {
      for (var i = 0; i < letterResources.length; i++) {
        if (store.isAnimation == false) break;
        int time = (timeFrame[i]['time'] * 1000).round();
        await Future.delayed(Duration(milliseconds: time), () {
          store.setAnimationId(letterResources[i]['_id']);
        });
      }
      await Future.delayed(Duration(milliseconds: 1000), () {
        store.setAnimationId("");
      });
    } else
      return;

    // store.setPreventSwipe(true);
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
    audioPlayer.stop();
    audioPlayer.dispose();
    //_controllerVideo.dispose();
    //store.dispose;
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
    var flashCardStore = Provider.of<FlashCardStore>(context);
    flashCardStore.setCheckData(false);
    // print(flashCardStore.muteSound);
    // print('checkData in Widget: ' + flashCardStore.checkData.toString());
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
                                  physics: store.isPreventSwipe
                                      ? BouncingScrollPhysics()
                                      : NeverScrollableScrollPhysics(),
                                  //onPageChanged: _onPageViewChange,
                                  onPageChanged: (page) {
                                    _onPageViewChange(page);
                                    print('debugging');
                                  },
                                  children: store.listWidget != null
                                      ? [...store.listWidget]
                                      : []),
                              onSwipeUp: () {
                                // setState(() {
                                //   _swipeDirection = "Swipe Up";
                                //   reset();
                                // });
                                //playAudio();
                                store.setShowTopButton(false);
                              },
                              onSwipeDown: () {
                                print('down');
                                // playAudio();
                                // setState(() {
                                //   _swipeDirection = "Swipe Down";
                                // });
                                store.setShowTopButton(true);
                              },
                              onSwipeLeft: () {
                                print('left');
                                print('debugging');
                              },
                              onSwipeRight: () {
                                print('right');
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
                      store.isShowTopButton
                          ? TopButton(
                              unitId: widget.lessonDetail['unit'],
                            )
                          : Container(),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  //Dynamic widet

  Widget cardMultisensory() {
    double height = MediaQuery.of(context).size.height;
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

  Widget cardTitle(BuildContext context, FlashCard data,
      {pathAudio, pathImg, isShowHand: true}) {
    FlashCard flashCard = data;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.5.w),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            child: Text(flashCard.content ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.2,
                    fontSize: flashCard.height > 600 ? 80.sp : 140.sp,
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
                                fontSize:
                                    flashCard.height > 600 ? 21.sp : 25.sp,
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
                  top: flashCard.height > 600 ? 30.w : 0.25.sh,
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
                                  fontSize:
                                      flashCard.height > 600 ? 21.sp : 25.sp,
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
                                fontSize:
                                    flashCard.height > 600 ? 21.sp : 25.sp,
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
  }

  //trường hợp ảnh full
  Widget cardImageFull({Map pathImage}) {
    return GestureDetector(
      child: pathImage['type'] == 2
          ?
          // Image.network(
          //     pathImage['path'],
          //     errorBuilder: (BuildContext context, Object exception,
          //         StackTrace stackTrace) {
          //       return Text('');
          //     },
          //     fit: BoxFit.contain,
          //   )
          CachedNetworkImage(
              imageUrl: pathImage['path'],
              // placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.contain,
            )
          : pathImage['type'] == 1
              ? Image(
                  image: FileImage(File(pathImage['path'])),
                  fit: BoxFit.contain,
                )
              : Center(child: CircularProgressIndicator()),
      // child: pathImg != null
      //     ? Image(
      //         image: FileImage(File(pathImg)),
      //         fit: BoxFit.contain,
      //       )
      //     : Image.asset(
      //         'assets/images/flashcard/image1.jpg',
      //         fit: BoxFit.contain,
      // ),
      onTap: () async {
        print('tap image full');
      },
    );
  }

// trường hợp chữ ngắn
  Widget cardShortText(FlashCard data) {
    FlashCard flashCard = data;
    return FadeTransition(
      opacity: animationController,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(8.5.w),
        child: Text(flashCard.content ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: flashCard.height > 600 ? 70.sp : 100.sp,
                // fontWeight: FontWeight.w900,
                color: Color(int.parse(
                        flashCard.colorContent.replaceAll('#', '0xff'))) ??
                    Theme.Colors.orange900,
                fontFamily: 'UTMCooperBlack')),
      ),
    );
  }

//trường hợp click từng hình để nghe
  Widget cardClickEachImage(
      {pathImg1: '', pathImg2: '', pathSound1: '', pathSound2: ''}) {
    double height = MediaQuery.of(context).size.height;
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
                  child: pathImg1['type'] == 1
                      ? Image(
                          image: FileImage(File(pathImg1['path'])),
                          fit: BoxFit.contain,
                          height: 70.w,
                        )
                      : pathImg1['type'] == 2
                          ?
                          // Image.network(pathImg1['path'],
                          //     fit: BoxFit.contain, height: 70.w)
                          CachedNetworkImage(
                              imageUrl: pathImg1['path'],
                              //placeholder: (context, url) =>
                              //    CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.contain,
                              height: 70.w,
                            )
                          : Container(),
                  onTap: () async {
                    playAudio(pathSound1);
                  },
                ),
                GestureDetector(
                  child: pathImg2['type'] == 1
                      ? Image(
                          image: FileImage(File(pathImg2['path'])),
                          fit: BoxFit.contain,
                          height: 70.w,
                        )
                      : pathImg2['type'] == 2
                          ?
                          //      Image.network(pathImg2['path'],
                          //         fit: BoxFit.contain, height: 70.w)
                          CachedNetworkImage(
                              imageUrl: pathImg2['path'],
                              //placeholder: (context, url) =>
                              //    CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.contain,
                              height: 70.w)
                          : Container(),
                  onTap: () async {
                    playAudio(pathSound2);
                  },
                ),
              ],
            )
          ],
        ));
  }

//trường hợp chỉ sử dụng cho text ít chữ
  Widget cardFewText(FlashCard data) {
    //  cardFewText({Animation animation, AnimationController controller}) {

    FlashCard flashCard = data;
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(8.5.w),
        child: ScaleTransition(
          // scale: _FlashCardScreen().tween.animate(CurvedAnimation(
          //     parent: _FlashCardScreen().controller, curve: Curves.elasticOut)),
          scale: animation,
          child: SizedBox(
            child: Text(flashCard.content ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: flashCard.height > 600 ? 35.sp : 75.sp,
                    // fontWeight: FontWeight.w900,
                    color: Color(int.parse(
                            flashCard.colorContent.replaceAll('#', '0xff'))) ??
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
  //  cardVideo() {
  //   return Container(
  //     height: 1.sh,
  //     // width: 1.sw,
  //     color: Colors.black,
  //     child: ClipRRect(
  //       child: Center(
  //         child: FutureBuilder(
  //           future: _controllerVideo.initialize(),
  //           builder: (context, snapshot) {
  //             if (snapshot.connectionState == ConnectionState.done) {
  //               // If the VideoPlayerController has finished initialization, use
  //               // the data it provides to limit the aspect ratio of the video.
  //               return AspectRatio(
  //                 aspectRatio: _controllerVideo.value.aspectRatio,
  //                 // Use the VideoPlayer widget to display the video.
  //                 child: VideoPlayer(_controllerVideo),
  //               );
  //             } else {
  //               // If the VideoPlayerController is still initializing, show a
  //               // loading spinner.
  //               return Center(child: CircularProgressIndicator());
  //             }
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // cardVideo(String videoUrl) {
  //   return Container(
  //     height: 1.sh,
  //     // width: 1.sw,
  //     color: Colors.black,
  //     child: ClipRRect(
  //       child: Center(
  //         child: AspectRatio(
  //           aspectRatio: 16 / 9,
  //           child: BetterPlayer.network(
  //             videoUrl,
  //             betterPlayerConfiguration: BetterPlayerConfiguration(
  //                 autoPlay: true,
  //                 looping: true,
  //                 //fullScreenByDefault: true,
  //                 autoDispose: false,
  //                 controlsConfiguration: BetterPlayerControlsConfiguration(
  //                   showControls: false,

  //                 )),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // @override
  // Widget cardVideo() {
  //   BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
  //       BetterPlayerDataSourceType.network,
  //       "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");

  //   return AspectRatio(
  //     aspectRatio: 16 / 9,
  //     child: BetterPlayer(
  //       controller: BetterPlayerController(
  //           BetterPlayerConfiguration(
  //               autoPlay: true, autoDispose: true, looping: true),
  //           betterPlayerDataSource: betterPlayerDataSource),
  //     ),
  //   );
  // }

//trường hợp câu có ảnh nhỏ
  Widget cardSentence(List listSubsentence) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.5.w),
      child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10.w,
          alignment: WrapAlignment.center,
          children: listSubsentence ?? []),
    );
  }

  Widget cardSubSentence(FlashCard data,
      {idLetter: "", text: "", pathSound: "", isImage: false, Map pathImage}) {
    double height = MediaQuery.of(context).size.height;
    FlashCard flashCard = data;
    return Observer(
        name: 'subSentence',
        builder: (_) => Column(children: [
              GestureDetector(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: isImage
                        ? [
                            pathImage['type'] == 1
                                ? Container(
                                    margin: EdgeInsets.only(top: 3.w),
                                    child: Image(
                                      image: FileImage(File(pathImage["path"])),
                                      fit: BoxFit.contain,
                                      height: 17.w,
                                    ),
                                  )
                                : pathImage['type'] == 2
                                    ? Container(
                                        margin: EdgeInsets.only(top: 3.w),
                                        // child: Image.network(
                                        //   pathImage["path"],
                                        //   fit: BoxFit.contain,
                                        //   height: 17.w,

                                        // )
                                        child: CachedNetworkImage(
                                            imageUrl: pathImage['path'],
                                            placeholder: (context, url) =>
                                                CircularProgressIndicator(
                                                  strokeWidth: 0,
                                                ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            fit: BoxFit.contain,
                                            height: 17.w)

                                        // child: Image(
                                        //   image: FileImage(
                                        //       File(pathImage["path"])),
                                        //   fit: BoxFit.contain,
                                        //   height: 17.w,
                                        // ),
                                        )
                                    : Container(),
                            AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: 0),
                                style: idLetter == store.animationId
                                    ? TextStyle(
                                        fontSize: height > 600 ? 45.sp : 65.sp,
                                        color: Colors.yellow,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold)
                                    : TextStyle(
                                        fontSize: 24.0,
                                        color: Color(int.parse(flashCard
                                            .colorContent
                                            .replaceAll('#', '0xff'))),
                                        fontWeight: FontWeight.w100),
                                child: Text(text,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: height > 600 ? 45.sp : 65.sp,
                                        // color: Theme.Colors.orange900,
                                        fontFamily: 'UTMCooperBlack'))),
                          ]
                        : [
                            AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: 0),
                                style: idLetter == store.animationId
                                    ? TextStyle(
                                        fontSize: height > 600 ? 70.sp : 100.sp,
                                        color: Colors.yellow,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold)
                                    : TextStyle(
                                        fontSize: 24.0,
                                        color: Color(int.parse(flashCard
                                            .colorContent
                                            .replaceAll('#', '0xff'))),
                                        fontWeight: FontWeight.w100),
                                child: Text(text,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: height > 600 ? 70.sp : 100.sp,
                                        // color: Theme.Colors.orange900,
                                        fontFamily: 'UTMCooperBlack'))),
                          ]),
                onTap: () async {
                  // print(data);
                  // print(pathSound);
                  // print(idLetter);
                  // print('debugging');
                  // String path =
                  //     "media.merriam-webster.com/soundc11/l/love0001.wav";
                  // bool _validURL = Uri.parse(path).isAbsolute;
                  // print('debugging');
                  if (pathSound.length > 0) {
                    await playAudio(pathSound);
                  } else {
                    Map pathSound = {
                      "_id": idLetter,
                      "sourceAudio": null,
                      "letter": text
                    };
                    await playAudio(pathSound);
                  }
                },
              ),
              // SizedBox(width: 5.w),
            ]));
  }
}

class TopButton extends StatefulWidget {
  final unitId;

  const TopButton({Key key, this.unitId}) : super(key: key);
  @override
  _TopButtonState createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  final HiveService hiveService = HiveService();
  String boxLesson = "lesson";
  String boxFlashCard = "flashCard";
  String key = "currentData";
  FlashCardStore flashCardStore;

  // @override
  // void initState() {
  //   super.initState();
  //   initVolumeState();
  // }

  // Future<void> initVolumeState() async {
  //   if (!mounted) return;
  //   flashCardStore = Provider.of<FlashCardStore>(context, listen: false);
  //   if (flashCardStore.muteSound == true) {
  //     VolumeControl.setVolume(0.0);
  //   } else {
  //     VolumeControl.setVolume(1.0);
  //   }

  //   //  var _val = await VolumeControl.volume;
  //   // print('debugging');
  // }

  getListLesson() async {
    Dialogs.showLoadingDialog(context);
    var currentUnitId = widget.unitId;
    if (currentUnitId != null && currentUnitId.length > 0) {
      var listLesson =
          await hiveService.getBoxesWithKey(currentUnitId, boxLesson);

      if (listLesson != null && listLesson.length > 0) {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => DesignCourseScreen(lesson: listLesson)),
            (route) => false);
      } else {
        Navigator.of(context, rootNavigator: true).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var flashCardStore = Provider.of<FlashCardStore>(context);
    return Observer(
        name: 'topButton',
        builder: (_) => Container(
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
                                    getListLesson();
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
                                    //   Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //           builder: (BuildContext context) =>
                                    //               HomeScreen()));
                                    // }),
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                        (route) => false);
                                  }),
                              SizedBox(
                                width: 8.w,
                              ),
                              GestureDetector(
                                  child: Container(
                                      width: 20.w,
                                      height: 20.w,
                                      decoration: BoxDecoration(
                                        image: !flashCardStore.muteSound
                                            ? DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/button/musicon-button.png',
                                                ),
                                                fit: BoxFit.contain)
                                            : DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/button/musicoff-button.png',
                                                ),
                                                fit: BoxFit.contain),
                                      )),
                                  onTap: () {
                                    flashCardStore.setMuteSound();
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
            )));
  }
}

class FlashCard {
  String id;
  String partId;
  String lessonId;
  String unitId;
  String content;
  int ordinalNumber;
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
  List resources;
  List letterResources;
  double height;
  Widget widget;
  bool isAnimation;
  bool isVideo;

  FlashCard({
    this.id,
    this.partId,
    this.lessonId,
    this.unitId,
    this.content,
    this.ordinalNumber,
    this.language,
    this.sizeContent,
    this.contentPosition,
    this.colorContent,
    this.animationContent,
    this.highlightColor,
    this.timeFrame,
    this.type,
    this.resources,
    this.letterResources,
    this.sourceAudio,
    this.sourceImage,
    this.height,
    this.widget,
    this.isAnimation = false,
    this.isVideo = false,
  });

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
      resources: parsedJson['resources'] ?? null,
      letterResources: parsedJson['letterResources'] ?? null,
    );
  }

  // String toString() => sourceImage['_id'];

  FlashCard copyWith({
    String id,
    String lessonId,
    String partId,
    String unitId,
    String content,
    int ordinalNumber,
    int language,
    int sizeContent,
    int contentPosition,
    String colorContent,
    int animationContent,
    String highlightColor,
    List timeFrame,
    Map sourceAudio,
    Map sourceImage,
    int type,
    List resources,
    List letterResources,
    double height,
    bool isAnimation,
  }) {
    return FlashCard(
      id: id ?? this.id,
      lessonId: lessonId ?? this.lessonId,
      partId: partId ?? this.partId,
      unitId: unitId ?? this.unitId,
      content: content ?? this.content,
      ordinalNumber: ordinalNumber ?? this.ordinalNumber,
      language: language ?? this.language,
      sizeContent: sizeContent ?? this.sizeContent,
      contentPosition: contentPosition ?? this.contentPosition,
      colorContent: colorContent ?? this.colorContent,
      animationContent: animationContent ?? this.animationContent,
      highlightColor: highlightColor ?? this.highlightColor,
      timeFrame: timeFrame ?? this.timeFrame,
      sourceAudio: sourceAudio ?? this.sourceAudio,
      sourceImage: sourceAudio ?? this.sourceImage,
      type: type ?? this.type,
      resources: resources ?? this.resources,
      letterResources: letterResources ?? this.letterResources,
      height: height ?? this.height,
      isAnimation: isAnimation ?? this.isAnimation,
    );
  }
}

class CardVideo extends StatefulWidget {
  final String videoUrl;

  CardVideo({this.videoUrl});

  @override
  _CardVideoState createState() => _CardVideoState();
}

class _CardVideoState extends State<CardVideo> {
  VideoPlayerController _controllerVideo;
  VoidCallback listener;

  //bool initialized = false;
  //bool _isPlaying = false;
  // Duration _duration;
  // Duration _position;
  // bool _isEnd = false;

  @override
  void initState() {
    super.initState();
    _controllerVideo = VideoPlayerController.network(
      widget.videoUrl,
    )
      ..addListener(() {
        if (!_controllerVideo.value.isPlaying &&
            _controllerVideo.value.position.inSeconds >=
                _controllerVideo.value.duration.inSeconds) {
          _controllerVideo = null;
          print('videoPlayer completion');
        }
      })
      ..setVolume(1.0)
      ..initialize().then((_) {
        setState(() {
          _controllerVideo.play();
          _controllerVideo.setLooping(false);
          _controllerVideo.seekTo(Duration.zero);
        });
      });
  }

  @override
  void dispose() {
    if (_controllerVideo.value.isPlaying) _controllerVideo.pause();
    _controllerVideo = null;
    super.dispose();
  }

  Widget build(BuildContext context) {
    // print('rebuild Video');

    return Container(
      height: 1.sh,
      // width: 1.sw,
      color: Colors.black,
      child: ClipRRect(
        child: Center(
            child: _controllerVideo.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controllerVideo.value.aspectRatio,
                    child: VideoPlayer(_controllerVideo),
                  )
                : Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
