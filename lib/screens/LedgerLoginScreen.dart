import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LedgerLoginScreen extends StatefulWidget {
  @override
  _LedgerLoginScreenState createState() => _LedgerLoginScreenState();
}

class _LedgerLoginScreenState extends State<LedgerLoginScreen> {
  @override
  Widget build(BuildContext context) {
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
}
