import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ledgerapp/screens/LedgerHomeScreen.dart';
import 'package:ledgerapp/screens/SplashScreen.dart';
import 'package:ledgerapp/stateManagenet/ledger_state_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LegderAppTask());
}

class LegderAppTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LedgerState>(
      create: (_) => LedgerState(),
      child: MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
