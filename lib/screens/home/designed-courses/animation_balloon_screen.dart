import 'package:flutter/material.dart';
import '../../../theme/style.dart';
import '../../../theme/theme.dart' as Theme;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationBalloonScreen extends StatefulWidget {
  @override
  _AnimationBalloonScreen createState() => _AnimationBalloonScreen();
}

class _AnimationBalloonScreen extends State<AnimationBalloonScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // color: Colors.red,
            width: 0.26.sw,
            padding: EdgeInsets.only(top: 3.w),
            child: Image.asset(
                'assets/images/balloon/orange_balloon/orange-airballoon-1.png',
                // width: 0.25.sw,
                fit: BoxFit.contain),
          ),
          Container(
            // color: Colors.yellow,
            width: 0.26.sw,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.only(bottom: 35.w),
            child: Image.asset(
                'assets/images/balloon/red_balloon/red-airballoon-1.png',
                // width: 0.25.sw,
                fit: BoxFit.contain),
          ),
          Container(
            // color: Colors.blue,
            width: 0.26.sw,
            padding: EdgeInsets.only(top: 15.w),
            child: Image.asset(
                'assets/images/balloon/blue_balloon/blue-airballoon-1.png',
                //ảnh từ 1 đến 15ç
                fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
