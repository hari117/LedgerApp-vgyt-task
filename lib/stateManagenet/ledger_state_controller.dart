// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:ledgerapp/domain/google_auth.dart';
// import 'package:ledgerapp/main.dart';
//
// class LedgerState extends ChangeNotifier {
//   static LedgerState instance = LedgerState();
//   bool isUserSignIn = false;
//
//   GoogleSignInAccount googleSignInAccount;
//
//   clickSign() async {
//     $gfun.signInToCreateAccout();
//     listenSignChanges();
//   }
//
//   listenSignChanges() async {
//
//
//     logger.i("listensignchanges method called");
//     List a = await $gfun.onUserChangeAccoutListner();
//     isUserSignIn = a[0];
//     logger.i(isUserSignIn);
//     googleSignInAccount = a[1];
//     logger.i(googleSignInAccount);
//     notifyListeners();
//
//
//   }
//
//   loginSliently() async {
//     List b = await $gfun.onUserslientlyLogin();
//     isUserSignIn = b[0];
//     googleSignInAccount = b[1];
//     notifyListeners();
//   }
// }
