import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ledgerapp/friends/venkat_dart.dart';
import 'package:ledgerapp/main.dart';

class HomeScreen extends StatefulWidget {
  String name;
  String imgUrl;
  String emailId;
  HomeScreen({this.name, this.imgUrl, this.emailId});


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Venkat(),
        ],
      ),
      drawer: Drawer(
        child: Container(
          width: 100,
          color: Colors.teal,
          child: Column(
            children: [
              Container(
                width: 100,
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: CircleAvatar(
                  maxRadius: 70,
                  backgroundImage:
                      NetworkImage(googleSignIn.currentUser.photoUrl),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                googleSignIn.currentUser.displayName,
                style: GoogleFonts.muli(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                googleSignIn.currentUser.email,
                style: GoogleFonts.muli(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.1),
              ),
              SizedBox(
                height: 70,
              ),
              MaterialButton(
                color: Colors.cyan,
                onPressed: () {
                  Navigator.pop(context);

                  googleSignIn.signOut();
                },
                child: Text(
                  "Log Out",
                  style: GoogleFonts.muli(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),

      ),
    );
  }
}
