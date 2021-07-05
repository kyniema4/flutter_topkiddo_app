import 'package:flutter/material.dart';
import '../Utils/styling.dart';
import 'package:easy_localization/easy_localization.dart';

class LessonDialog {
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

  Future<bool> learningDifferenceLesson(
      BuildContext context, String lesson) async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            // title: new Text('Are you sure?'),
            content:
                Text('learningDifferenceLesson'.tr(args: [lesson??"", lesson??""])),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('OK'),
              ),
            ],
          ),
        ));
  }

  Future<bool> previousLearningInLesson(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        // title: new Text('Are you sure?'),
        content: Text('previousLearningInLesson'.tr()),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Last Slide'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Beginning'),
          ),
        ],
      ),
    ));
  }
}
