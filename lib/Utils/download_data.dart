import 'dart:io' as Io;

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

import 'http_service.dart';

class HandleDownload {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future checkFileExists(String path) async {
    String dir = await _localPath;
    return await Io.File(dir + path).exists();
  }

  Future<dynamic> downloadFile(data, lessonId) async {
    String typeFile =
        data['localPath'].substring(data['localPath'].indexOf('.'));
    String dir = await _localPath;
    String subPath = "/$lessonId/${data['_id']}$typeFile";
    bool check = await checkFileExists(subPath);
    if (!check) {
      Io.File file = await Io.File('$dir' + '$subPath').create(recursive: true);
      
      String params =
          '?token=${(await getToken())}&resourceId=${data['_id']}&time=${DateTime.now().toString()}';

      try {
        var resultDownload = await fetch(
            url: BaseUrl + "resources/get_resource_from_local" + params,
            method: 5);

        var bytes = await resultDownload.bodyBytes; //close();
        await file.writeAsBytes(bytes);
        print(file.path);
        return true;
      } catch (e) {
        print('error downloadFile ' + e);
        return false;
      }
    } else {
      print('file is exists');
      // deleteFile(dir + subPath);
      return false;
    }
  }

  //test
  Future<dynamic> downloadFile2(data, lessonId) async {
    Dio dio = Dio();
    var typeFile = data['localPath'].substring(data['localPath'].indexOf('.'));
    String dir = await _localPath;
    String subPath = "/$lessonId/${data['_id']}$typeFile";
    bool check = await checkFileExists(subPath);
    if (!check) {
      //Io.File file = await Io.File('$dir' + '$subPath').create(recursive: true);
      String params =
          '?token=${(await getToken())}&resourceId=${data['_id']}&time=${DateTime.now().toString()}';
      try {
        await dio.download(
            BaseUrl + "resources/get_resource_from_local" + params,
            "${dir}/$lessonId/${data['_id']}$typeFile",
            onReceiveProgress: (rec, total) {
          print("Rec: $rec , Total: $total");
        });
      } catch (e) {
        print(params);
        print('error downloadFile ' + e);
      }
    } else {
      print('file is exists');
      // deleteFile(dir + subPath);
    }
  }

  Future getFileFromLocal(String subPath) async {
    //String file="/data/user/0/com.example.topkiddo/app_flutter/60b7862add38fc1918816a24/60b79aa1dd38fc1918818a26.mp3";
    String path = subPath;
    String dir = await _localPath;
    bool check = await checkFileExists(path);
    if (check) {
      return dir + path;
    } else {
      //fetch and save data again
    }
  }

  Future<int> deleteFile(String path) async {
    try {
      final file = await Io.File(path);

      await file.delete();
      print('delete complete');
    } catch (e) {
      return 0;
    }
  }

  Future<int> deleteAll() async {
    //   String dir = await _localPath;
    try {
      final dir = Io.Directory(await _localPath);
      dir.deleteSync(recursive: true);
      print('delete all data complete');
    } catch (e) {
      print('delete all erorr: ' + e);
    }
  }
}
