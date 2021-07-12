import 'package:flutter/material.dart';
import 'package:topkiddo/Utils/hive_service.dart';
import 'package:topkiddo/components/Loading_dialog.dart';
import 'package:topkiddo/components/languages_app.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../../components/back.dart';
import '../../../components/languages_app.dart';
import 'design_course_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationScreen extends StatefulWidget {
  final unitId;
  const AnimationScreen({Key key, this.unitId}) : super(key: key);
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  // Define the _controller variable
  AnimationController _controller;
  Animation<double> _fireworkOpacityOne;
  Animation<double> _fireworkOpacityTwo;
  Animation<double> _fireworkOpacityThree;
  Animation<double> _fireworkOpacityFour;
  Animation<double> _fireworkOpacityFive;
  Animation<double> _fireworkOpacitySix;
  Animation<double> _fireworkOpacitySeven;

  @override
  void initState() {
    super.initState();

    // As the class itself is the TickerProvider we can pass this in the vsync argument
    _controller = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1500));
    _fireworkOpacityOne = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: new Tween(begin: 0.0, end: 1.0),
          weight: 100.0,
        ),
        TweenSequenceItem<double>(
          tween: new Tween(begin: 1.0, end: 0.0),
          weight: 90.0,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.1, 0.4, curve: Curves.easeInOut),
      ),
    );
    _fireworkOpacityTwo = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: new Tween(begin: 0.0, end: 1.0),
          weight: 100.0,
        ),
        TweenSequenceItem<double>(
          tween: new Tween(begin: 1.0, end: 0.0),
          weight: 90.0,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 0.5, curve: Curves.easeInOut),
      ),
    );
    _fireworkOpacityThree = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: new Tween(begin: 0.0, end: 1.0),
          weight: 100.0,
        ),
        TweenSequenceItem<double>(
          tween: new Tween(begin: 1.0, end: 0.0),
          weight: 90.0,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.6, curve: Curves.easeInOut),
      ),
    );
    _fireworkOpacityFour = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: new Tween(begin: 0.0, end: 1.0),
          weight: 100.0,
        ),
        TweenSequenceItem<double>(
          tween: new Tween(begin: 1.0, end: 0.0),
          weight: 90.0,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 0.7, curve: Curves.easeInOut),
      ),
    );
    _fireworkOpacityFive = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: new Tween(begin: 0.0, end: 1.0),
          weight: 100.0,
        ),
        TweenSequenceItem<double>(
          tween: new Tween(begin: 1.0, end: 0.0),
          weight: 90.0,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 0.8, curve: Curves.easeInOut),
      ),
    );
    _fireworkOpacitySix = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: new Tween(begin: 0.0, end: 1.0),
          weight: 100.0,
        ),
        TweenSequenceItem<double>(
          tween: new Tween(begin: 1.0, end: 0.0),
          weight: 90.0,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 0.9, curve: Curves.easeInOut),
      ),
    );
    _fireworkOpacitySeven = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: new Tween(begin: 0.0, end: 1.0),
          weight: 100.0,
        ),
        TweenSequenceItem<double>(
          tween: new Tween(begin: 1.0, end: 0.0),
          weight: 90.0,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.7, 1.0, curve: Curves.easeInOut),
      ),
    );
    // _controller.reset();
    // _controller.forward();
    // _controller.repeat(reverse: true);
    _controller.repeat();
  }

  // Don't forget to always dispose an AnimationController
  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
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
                height: height,
                decoration: blackBackground,
                child: Stack(
                  children: <Widget>[
                    Stack(
                      children: [
                        AnimatedBuilder(
                            animation: _controller,
                            builder: (BuildContext context, Widget child) {
                              return Align(
                                alignment: Alignment.center,
                                child: Opacity(
                                  opacity: _fireworkOpacityOne.value,
                                  child: Container(
                                      width: 200.w,
                                      child: Container(
                                        child: Image.asset(
                                            'assets/images/firework/firework1.png',
                                            fit: BoxFit.cover),
                                      )),
                                ),
                              );
                            }),
                        AnimatedBuilder(
                            animation: _controller,
                            builder: (BuildContext context, Widget child) {
                              return Align(
                                alignment: Alignment.center,
                                child: Opacity(
                                  opacity: _fireworkOpacityTwo.value,
                                  child: Container(
                                    width: 200.w,
                                    child: Image.asset(
                                        'assets/images/firework/firework2.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              );
                            }),
                        AnimatedBuilder(
                            animation: _controller,
                            builder: (BuildContext context, Widget child) {
                              return Align(
                                alignment: Alignment.center,
                                child: Opacity(
                                  opacity: _fireworkOpacityThree.value,
                                  child: Container(
                                    width: 200.w,
                                    child: Image.asset(
                                        'assets/images/firework/firework3.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              );
                            }),
                        AnimatedBuilder(
                            animation: _controller,
                            builder: (BuildContext context, Widget child) {
                              return Align(
                                alignment: Alignment.center,
                                child: Opacity(
                                  opacity: _fireworkOpacityFour.value,
                                  child: Container(
                                    width: 200.w,
                                    child: Image.asset(
                                        'assets/images/firework/firework4.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              );
                            }),
                        AnimatedBuilder(
                            animation: _controller,
                            builder: (BuildContext context, Widget child) {
                              return Align(
                                alignment: Alignment.center,
                                child: Opacity(
                                  opacity: _fireworkOpacityFive.value,
                                  child: Container(
                                    width: 200.w,
                                    child: Image.asset(
                                        'assets/images/firework/firework5.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              );
                            }),
                        AnimatedBuilder(
                            animation: _controller,
                            builder: (BuildContext context, Widget child) {
                              return Align(
                                alignment: Alignment.center,
                                child: Opacity(
                                  opacity: _fireworkOpacitySix.value,
                                  child: Container(
                                    width: 200.w,
                                    child: Image.asset(
                                        'assets/images/firework/firework7.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              );
                            }),
                        AnimatedBuilder(
                            animation: _controller,
                            builder: (BuildContext context, Widget child) {
                              return Align(
                                alignment: Alignment.center,
                                child: Opacity(
                                  opacity: _fireworkOpacitySeven.value,
                                  child: Container(
                                    width: 200.w,
                                    child: Image.asset(
                                        'assets/images/firework/firework7.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                    Center(
                        child: Container(
                            child: Image.asset(
                                'assets/images/lesson/text-completed.png',
                                height: 30.w,
                                fit: BoxFit.contain))),
                    TopButton(unitId: widget.unitId),
                  ],
                )),
          ],
        ),
      ),
    );
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
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: new EdgeInsets.only(top: 9.w),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 4.5.w,
            left: -69.w,
            // right: 0,
            child: Align(
              child: Image.asset(
                'assets/images/button/bar-long.png',
                height: 12.w,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 1.w,
            left: 15.w,
            child: GestureDetector(
                child: Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/button/close-button.png',
                          ),
                          fit: BoxFit.contain),
                    )),
                onTap: () {
                  // Navigator.pop(context);
                  getListLesson();
                }),
          )
        ],
      ),
    );
    // return Container(
    //     height: 32.w,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisSize: MainAxisSize.max,
    //       children: [
    //         GestureDetector(
    //           child: Container(
    //               width: 20.w,
    //               height: 20.w,
    //               decoration: BoxDecoration(
    //                 image: DecorationImage(
    //                     image: AssetImage(
    //                       'assets/images/button/close-button.png',
    //                     ),
    //                     fit: BoxFit.contain),
    //               )),
    //         )
    //         // Expanded(
    //         //   child: Back(buttonImage: 'assets/images/button/close-button.png'),
    //         // ),
    //       ],
    //     ));
  }
}
