import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../theme/theme.dart' as Theme;

class ModalMenu extends StatefulWidget {
  @override
  _ModalMenuState createState() => _ModalMenuState();
}

class _ModalMenuState extends State<ModalMenu> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.48),
      body: Container(
          // color: Colors.red,
          child: Stack(
        children: [
          Positioned(
              left: 20.w,
              bottom: -2.w,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.w),
                  ),
                  border: Border.all(
                    width: 2.w,
                    color: Theme.Colors.green200,
                  ),
                  color: Theme.Colors.green400,
                ),
                height: 60.w,
                width: width - 18.w,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                        Container(
                            child: Column(
                          children: [
                            Container(
                              width: 20.w,
                              child: Image.asset(
                                'assets/images/menu/notificationbutton.png',
                              ),
                            ),
                            Text('nobdagf')
                          ],
                        )),
                      ],
                    )
                  ],
                ),
              )),
          Positioned(
              bottom: 50.w,
              right: 20.w,
              child: Container(
                width: 13.w,
                child: Image.asset(
                  'assets/images/menu/dropdown.png',
                ),
              )),
        ],
      )),
    );
  }
}
