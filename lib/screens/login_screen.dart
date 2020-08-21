import 'package:flutter/material.dart';
import '../theme/style.dart';
import '../components/back.dart';
import '../components/settings.dart';
import 'home_screen.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: backgroundImage,
            child: null,
          ),
          Container(
              // color: Color.fromRGBO(0, 0, 0, 0.49),
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
                        // decoration: new BoxDecoration(color: Colors.red),
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 292,
                          width: 285,
                          decoration: new BoxDecoration(color: Colors.pink),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 0,
                                right: 0,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/images/login_page/loginboard.png',
                                    height: 275,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 8,
                                  left: 0,
                                  right: 0,
                                  child: Text('LOGIN',
                                      textAlign: TextAlign.center,
                                      style: styleTitle)),
                              Positioned(
                                child: Container(
                                  height: 40,
                                  margin: new EdgeInsets.only(
                                      top: 49.0, left: 45, right: 45),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    autofocus: false,
                                    style: styleTextInput,
                                    decoration: InputDecoration(
                                        contentPadding: contentPadding,
                                        focusedBorder: styleOutline,
                                        enabledBorder: styleUnderline,
                                        border: InputBorder.none,
                                        hintText: 'Phone number',
                                        hintStyle: styleTextInput),
                                  ),
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  height: 40,
                                  margin: new EdgeInsets.only(
                                      top: 96.0, left: 45, right: 45),
                                  child: TextField(
                                    obscureText: true,
                                    autofocus: false,
                                    style: styleTextInput,
                                    decoration: InputDecoration(
                                        contentPadding: contentPadding,
                                        focusedBorder: styleOutline,
                                        enabledBorder: styleUnderline,
                                        border: InputBorder.none,
                                        hintText: 'Password',
                                        hintStyle: styleTextInput),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 70,
                                right: 0.0,
                                left: 0.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/login_page/fb-button.png',
                                                  ),
                                                  fit: BoxFit.fitWidth),
                                              // button text
                                            )),
                                        onTap: () {
                                          print("");
                                        }),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    GestureDetector(
                                        child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/login_page/g+button.png',
                                                  ),
                                                  fit: BoxFit.fitWidth),
                                              // button text
                                            )),
                                        onTap: () {
                                          print("");
                                        }),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0.0,
                                left: 0.0,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                      child: Container(
                                          width: 160,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            // color: Colors.grey,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/login_page/loginbutton1.png',
                                                ),
                                                fit: BoxFit.fitWidth),
                                            // button text
                                          )),
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                                      }),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                  ),
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
