import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguagesApp extends StatefulWidget {
  @override
  _LanguagesAppState createState() => _LanguagesAppState();
}

class _LanguagesAppState extends State<LanguagesApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.only(top: 9.w),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            top: 3.5.w,
            right: 16.w,
            child: Image.asset(
              'assets/images/button/add_short.png',
              height: 13.5.w,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
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
    );
  }
}
