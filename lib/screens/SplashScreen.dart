import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ledgerapp/main.dart';
import 'package:ledgerapp/screens/LedgerHomeScreen.dart';
import 'package:ledgerapp/screens/LedgerLoginScreen.dart';
import 'package:ledgerapp/stateManagenet/ledger_state_controller.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkInit();
  }

  checkInit() {

    Future.delayed(Duration.zero,(){
      Provider.of<LedgerState>(context,listen: false).listenSignChanges();
      Provider.of<LedgerState>(context,listen: false).listenSignChanges();
    });

  }

  @override
  Widget build(BuildContext context) {
   logger.i(" initial auth value is ${Provider.of<LedgerState>(context,listen: false).isUserSignIn}");
    return Consumer<LedgerState>(
      builder: (context, ls, child) {
        return ls.isUserSignIn ? LedgerHomeScreen() : LedgerLoginScreen();
      },
    );
  }
}
