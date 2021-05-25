import 'package:flutter/material.dart';
import 'package:topkiddo/theme/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class AnimationAutoScreen extends StatefulWidget {
  AnimationAutoScreen({Key key}) : super(key: key);

  _AnimationAutoScreen createState() => _AnimationAutoScreen();
}

class _AnimationAutoScreen extends State<AnimationAutoScreen> {
  bool move = false;
  bool showKid1 = true;
  bool showKid2 = false;
  bool showKid3 = false;
  // var posKidBottom = -50.w;
  // var posCloudLeft = 0.w;
  // var posCloudBottom = 0.w;
  // int durationKid = 0;
  movingAnimation() async {
    await Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        move = true;
      });
    });
    //3
    await Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      setState(() {
        showKid1 = false;
        showKid2 = true;
        move = false;
        //showKid2 = true;
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

    // await Future.delayed(Duration(seconds: 5), () {
    //   setState(() {
    //     posKidLeft = 50.w;
    //     posKidBottom = -10.w;
    //     durationKid = 1;
    //   });
    // });
  }

  @override
  void initState() {
    super.initState();
    movingAnimation();
  }

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
            decoration: backgroundImage2,
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
                // AnimatedPositioned(
                //   top: 15.w,
                //   left: false ? 500.w : 0.w,
                //   width: 400.w,
                //   child: Center(
                //       child: Image.asset('assets/images/animation/cloud1.png',
                //           fit: BoxFit.contain)),
                //   duration: Duration(seconds: 1),
                // ),
                // AnimatedPositioned(
                //   top: 60.w,
                //   left: false ? 500.w : 0.w,
                //   width: 300.w,
                //   child: Center(
                //       child: Image.asset('assets/images/animation/cloud2.png',
                //           fit: BoxFit.contain)),
                //   duration: Duration(seconds: 1),
                // ),
                // AnimatedPositioned(
                //   top: 50.w,
                //   left: false ? 500.w : 40.w,
                //   width: 400.w,
                //   child: Center(
                //       child: Image.asset('assets/images/animation/cloud3.png',
                //           fit: BoxFit.contain)),
                //   duration: Duration(seconds: 1),
                // ),
                // AnimatedPositioned(
                //   top: 20.w,
                //   left: false ? 500.w : 80.w,
                //   width: 300.w,
                //   child: Center(
                //       child: Image.asset('assets/images/animation/cloud4.png',
                //           fit: BoxFit.contain)),
                //   duration: Duration(seconds: 1),
                // ),
                // AnimatedPositioned(
                //   top: 20.w,
                //   left: false ? 500.w : 50.w,
                //   width: 500.w,
                //   child: Center(
                //       child: Image.asset('assets/images/animation/cloud5.png',
                //           fit: BoxFit.contain)),
                //   duration: Duration(seconds: 1),
                // ),
                // AnimatedPositioned(
                //   top: 60.w,
                //   left: false ? 500.w : 0.w,
                //   width: 150.w,
                //   child: Center(
                //       child: Image.asset('assets/images/animation/cloud6.png',
                //           fit: BoxFit.contain)),
                //   duration: Duration(seconds: 0),
                // )
                // SlideTransition(
                //   position: Tween<Offset>(begin: Offset.zero, end: Offset(1, 0))
                //       .animate(animationController),
                //   child: Center(
                //       child: Image.asset('assets/images/animation/kid1.gif',
                //           fit: BoxFit.contain)),
                // )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
