import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/style.dart';
import 'loginhome_screen.dart';
class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  bool _pressed = true;
  bool _pressed2 = true;
  bool _pressed3 = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: backgroundImage,
            child: null,
          ),
          Container(
            decoration: blackBackground,
            height: height,
            child: Stack(
              children: <Widget>[
                TopButton(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 48.0),
                    Container(
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Stack(
                              overflow: Overflow.visible,
                              children: [
                                Image.asset('assets/images/topic/designed-courses.png',
                                  fit: BoxFit.contain,
                                  height: width / 3.18
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  height: width/22.5,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('LESSON', style: titleBoardHome,textAlign: TextAlign.center)
                                  )
                                ),
                                Positioned(
                                  top: width/15,
                                  left: 0,
                                  right: 0,
                                  height: width/12.5,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 25.0),
                                    alignment: Alignment.center,
                                    child: Text('Designed Courses', style: nameBoardHome,textAlign: TextAlign.center,)
                                  )
                                ),
                                Positioned(
                                  bottom: -12,
                                  left: 0,
                                  right: 0,
                                  height: width/22,
                                  child: AnimatedOpacity(opacity: _pressed ? 1.0 : 0.85,duration: Duration(milliseconds: 200),
                                    child: GestureDetector(
                                      child: Image.asset('assets/images/topic/choose-button.png', fit: BoxFit.contain),
                                      onTap: () {
                                        setState(() {
                                          _pressed = !_pressed;
                                        });
                                      }
                                    )
                                  )
                                )
                              ]
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Stack(
                              overflow: Overflow.visible,
                              children: [
                                Image.asset('assets/images/topic/flexible.png',
                                  fit: BoxFit.contain,
                                  height: width / 3.18
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  height: width/22.5,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('LESSON', style: titleBoardHome,textAlign: TextAlign.center)
                                  )
                                ),
                                Positioned(
                                  top: width/15,
                                  left: 0,
                                  right: 0,
                                  height: width/12.5,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 25.0),
                                    alignment: Alignment.center,
                                    child: Text('Flexible Learning', style: nameBoardHome,textAlign: TextAlign.center,)
                                  )
                                ),
                                 Positioned(
                                  bottom: -12,
                                  left: 0,
                                  right: 0,
                                  height: width/22,
                                  child: AnimatedOpacity(opacity: _pressed2 ? 1.0 : 0.85,duration: Duration(milliseconds: 200),
                                    child: GestureDetector(
                                      child: Image.asset('assets/images/topic/choose-button.png', fit: BoxFit.contain),
                                      onTap: () {
                                        setState(() {
                                          _pressed2 = !_pressed2;
                                        });
                                      }
                                    )
                                  )
                                )
                              ]
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Stack(
                              overflow: Overflow.visible,
                              children: [
                                Image.asset('assets/images/topic/expressions.png',
                                  fit: BoxFit.contain,
                                  height: width / 3.18
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  height: width/22.5,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('TRANSLATE', style: titleBoardHome,textAlign: TextAlign.center,)
                                  )
                                ),
                                Positioned(
                                  top: width/15,
                                  left: 0,
                                  right: 0,
                                  height: width/12.5,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 25.0),
                                    alignment: Alignment.center,
                                    child: Text('Expressions and Phrases', style: nameBoardHome,textAlign: TextAlign.center,)
                                  )
                                ),
                                Positioned(
                                  bottom: -12,
                                  left: 0,
                                  right: 0,
                                  height: width/22,
                                  child: AnimatedOpacity(opacity: _pressed3 ? 1.0 : 0.85,duration: Duration(milliseconds: 200),
                                    child: GestureDetector(
                                      child: Image.asset('assets/images/topic/choose-button.png', fit: BoxFit.contain),
                                      onTap: () {
                                        setState(() {
                                          _pressed3 = !_pressed3;
                                        });
                                      }
                                    )
                                  )
                                )
                              ]
                            )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}

class TopButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  Positioned(
      height: 50,
      width: width,
      top: 20,
      child: Container(
        //  decoration: BoxDecoration(
        //   color: Color.fromRGBO(207, 94, 65, 0.4),
        // ),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 142,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 0,
                    height: 27,
                    child: Image.asset('assets/images/button/bar-long.png', fit: BoxFit.fitHeight, height: 30,),
                  ),
                  Positioned(
                    right: 0,
                    width: 75,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginHomeScreen()));
                      }, 
                      child: Image.asset('assets/images/button/logout.png', fit: BoxFit.contain))
                  ),
                  Positioned(
                    left: 10,
                    width: 75,
                    child: FlatButton(onPressed: () {}, child: Image.asset('assets/images/button/menu-button.png', fit: BoxFit.contain,))
                  ),
                ]
              ),
            ),
          
            Container(
              width: 110,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Image.asset('assets/images/button/add_short.png', height: 30, fit: BoxFit.contain),
                  ),
                  Positioned(
                    left: -10,
                    width: 75,
                    child: FlatButton(onPressed: () {}, child: Image.asset('assets/images/button/vietnames-flag.png', fit: BoxFit.contain))
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}