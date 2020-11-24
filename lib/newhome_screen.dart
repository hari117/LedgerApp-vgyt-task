import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ledgerapp/add_user_screen.dart';
import 'package:ledgerapp/login_screen.dart';
import 'package:ledgerapp/main.dart';
import 'package:ledgerapp/particular_user_screen.dart';
import 'package:ledgerapp/transcation_screen.dart';
import 'package:ledgerapp/usercard_widget.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class NewHomeScreen extends StatefulWidget {
  @override
  _NewHomeScreenState createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   elevation: 30,
      //   child: Container(
      //
      //     child: Padding(
      //       padding: EdgeInsets.only(left:10),
      //       child: Column(
      //         children: [
      //
      //           SizedBox(
      //             height: 25,
      //           ),
      //           CircleAvatar(
      //             maxRadius: 50,
      //             backgroundImage: NetworkImage(google.currentUser.photoUrl),
      //           ),
      //           SizedBox(
      //             height: 15,
      //           ),
      //           Text(google.currentUser.displayName,style: GoogleFonts.muli(fontSize: 22,letterSpacing: 1),),
      //           SizedBox(
      //             height: 15,
      //           ),
      //           Text(google.currentUser.email,style: GoogleFonts.muli(fontSize: 14,letterSpacing: 1),),
      //           SizedBox(
      //             height: 30,
      //           ),
      //           MaterialButton(onPressed: (){
      //           google.signOut();
      //           },
      //             child: Text("Sign Out",style: GoogleFonts.muli(fontSize: 18,letterSpacing: 1,color: Colors.white),),
      //             height: 50,
      //             color: Colors.blue,
      //             minWidth: 150,
      //
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Ledger Book",
          style: GoogleFonts.muli(letterSpacing: 1.2),
        ),
        backgroundColor: Colors.blue,
        elevation: 0.0,
        centerTitle: false,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .2,
              color: Colors.blue,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Hari Krishna.S",
                    style: GoogleFonts.muli(
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.arrow_upward_rounded,
                              size: 50,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '\$100  \nCredit',
                            style: GoogleFonts.muli(
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 1.1),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.arrow_downward,
                              size: 50,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '\$100 \nDebit',
                            style: GoogleFonts.muli(
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 1.1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            StreamBuilder(
              stream:allUsersListRef.snapshots(),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return Center(
                    child: Text("Wait Data is Loading"),
                  );
                }
                List<DocumentSnapshot> doc=snap.data.documents;
                return ListView.builder(

                  primary: false,
                    shrinkWrap: true,

                    itemCount: snap.data.documents.length,
                    itemBuilder: (context, index) {
                    String userName=doc[index]["name"];
                    return UserCard(doc:userName,);

                    });
              },
            )


          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        child: Icon(Icons.accessibility_rounded),
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            label: "Add User",
            backgroundColor: Colors.blue,
            onTap: ()
              {
                Navigator.push(
                    context, new MaterialPageRoute(
                    builder: (context) => CreateUser()));


              }
          ),
          SpeedDialChild(

            backgroundColor: Colors.blue,
              child: Icon(Icons.monetization_on),
              label: "Transcation",
              onTap:()
              {
                Navigator.push(
                    context, new MaterialPageRoute(
                    builder: (context) => TranscationScreen(name:null,)));
              }
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   elevation: 12,
      //   backgroundColor: Colors.blue,
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {
      //     Navigator.push(context,
      //         new MaterialPageRoute(builder: (context) => CreateUser()));
      //   },
      // ),
    );
  }
}
