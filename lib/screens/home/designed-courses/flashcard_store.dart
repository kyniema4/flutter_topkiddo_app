import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:volume_control/volume_control.dart';

// Include generated file
part 'flashcard_store.g.dart';

// This is the class used by rest of your codebase
class FlashCardStore = _FlashCardStore with _$FlashCardStore;

// The store-class
abstract class _FlashCardStore with Store {
  @observable
  bool checkData = true;
  @observable
  List listFlashCard = [];
  @observable
  List listFlashCardGame = [];
  @observable
  List<Widget> listWidget = [];
  @observable
  List<Widget> listWidgetGame = [];
  @observable
  List listDataFlashCard = [];
  @observable
  bool isShowQuestion = false;
  @observable
  bool isShowTopButton = true;
  @observable
  String pathSoureAudio;
  @observable
  bool isReload = false;
  @observable
  bool isPreventSwipe = false;
  @observable
  String animationId;
  @observable
  bool isAnimation;
  @observable
  int currentPart = 0;
  @observable
  int currentPage = 0;
  @observable
  int pageInPart = 0;
  @observable
  bool isPlayAudio = true;
  @observable
  bool muteSound = false;
  @observable
  bool isShowGame = false;
  // @observable
  // List<String> tempListAnswer = [];
  @observable
  String chooseAnswer = "";
  @observable
  ObservableList<String> tempListAnswer = ObservableList<String>.of([]);

  @action
  void setChooseAnswer(String id) {
    chooseAnswer = id;
  }

  @computed
  bool get canTapAnswer => chooseAnswer.isEmpty;
  @action
  void setTempListAnswer(String value) {
    tempListAnswer.add(value);
    print(tempListAnswer);
  }

  @action
  void setCurrentPage(int value) {
    currentPage = value;
  }

  @action
  void setCheckData(bool value) {
    checkData = value;
  }

  @action
  void setAnimationId(String value) {
    animationId = value;
  }

  @action
  bool setPlayAudio(bool value) {
    isPlayAudio = value;
  }

  @action
  void setMuteSound() {
    muteSound = !muteSound;
    if (muteSound == true) {
      VolumeControl.setVolume(0.0);
    } else {
      VolumeControl.setVolume(0.2);
    }
  }

  @action
  void setAnimation(bool value) {
    isAnimation = value;
  }

  @action
  void setIsReload() {
    isReload = !isReload;
  }

  @action
  void setListFlashCard(List value) {
    listFlashCard = value;
    List tempListWidget = [];
    List tempListDataFlashCard = [];
    for (var item in value) {
      if (item['widget'] != null) {
        tempListWidget.add(item['widget']);
      }
      if (item['data'] != null) {
        tempListDataFlashCard.add(item['data']);
      }
    }
    // listWidget = [...value.map((e) => e['widget'])];
    // listDataFlashCard = [...value.map((e) => e['data'])];
    listWidget = [...tempListWidget];
    listDataFlashCard = [...tempListDataFlashCard];
  }

  // @action
  // void addLisFlashCardGame(List value) {
  //   List<Widget> tempListWidget = [];
  //   List tempListDataFlashCard = [];
  //   for (var item in value) {
  //     if (item['widget'] != null) {
  //       tempListWidget.add(item['widget']);
  //     }
  //     if (item['data'] != null) {
  //       tempListDataFlashCard.add(item['data']);
  //     }
  //   }

  //   listWidget = [...tempListWidget];
  //   listDataFlashCard = [...tempListDataFlashCard];
  // }

  @action
  void setLisFlashCardGame(List value) {
    listFlashCardGame = value;
  }

  @action
  void setShowGame(bool value) {
    isShowGame = value;
  }

  @action
  void setCurrentPart(int value) {
    currentPart = value;
  }

  // @action
  // void setPageInPart(int value) {
  //   pageInPart = value;
  // }

  @action
  void setShowQuestion(bool value) {
    isShowQuestion = value;
  }

  @action
  void setShowTopButton(bool value) {
    isShowTopButton = value;
  }

  @action
  void setPreventSwipe(bool value) {
    isPreventSwipe = value;
  }

  @action
  void setSourceAudio() {
    print(listFlashCard[currentPage]['data']);
  }

  Future waitPreventSwipe(bool value) async {
    setPreventSwipe(value);
  }
  // @computed
  // bool get unitId {
  //   if (listFlashCard != null) {
  //     print(listFlashCard[1]['data'].unitId);
  //   }
  // }

}
