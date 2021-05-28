import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:topkiddo/theme/style.dart';

class AnimationAutoScreen extends StatefulWidget {
  AnimationAutoScreen({Key key}) : super(key: key);

  _AnimationAutoScreen createState() => _AnimationAutoScreen();
}

class _AnimationAutoScreen extends State<AnimationAutoScreen> {
  bool move = false;
  bool moveClound = false;
  bool showKid1 = true;
  bool showKid2 = false;
  bool showKid3 = false;
  bool showClound = true;
  List<Widget> listClound = [];
  final bgImage = Image.asset('assets/images/background/bg_iphone.jpg');

  movingAnimation() async {
    await Future.delayed(Duration(milliseconds: 500), () {
      if (!mounted) return;
      setState(() {
        move = true;
        moveClound = true;
      });
    });
    await Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;

      setState(() {
        showKid1 = false;
        showKid2 = true;
        move = false;
      });
    });
    await Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        move = true;
      });
    });
    await Future.delayed(Duration(seconds: 7), () {
      if (!mounted) return;
      setState(() {
        showKid2 = false;
        move = false;
        //showKid2 = true;
        showKid3 = true;
      });
    });
    await Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        move = true;
      });
    });
  }

  handleShowClound() {
    String pathClound = 'assets/images/animation/cloud';
    List<Widget> clounds = [
      Clound(path: pathClound + '1.png', top: 15, left: 0, width: 400)
          .buildWidgetClound(),
      Clound(path: pathClound + '2.png', top: 55, left: 0, width: 300)
          .buildWidgetClound(),
      Clound(path: pathClound + '3.png', top: 15, left: 0, width: 350)
          .buildWidgetClound(),
      Clound(path: pathClound + '4.png', top: 50, left: -30, width: 350)
          .buildWidgetClound(),
      Clound(path: pathClound + '5.png', top: 15, left: 0, width: 350)
          .buildWidgetClound(),
      Clound(path: pathClound + '6.png', top: 20, left: 0, width: 350)
          .buildWidgetClound(),
    ];
    setState(() {
      listClound = [...clounds];
    });
  }

  @override
  void initState() {
    super.initState();
    movingAnimation();
    handleShowClound();
    //timer();
  }

  // void timer() async {
  //   await Future.delayed(Duration(seconds: 30), () {
  //     setState(() {
  //       showClound = false;
  //       moveClound = true;
  //     });
  //   });
  //   await Future.delayed(Duration(seconds: 1), () {
  //     if (!mounted) return;
  //     setState(() {
  //       showClound = true;
  //       moveClound = false;
  //     });
  //   });
  //   await Future.delayed(Duration(seconds: 1), () {
  //     if (!mounted) return;
  //     setState(() {
  //       print("call againt");
  //       moveClound = true;
  //     });
  //     timer();
  //   });
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: bgImage.image,
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          Container(
            height: height,
            child: Stack(
              children: [
                Positioned(
                  bottom: -6.w,
                  left: 40.w,
                  child: Container(
                      // color: Colors.blue,
                      height: 30.w,
                      child: Image.asset('assets/images/animation/flower.gif',
                          fit: BoxFit.contain)),
                ),
                Positioned(
                  bottom: 0.w,
                  right: 60.w,
                  child: Container(
                      // color: Colors.blue,
                      height: 20.w,
                      child: Image.asset('assets/images/animation/grass.gif',
                          fit: BoxFit.contain)),
                ),
                Positioned(
                  bottom: 40.w,
                  left: 40.w,
                  child: Container(
                      // color: Colors.blue,
                      height: 30.w,
                      child: Image.asset('assets/images/animation/house1.gif',
                          fit: BoxFit.contain)),
                ),
                Positioned(
                  bottom: 75.w,
                  right: 0.w,
                  child: Container(
                      // color: Colors.blue,
                      height: 35.w,
                      child: Image.asset('assets/images/animation/house2.gif',
                          fit: BoxFit.contain)),
                ),
                showKid1
                    ? AnimatedPositioned(
                        bottom: -50.w,
                        right: move ? 50.w : 30.w,
                        width: 150.w,
                        child: Center(
                            child: Image.asset(
                                'assets/images/animation/kid1.gif',
                                fit: BoxFit.contain)),
                        duration: Duration(seconds: 1),
                      )
                    : Container(),
                showKid2
                    ? AnimatedPositioned(
                        bottom: -12.w,
                        right: move ? 200.w : 30.w,
                        width: 150.w,
                        child: Center(
                            child: Image.asset(
                                'assets/images/animation/kid2.gif',
                                fit: BoxFit.contain)),
                        duration: Duration(seconds: 5),
                      )
                    : Container(),
                showKid3
                    ? AnimatedPositioned(
                        bottom: -12.w,
                        right: move ? 200.w : 30.w,
                        width: 150.w,
                        child: Center(
                            child: Image.asset(
                                'assets/images/animation/kid3.gif',
                                fit: BoxFit.contain)),
                        duration: Duration(seconds: 5),
                      )
                    : Container(),

                AnimatedPositioned(
                  top: 0.w,
                  right: moveClound ? -400.w : 50.w,
                  child: Container(
                    width: width,
                    height: height,
                    child: Stack(children: listClound),
                  ),
                  duration: Duration(seconds: 30),
                ),

                AnimatedPositioned(
                  top: 0.w,
                  right: moveClound ? 0.w : 350.w,
                  child: Container(
                    width: width,
                    height: height,
                    child: Stack(children: listClound),
                  ),
                  duration: Duration(seconds: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class Clound {
  String path;
  int bottom;
  int right;
  int left;
  int top;
  int width;
  int height;
  Clound({
    this.path,
    this.bottom,
    this.right,
    this.left,
    this.top,
    this.width,
    this.height,
  });

  buildWidgetClound() {
    return Positioned(
      top: top.w,
      left: left.w,
      width: width.w,
      child: Center(child: Image.asset(path, fit: BoxFit.contain)),
    );
  }
}
