import 'package:flutter/material.dart';
import 'package:topkiddo/components/languages_app.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import '../../../components/back.dart';
import './../../../localization/language/languages.dart';
import '../../../components/languages_app.dart';
import 'design_course_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
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
                    Container(
                        width: width,
                        height: height,
                        child: Image.asset(
                            'assets/images/firework/firework1.png',
                            height: 80.w,
                            fit: BoxFit.contain)),
                    Center(
                        child: Container(
                            child: Image.asset(
                                'assets/images/lesson/text-completed.png',
                                height: 30.w,
                                fit: BoxFit.contain))),
                    TopButton(),
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
    double height = MediaQuery.of(context).size.height;
    return Container(
        height: 32.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Back(buttonImage: 'assets/images/button/close-button.png'),
            ),
          ],
        ));
  }
}
