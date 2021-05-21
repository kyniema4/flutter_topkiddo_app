import 'package:flutter/material.dart';
import './test1.dart';

class Test3Screen extends StatefulWidget {
  @override
  _Test3PageState createState() => _Test3PageState();
  // final Function() onSwipeUp;
}

class _Test3PageState extends State<Test3Screen> {
  String _swipeDirection = "";
  int number = 0;
  int _lastReportedPage = 0;

  void initState() {
    super.initState();
  }

  final _pageController = PageController(initialPage: 0);

  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    _lastReportedPage == page.toString();
  }

  _reset() {
    print("lastReportedPage");
    print(_lastReportedPage);
    if (_lastReportedPage == 1) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => super.widget));
    }
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: SwipeDetector(
                child: PageView(
                  onPageChanged: _onPageViewChange,
                  controller: _pageController,
                  children: [
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
