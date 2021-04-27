import 'package:flutter/material.dart';
import '../theme/style.dart';
import '../theme/theme.dart' as Theme;
import '../components/back.dart';

import 'loginhome_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  _showHomeItem(BuildContext context, String title) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: 87.w,
      height: 125.w,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Stack(children: [
        Image.asset(
          'assets/images/unit/course-board.png',
          fit: BoxFit.contain,
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 16.w,
                alignment: Alignment.center,
                child: Text(title,
                    style: TextStyle(
                        color: Theme.Colors.yellow200,
                        fontSize: height > 600 ? 25.sp : 30.sp,
                        fontFamily: 'UTMCooperBlack'),
                    textAlign: TextAlign.center))),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: width,
              height: height,
              decoration: backgroundImage,
              child: null,
            ),
            Container(
                height: height,
                decoration: blackBackground,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: TopButton(),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          _showHomeItem(
                            context,
                            'EASY',
                          ),
                          _showHomeItem(
                            context,
                            'MEDIUM',
                          ),
                          _showHomeItem(
                            context,
                            'ADVANCED',
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class TopButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Back(buttonImage: 'assets/images/button/close-button.png'),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                top: 13.5.w,
                right: 16.w,
                child: Image.asset(
                  'assets/images/button/add_short.png',
                  height: 13.5.w,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 10.w,
                right: 33.w,
                child: GestureDetector(
                    child: Container(
                        width: 20.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/button/vietnames-flag.png',
                              ),
                              fit: BoxFit.contain),
                        )),
                    onTap: () {}),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
