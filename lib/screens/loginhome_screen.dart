import 'package:flutter/material.dart';
import '../theme/style.dart';
import '../components/back.dart';
import '../components/settings.dart';
import 'login_screen.dart';

class LoginHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    child: Back(),
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
                              height: 140,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            GestureDetector(
                              child: Container(
                                  width: 200,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    // color: Colors.black,
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
                              height: 15.0,
                            ),
                            GestureDetector(
                                child: Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/login_page/main-newuserbutton.png"),
                                          fit: BoxFit.fitWidth),
                                      // button text
                                    )),
                                onTap: () {
                                  print("you clicked my");
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
