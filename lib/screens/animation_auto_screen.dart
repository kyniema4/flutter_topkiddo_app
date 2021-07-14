import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationAutoScreen extends StatefulWidget {
  final bool kidAction;
  AnimationAutoScreen({
    this.kidAction: true,
  }) : super();

  _AnimationAutoScreen createState() => _AnimationAutoScreen();
}

class _AnimationAutoScreen extends State<AnimationAutoScreen> {
  bool move = false;
  bool moveCloud = false;
  bool showKid1 = true;
  bool showKid2 = false;
  bool showKid3 = false;
  bool showCloud = true;
  List<Widget> listCloud = [];
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  final String audioPath = 'assets/sounds/opening.mp3';
  final bgImage = Image.asset('assets/images/background/bg_iphone.jpg');

  movingAnimation() async {
    await Future.delayed(Duration(milliseconds: 500), () {
      if (!mounted) return;
      setState(() {
        move = true;
        moveCloud = true;
      });
    });
    await Future.delayed(Duration(seconds: 5), () {
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

  handleShowCloud() {
    String pathCloud = 'assets/images/animation/cloud';
    List<Widget> clouds = [
      Cloud(path: pathCloud + '1.png', top: 15, left: 0, width: 400)
          .buildWidgetCloud(),
      Cloud(path: pathCloud + '2.png', top: 55, left: 0, width: 300)
          .buildWidgetCloud(),
      Cloud(path: pathCloud + '3.png', top: 15, left: 0, width: 350)
          .buildWidgetCloud(),
      Cloud(path: pathCloud + '4.png', top: 50, left: -30, width: 350)
          .buildWidgetCloud(),
      Cloud(path: pathCloud + '5.png', top: 15, left: 0, width: 350)
          .buildWidgetCloud(),
      Cloud(path: pathCloud + '6.png', top: 20, left: 0, width: 350)
          .buildWidgetCloud(),
    ];
    setState(() {
      listCloud = [...clouds];
    });
  }

  playAudio() async {
    int result = await audioPlayer.play(audioPath, isLocal: true);
    if (result == 1) {
      print('play success');
    }
  }

  @override
  void initState() {
    super.initState();
    playAudio();
    movingAnimation();
    handleShowCloud();
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
    audioPlayer.dispose();
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
                  bottom: 22.w,
                  left: 50.w,
                  child: Container(
                      // color: Colors.blue,
                      height: 25.w,
                      child: Image.asset('assets/images/animation/house1.gif',
                          fit: BoxFit.contain)),
                ),
                Positioned(
                  bottom: 42.w,
                  right: 15.w,
                  child: Container(
                      // color: Colors.blue,
                      height: 30.w,
                      child: Image.asset('assets/images/animation/house2.gif',
                          fit: BoxFit.contain)),
                ),
                AnimatedPositioned(
                  top: 0.w,
                  right: moveCloud ? -400.w : 50.w,
                  child: Container(
                    width: width,
                    height: height,
                    child: Stack(children: listCloud),
                  ),
                  duration: Duration(seconds: 30),
                ),
                AnimatedPositioned(
                  top: 0.w,
                  right: moveCloud ? 0.w : 350.w,
                  child: Container(
                    width: width,
                    height: height,
                    child: Stack(children: listCloud),
                  ),
                  duration: Duration(seconds: 30),
                ),
                showKid1 && widget.kidAction
                    ? AnimatedPositioned(
                  bottom: 2.w,
                  right: move ? 50.w : 30.w,
                  width: 90.w,
                  child: Center(
                      child: Image.asset(
                          'assets/images/animation/kid1.gif',
                          fit: BoxFit.contain)),
                  duration: Duration(seconds: 2),
                )
                    : Container(),
                showKid2 && widget.kidAction
                    ? AnimatedPositioned(
                  bottom: 24.w,
                  right: move ? 220.w : 40.w,
                  width: 90.w,
                  child: Center(
                      child: Image.asset(
                          'assets/images/animation/kid2.gif',
                          fit: BoxFit.contain)),
                  duration: Duration(seconds: 5),
                )
                    : Container(),
                showKid3 && widget.kidAction
                    ? AnimatedPositioned(
                  bottom: 24.w,
                  right: move ? 220.w : 40.w,
                  width: 90.w,
                  child: Center(
                      child: Image.asset(
                          'assets/images/animation/kid3.gif',
                          fit: BoxFit.contain)),
                  duration: Duration(seconds: 5),
                )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class Cloud {
  String path;
  int bottom;
  int right;
  int left;
  int top;
  int width;
  int height;
  Cloud({
    this.path,
    this.bottom,
    this.right,
    this.left,
    this.top,
    this.width,
    this.height,
  });

  buildWidgetCloud() {
    return Positioned(
      top: top.w,
      left: left.w,
      width: width.w,
      child: Center(child: Image.asset(path, fit: BoxFit.contain)),
    );
  }
}
