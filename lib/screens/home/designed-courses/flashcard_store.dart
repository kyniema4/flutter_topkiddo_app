import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'flashcard_store.g.dart';

// This is the class used by rest of your codebase
class FlashCardStore = _FlashCardStore with _$FlashCardStore;

// The store-class
abstract class _FlashCardStore with Store {
  @observable
  List listFlashCard = [];
  @observable
  List<Widget> listWidget = [];
  @observable
  List<Widget> listDataFlashCard = [];
  @observable
  bool isShowQuestion = true;
  @observable
  bool isShowTopButton = true;
  @observable
  int pageCurrent;
  @observable
  String pathSoureAudio;
  @observable
  bool isReload = false;
  @observable
  bool isPreventSwipe = true;
  @observable
  String animationId;
  @observable
  bool isAnimation;
  @observable
  String currentPartId;

  @action
  void setAnimationId(String value) {
    animationId = value;
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
    listWidget = [...listFlashCard.map((e) => e['widget'])];
  }

  @action
  void setCurrentPartId(String value) {
      currentPartId=value;
  }


  @action
  void setPageViewChange(int value) {
    pageCurrent = value;
    if (pageCurrent > 0) {
      isShowQuestion = false;
      isShowTopButton = false;
    } else {
      isShowQuestion = true;
      isShowTopButton = true;
    }
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
    print(listFlashCard[pageCurrent]['data']);
  }

  //  @computed
  // bool get hasAnimation {
  //    print()
  // }
}
