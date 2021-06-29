import 'package:flutter/material.dart';
import '../Utils/styling.dart';

class Dialogs {
  static Future<void> showLoadingDialog(BuildContext context) async {
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              child: SimpleDialog(
                  elevation: 0,
                  //key: key,
                  backgroundColor: AppTheme.appBarColor,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(color: AppTheme.txtColor),
                        )
                      ]),
                    )
                  ]),
            ),
          );
        });
  }

  // static Future<void> showLoadingDialog(
  //   BuildContext context, GlobalKey key) async {
  //     return showDialog<void>(
  //       context: context,
  //       barrierDismissible: true,
  //       builder: (BuildContext context) {
  //         return new WillPopScope(
  //           onWillPop: () async => false,
  //             child: SimpleDialog(
  //               elevation: 0,
  //                 key: key,
  //                 backgroundColor: AppTheme.appBarColor,
  //                 children: <Widget>[
  //                   Center(
  //                     child: Column(children: [
  //                       CircularProgressIndicator(),
  //                       SizedBox(height: 20,),
  //                       Text("Please Wait....",style: TextStyle(color: AppTheme.txtColor),)
  //                     ]),
  //                   )
  //                 ]
  //             ),
  //           );
  //         });
  // }
  
}
