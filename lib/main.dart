
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ledgerapp/oldtask/getit_locaters.dart';
import 'package:ledgerapp/login_screen.dart';
import 'package:ledgerapp/tempscreen.dart';

void main() async
{

  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(LedgerTask());
}


class LedgerTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DemoScreen(),);
  }
}








