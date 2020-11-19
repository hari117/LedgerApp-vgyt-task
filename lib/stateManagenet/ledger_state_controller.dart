

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ledgerapp/domain/google_auth.dart';

class LedgerState extends ChangeNotifier
{

  bool isUserSignIn = false;

  GoogleSignInAccount googleSignInAccount;



   listenSignChanges()
   async{
     List a=await $gfun.onUserChangeAccoutListner();
     isUserSignIn=a[0];
     googleSignInAccount=a[1];
     notifyListeners();
   }

   loginSliently() async{
     List b=await $gfun.onUserslientlyLogin();
     isUserSignIn=b[0];
     googleSignInAccount=b[1];
     notifyListeners();

   }



}