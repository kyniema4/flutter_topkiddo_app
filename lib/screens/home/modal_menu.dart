import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../theme/theme.dart' as Theme;
import '.../../menu/write-for-kids.dart';
import '.../../profile/profile-father-screen.dart';
import '.../../profile/profile-kid-screen.dart';
import '.../../profile/profile-add-child-screen.dart';
import '.../../menu/notification-screen.dart';
import '.../../modal-notification.dart';
import '.../../menu/setting-screen.dart';

class Menu {
  final String icon;
  final String title;
  final dynamic page;

  Menu({this.icon, this.title, this.page});
}

class ModalMenu extends StatefulWidget {
  @override
  _ModalMenuState createState() => _ModalMenuState();
}

class _ModalMenuState extends State<ModalMenu> {
  List<Menu> menuLists = [
    Menu(
      icon: 'assets/images/menu/notificationbutton.png',
      title: 'notification'.tr(),
      page: NotificationScreen(),
      // page: ModalNotification(),
    ),
    Menu(
      icon: 'assets/images/menu/profilebutton.png',
      title: 'profile'.tr(),
      page: ProfileFatherScreen(),
    ),
    Menu(
      icon: 'assets/images/menu/parentsbutton.png',
      title: 'parent'.tr(),
      page: ProfileKidScreen(),
    ),
    Menu(
      icon: 'assets/images/menu/profilebutton.png',
      title: 'addChild'.tr(),
      page: ProfileAddChildScreen(),
    ),
    Menu(
      icon: 'assets/images/menu/settingbutton.png',
      title: 'setting'.tr(),
      page: SettingScreen(),
    ),
    Menu(
      icon: 'assets/images/menu/writeforkidbutton.png',
      title: 'writeForKid'.tr(),
      page: WriteForKidsScreen(),
    ),
    Menu(
      icon: 'assets/images/menu/library.png',
      title: 'library'.tr(),
      page: Container(),
    ),
    Menu(
      icon: 'assets/images/menu/entercodebutton.png',
      title: 'enterCode'.tr(),
      page: Container(),
    ),
    Menu(
      icon: 'assets/images/menu/subscribebutton.png',
      title: 'subscribe'.tr(),
      page: Container(),
    ),
    Menu(
      icon: 'assets/images/menu/logout.png',
      title: 'logout'.tr(),
      page: Container(),
    ),
  ];
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
                height: 65.w,
                width: width - 18.w,
                child: ListView.builder(
                    padding: EdgeInsets.only(
                      left: 7.w,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: menuLists.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Menu menu = menuLists[index];
                      return Container(
                          margin: new EdgeInsets.only(
                            right: 20.w,
                          ),
                          width: 40.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  child: Container(
                                    width: 30.w,
                                    child: Image.asset(
                                      menu.icon,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                menu.page));
                                  }),
                              Container(
                                height: 17.w,
                                child: Text(
                                  menu.title,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: height > 600 ? 18.sp : 24.sp,
                                      fontFamily: 'UTMCooperBlack',
                                      fontWeight: FontWeight.w900,
                                      color: Theme.Colors.orange100,
                                      letterSpacing: 0.7),
                                ),
                              )
                            ],
                          ));
                    }),
              )),
          Positioned(
              bottom: 55.w,
              right: 20.w,
              child: Container(
                  width: 13.w,
                  child: GestureDetector(
                      child: Image.asset(
                        'assets/images/menu/dropdown.png',
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        Navigator.pop(context, false);
                      }))),
        ],
      )),
    );
  }
}
