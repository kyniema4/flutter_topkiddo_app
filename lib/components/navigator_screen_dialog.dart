import 'package:flutter/material.dart';
import '../Utils/styling.dart';

class NavigatorScreenDialog {
  static Future<bool> ShowPopNaviagation(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            // title: new Text('Are you sure?'),
            content: new Text('Do you want to continue the previous lesson'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('Cancel'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('OK'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
