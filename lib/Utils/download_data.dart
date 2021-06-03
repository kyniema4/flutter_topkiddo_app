import 'dart:io' as Io;

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'http_service.dart';

class HandleDownload {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future checkFileExists(String path) async {
    return await Io.File(path).exists();
  }

  Future<dynamic> downloadFile(data, lessonId) async {
    var typeFile = data['localPath'].substring(data['localPath'].indexOf('.'));
    String dir = await _localPath;
    String subPath = "/$lessonId/${data['_id']}$typeFile";
    bool check = await checkFileExists(dir + subPath);

    if (!check) {
      Io.File file = await Io.File('$dir' + '$subPath').create(recursive: true);
      print(file);
      print('debugging');
      String params =
          '?token=${(await getToken())}&resourceId=${data['_id']}&time=${DateTime.now().toString()}';
      try {
        var resultDownload = await fetch(
            url: BaseUrl + "resources/get_resource_from_local" + params,
            method: 5);
        print('debugging');
        var bytes = await resultDownload.bodyBytes; //close();
        // await file.writeAsBytes(bytes);
        print(file.path);
        print('debugging');
      } catch (e) {
        print('error downloadFile ' + e);
      }
    } else {
      print('file is exists');
      // deleteFile(dir + subPath);
    }
  }

  Future getFileFromLocal() {}

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
      final dir= Io.Directory(await _localPath);
      dir.deleteSync(recursive:true);
      print('delete all data complete');
    } catch (e) {
     print('delete all erorr: '+e);
    }
  }
}
