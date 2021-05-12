import 'package:flutter/material.dart';
import '../../theme/style.dart';
import '../../components/settings.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: backgroundImage,
            child: null,
          ),
          Container(
              decoration: blackBackground,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                      child: Container(
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            'assets/images/namegame.png',
                            width: width / 3,
                            // height: height > 600 ? 230 : 140,
                          ),
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        GestureDetector(
                          child: Container(
                              width: 96.w,
                              height: 23.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("imgLoginMain".tr()),
                                    fit: BoxFit.fitWidth),
                                // button text
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginScreen()));
                          },
                        ),
                        SizedBox(
                          height: 4.w,
                        ),
                        GestureDetector(
                            child: Container(
                                width: 96.w,
                                height: 23.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('imgNewUser'.tr()),
                                      fit: BoxFit.fitWidth),
                                  // button text
                                )),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          RegisterScreen()));
                            })
                      ],
                    )),
                  )),
                  Expanded(
                    // flex: 2,
                    child: Settings(),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
