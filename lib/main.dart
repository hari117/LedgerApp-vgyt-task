import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ledgerapp/screens/home_screen.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();
GoogleSignIn googleSignIn = GoogleSignIn();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LegderAppTask());
}

class LegderAppTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashBoard(),
    );
  }
}

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {

  bool isAuth = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount accout) {
      if (accout != null) {
        setState(() {
          isAuth = true;
        });
      } else {
        setState(() {
          isAuth = false;
        });
      }
    });

    googleSignIn.signInSilently().then((account) {
      if (account != null) {
        setState(() {
          isAuth = true;
        });
      } else {
        setState(() {
          isAuth = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? HomeScreen() : loginScreen();
  }


  loginScreen() {
    return Scaffold(
      backgroundColor: Color(0xFFf1f6f9),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create Ledger Accout",
              style: GoogleFonts.muli(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.1),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              color: Color(0xFF394867),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              minWidth: 100,
              height: 44,
              onPressed: () {
                login();
              },
              child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/svg/google.svg",
                    width: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Google Sign In",
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }
}
