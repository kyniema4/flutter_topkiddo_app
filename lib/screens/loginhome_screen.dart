import 'package:flutter/material.dart';
import '../theme/style.dart';
import '../theme/theme.dart' as Theme;
import '../components/settings.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                      flex: 3,
                      child: Container(
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/namegame.png',
                              fit: BoxFit.contain,
                              width: width / 3.1,
                              // height: height > 600 ? 230 : 140,
                            ),
                            SizedBox(
                              height: 8.w,
                            ),
                            GestureDetector(
                              child: Container(
                                  width: 90.w,
                                  height: 22.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/login_page/main-loginbutton.png"),
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
                                    width: 90.w,
                                    height: 22.w,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/login_page/main-newuserbutton.png"),
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
                    flex: 2,
                    child: Settings(),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
