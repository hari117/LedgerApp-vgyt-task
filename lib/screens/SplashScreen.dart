import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ledgerapp/screens/LedgerHomeScreen.dart';
import 'package:ledgerapp/screens/LedgerLoginScreen.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isUserSignIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ls,child)
      {
        return isUserSignIn ? LedgerHomeScreen() : LedgerLoginScreen();
      },

    );
  }

}
