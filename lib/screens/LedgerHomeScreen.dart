import 'package:flutter/material.dart';

class LedgerHomeScreen extends StatefulWidget {
  @override
  _LedgerHomeScreenState createState() => _LedgerHomeScreenState();
}

class _LedgerHomeScreenState extends State<LedgerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text("user is signed"),
      ),
    );
  }
}
