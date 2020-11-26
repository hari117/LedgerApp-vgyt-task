import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  GoogleSignIn _googleSignIn= GoogleSignIn();
  bool isAuth = false;
       @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((event) {
      if(event != null)
        {
        setState(() {
          isAuth=true;
        });
        }
      else
        {
          isAuth=false;
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return isAuth ? homescreen() : loginScreen();
  }

  login()
  async{
         print("login funtion triggred");
   await _googleSignIn.signIn();
  }
  loginScreen() {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: InkWell(
          onTap: (){
            login();
          },
            child: Text("hello boi"),
        ),
      ),
    );
  }

  homescreen() {
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }

}

