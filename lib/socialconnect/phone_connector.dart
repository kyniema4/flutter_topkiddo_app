// import 'package:firebase_auth/firebase_auth.dart';

// Future<int> loginPhone() async {
//   String phoneNumber = "+84772026582";

//   void verificationCompleted(phoneAuthCredential) {
//     print(phoneAuthCredential);
//   }

//   void verificationFailed(AuthException error) {
//     print(error);
//   }

//   void codeSent(String verificationId, [int code]) {
//     print(verificationId);
//     print(code);
//   }

//   void codeAutoRetrievalTimeout(String verificationId) {
//     print(verificationId);
//   }

//   print('debugging');
//   await FirebaseAuth.instance.verifyPhoneNumber(
//     phoneNumber: phoneNumber,
//     timeout: Duration(milliseconds: 10000),
//     verificationCompleted: verificationCompleted,
//     verificationFailed: verificationFailed,
//     codeSent: codeSent,
//     codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//   );
// }
