import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ledgerapp/add_user_screen.dart';
import 'package:ledgerapp/oldtask/createUserAccoutPage.dart';
import 'package:ledgerapp/oldtask/home_screen.dart';
import 'package:ledgerapp/newhome_screen.dart';
import 'package:ledgerapp/particular_user_screen.dart';


GoogleSignIn google = GoogleSignIn();
CollectionReference userAccountRef = Firestore.instance.collection(
    "UserAccouts");
CollectionReference allTranscationRef = Firestore.instance.collection(
    "Transactions");
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isAuth = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    google.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      hangleSignIn(account);

    });
    google.signInSilently().then((GoogleSignInAccount account) {
      hangleSignIn(account);
    });
  }

  hangleSignIn(GoogleSignInAccount account) {
    if (account != null) {
     // checkUsersInFireBase();
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }


  checkUsersInFireBase() async
  {
    DocumentSnapshot doc = await userAccountRef.document(
        google.currentUser.id).get();
    if (!doc.exists) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateAccout()),
      );

    }

  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? NewHomeScreen() : unAuthScreen();

  }

  unAuthScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.white54,
              onPressed: ()
              {
                googleLogin();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset("assets/svg/google.svg",width: 30,),
                  SizedBox(width: 10,),
                  Text(
                    "Google SignIn",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  googleLogin() {
    google.signIn();
  }
}
