import 'package:flutter/material.dart';
import './test1.dart';

class Test3Screen extends StatefulWidget {
  @override
  _Test3PageState createState() => _Test3PageState();
  // final Function() onSwipeUp;
}

class _Test3PageState extends State<Test3Screen> with TickerProviderStateMixin {
  String _swipeDirection = "";
  int number = 0;
  int previousPage = 0;
  ScrollController s;
  AnimationController _controller;
  Tween<double> _tween = Tween(begin: 1.5, end: 2);

  void initState() {
    super.initState();
    s = PageController();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
  }

  // final _pageController = PageController(initialPage: 0);

  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    previousPage = page;
    setState(() {
      number = page;
    });
  }

  _reset() {
    print("Previous page: $number");
    _controller.repeat();
    _controller.forward();
    // setState(() {
    //   _controller.repeat(reverse: false);
    // });
    // avatarController.repeate();
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (BuildContext context) => super.widget));
  }

  @override
  void dispose() {
    _controller.repeat(reverse: false);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: SwipeDetector(
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  // pageSnapping: false,
                  // scrollDirection: Axis.vertical,
                  onPageChanged: _onPageViewChange,

                  // controller: _pageController,
                  children: [
                    Center(
                      child: ScaleTransition(
                        scale: _tween.animate(CurvedAnimation(
                            parent: _controller, curve: Curves.elasticOut)),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Text('dgegfd'),
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 80.0,
                          bottom: 80.0,
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Swipe Me!',
                              style: TextStyle(
                                fontSize: 40.0,
                              ),
                            ),
                            Text(
                              '$_swipeDirection',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 80.0,
                          bottom: 80.0,
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Second page',
                              style: TextStyle(
                                fontSize: 40.0,
                              ),
                            ),
                            Text(
                              '$_swipeDirection',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 80.0,
                          bottom: 80.0,
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Third page',
                              style: TextStyle(
                                fontSize: 40.0,
                              ),
                            ),
                            Text(
                              '$_swipeDirection',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                onSwipeUp: () {
                  setState(() {
                    _swipeDirection = "Swipe Up";
                    _reset();
                  });
                },
                onSwipeDown: () {
                  setState(() {
                    _swipeDirection = "Swipe Down";
                  });
                },
                onSwipeLeft: () {
                  setState(() {
                    _swipeDirection = "Swipe Left";
                  });
                },
                onSwipeRight: () {
                  setState(() {
                    _swipeDirection = "Swipe Right";
                  });
                },
                swipeConfiguration: SwipeConfiguration(
                    verticalSwipeMinVelocity: 100.0,
                    verticalSwipeMinDisplacement: 50.0,
                    verticalSwipeMaxWidthThreshold: 100.0,
                    horizontalSwipeMaxHeightThreshold: 50.0,
                    horizontalSwipeMinDisplacement: 50.0,
                    horizontalSwipeMinVelocity: 200.0),
              ),
            )
          ],
        ),
      ),
    )));
  }
}
