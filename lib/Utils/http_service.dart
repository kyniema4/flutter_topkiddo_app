import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

final BaseUrl = "http://backend.topkiddovn.com/";
String token = '';

class ApiList {
  static const signinFacebook = 'users/signin_with_facebook';
  static const signinGoogle = 'users/login_with_google';
  static const signWithPhone = 'users/login';
  static const signupWithPhone = 'users/signup_with_phone';
  static const getProfile = 'users/get_my_profile';
  static const getListUnit = 'lessions/get_list_units';
  static const getListLesson = 'lessions/get_list_lession';
}

void setToken(_token) async {
  token = _token;
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('token', token);
}

void deleteToken() async {
  token = '';
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.remove("token");
}

Future<String> getToken() async {
  if (token.length < 2) {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString('token');
  }
  print(token);
  return token;
}

Future fetch(
    {url = '',
    method = 1,
    Map<String, String> headers,
    body,
    newUrl,
    needAutoHeader = true,
    bool needReturnErrorCode = false}) async {
  var baseUrl = '';
  if (url != '' && url.indexOf('http://') < 0 && url.indexOf('https://') < 0) {
    baseUrl = BaseUrl;
  }
  if (newUrl != null) {
    baseUrl = newUrl;
  }
  if (headers == null) {
    headers = {};
  }
  if (headers['Content-Type'] == null) {
    headers['Content-Type'] = 'application/json';
  }
  if (needAutoHeader && headers['authorization'] == null) {
    try {
      headers['authorization'] = (await getToken()).toString();
    } catch (err) {
      print(err);
    }
  }
  // print("fetch to url " + baseUrl + url + ' headers=' + jsonEncode(headers));
  try {
    if (method == 1) {
      // post
      http.Response response = await http.post(Uri.parse(baseUrl + url),
          headers: headers, body: body != null ? jsonEncode(body) : '');
      if (response.statusCode == 200) {
        // print('body 200 ' + response.body + ' from url ' + url);
        return jsonDecode(response.body);
      } else {
        if (response.statusCode == 400) {
          print('body 400 ' + response.body + ' from url ' + url);
          if (needReturnErrorCode) {
            return jsonDecode(response.body);
          }
        }
        print('print $headers');
        throw Exception('Failed to load data from ' + url);
      }
    } else if (method == 3) {
      // path
      http.Response response = await http.patch(Uri.parse(baseUrl + url),
          headers: headers, body: body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to patch');
      }
    } else if (method == 4) {
      // delete
      var request = http.Request('DELETE', Uri.parse(baseUrl + url));
      request.body = body;
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return response.stream;
      } else {
        throw Exception('Failed to load data from ' + url);
      }
    } else {
      // get

      http.Response response = await http.get(
        Uri.parse(baseUrl + url),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get data from ' + url);
      }
    }
  } on TimeoutException catch (e) {
    print('Timeout Error: $e');
  } on SocketException catch (e) {
    print('Socket Error: $e');
  } on Error catch (e) {
    print('General Error: $e');
  }
}
