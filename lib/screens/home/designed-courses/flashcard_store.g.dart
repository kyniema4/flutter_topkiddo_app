// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FlashCardStore on _FlashCardStore, Store {
  final _$listFlashCardAtom = Atom(name: '_FlashCardStore.listFlashCard');

  @override
  List<dynamic> get listFlashCard {
    _$listFlashCardAtom.reportRead();
    return super.listFlashCard;
  }

  @override
  set listFlashCard(List<dynamic> value) {
    _$listFlashCardAtom.reportWrite(value, super.listFlashCard, () {
      super.listFlashCard = value;
    });
  }

  final _$listWidgetAtom = Atom(name: '_FlashCardStore.listWidget');

  @override
  List<Widget> get listWidget {
    _$listWidgetAtom.reportRead();
    return super.listWidget;
  }

  @override
  set listWidget(List<Widget> value) {
    _$listWidgetAtom.reportWrite(value, super.listWidget, () {
      super.listWidget = value;
    });
  }

  final _$isShowQuestionAtom = Atom(name: '_FlashCardStore.isShowQuestion');

  @override
  bool get isShowQuestion {
    _$isShowQuestionAtom.reportRead();
    return super.isShowQuestion;
  }

  @override
  set isShowQuestion(bool value) {
    _$isShowQuestionAtom.reportWrite(value, super.isShowQuestion, () {
      super.isShowQuestion = value;
    });
  }

  final _$isShowTopButtonAtom = Atom(name: '_FlashCardStore.isShowTopButton');

  @override
  bool get isShowTopButton {
    _$isShowTopButtonAtom.reportRead();
    return super.isShowTopButton;
  }

  @override
  set isShowTopButton(bool value) {
    _$isShowTopButtonAtom.reportWrite(value, super.isShowTopButton, () {
      super.isShowTopButton = value;
    });
  }

  final _$pageCurrentAtom = Atom(name: '_FlashCardStore.pageCurrent');

  @override
  int get pageCurrent {
    _$pageCurrentAtom.reportRead();
    return super.pageCurrent;
  }

  @override
  set pageCurrent(int value) {
    _$pageCurrentAtom.reportWrite(value, super.pageCurrent, () {
      super.pageCurrent = value;
    });
  }

  final _$pathSoureAudioAtom = Atom(name: '_FlashCardStore.pathSoureAudio');

  @override
  String get pathSoureAudio {
    _$pathSoureAudioAtom.reportRead();
    return super.pathSoureAudio;
  }

  @override
  set pathSoureAudio(String value) {
    _$pathSoureAudioAtom.reportWrite(value, super.pathSoureAudio, () {
      super.pathSoureAudio = value;
    });
  }

  final _$_FlashCardStoreActionController =
      ActionController(name: '_FlashCardStore');

  @override
  void setListFlashCard(List<dynamic> value) {
    final _$actionInfo = _$_FlashCardStoreActionController.startAction(
        name: '_FlashCardStore.setListFlashCard');
    try {
      return super.setListFlashCard(value);
    } finally {
      _$_FlashCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPageViewChange(int value) {
    final _$actionInfo = _$_FlashCardStoreActionController.startAction(
        name: '_FlashCardStore.setPageViewChange');
    try {
      return super.setPageViewChange(value);
    } finally {
      _$_FlashCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSourceAudio() {
    final _$actionInfo = _$_FlashCardStoreActionController.startAction(
        name: '_FlashCardStore.setSourceAudio');
    try {
      return super.setSourceAudio();
    } finally {
      _$_FlashCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listFlashCard: ${listFlashCard},
listWidget: ${listWidget},
isShowQuestion: ${isShowQuestion},
isShowTopButton: ${isShowTopButton},
pageCurrent: ${pageCurrent},
pathSoureAudio: ${pathSoureAudio}
    ''';
  }
}
