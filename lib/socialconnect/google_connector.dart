import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:topkiddo/Utils/http_service.dart';

 
Future<int> loginGoogle() async {
  // Trigger the authentication flow

  try {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    print('debugging');    
    // var result = await fetch(url: ApiList.signinGoogle, body: {
    //   "accessToken": googleSignInAuthentication.accessToken,
    //   "idToken": googleSignInAuthentication.idToken,
    // });
    // print('result register ' + jsonEncode(result));
    
    // if (result['success']) {
    //   String token = result['data']['token'];
    //   print('token la ' + token);
    //   setToken(token);
    //   if (result['data']['user']['email'] == null) {
    //     return 2;
    //   }
    //   return 1;
    // }

    // return 0;
   
  } catch (err) {
    return 0;
  }
}