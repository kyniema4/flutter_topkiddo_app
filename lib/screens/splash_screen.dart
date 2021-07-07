import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topkiddo/Utils/http_service.dart';
import 'package:topkiddo/screens/home/home_screen.dart';
import './new_game/loginhome_screen.dart';
import '../theme/style.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => checkGetProfile(context).then((val) {
              if (val == true) {
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(
                      builder: (BuildContext context) {
                        return HomeScreen();
                      },
                    ),
                    (_) => true,
                  );
                });
              } else {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => LoginHomeScreen()));
              }
            }));
    // Timer(
    //     Duration(seconds: 6),
    //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //         builder: (BuildContext context) => LoginHomeScreen())));
  }

  checkGetProfile(context) async {
    var token = (await getToken()).toString();
    print('token ' + token);
    print(token.runtimeType);
    print('debugging');
    if (token.length > 0 && token != "null") {
      // try {
      //   var resultProfile = await fetch(url: ApiList.getProfile);
      //   print('result get profile ' + jsonEncode(resultProfile));
      //   return resultProfile;
      // } catch (err) {
      //   return;
      // }
      return true;
    } else {
      return false;
    }
  }

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
            child: Center(
              child: Image.asset(
                'assets/images/namegame.png',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width / 2.5,
                // height: MediaQuery.of(context).size.height / 1.7
              ),
            ),
          ),
        ],
      ),
    );
  }
}
