import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ledgerapp/login_screen.dart';
import 'package:ledgerapp/particular_user_screen.dart';

class UserCard extends StatefulWidget {
  String doc;

  UserCard({this.doc});

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) => ParticularUserScreen(name: widget.doc),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black45,
              offset: Offset(
                7.0, // Move to right 10  horizontally
                7.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 35,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    "${widget.doc[0]}",
                    style: GoogleFonts.muli(color: Colors.white, fontSize: 22),
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  "${widget.doc}",
                  style: GoogleFonts.muli(letterSpacing: 1.1),
                ),
              ],
            ),
            Row(
              children: [
                overAllDebitAndCreditAmount(),

                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black45)),
                  child: Icon(Icons.chevron_right),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  overAllDebitAndCreditAmount()
  {
    return StreamBuilder(
      stream:allUsersListRef.snapshots(),
      builder:(context,snap)
      {
        if(!snap.hasData)
        {
          return Text("Loading");
        }
        List<DocumentSnapshot> doc=snap.data.documents;
        for(DocumentSnapshot dc in doc)
        {
          if(widget.doc==dc["name"])
          {
            int total=0;
            int a=dc["inCredit"];
            int b=dc["inDebit"];
            int c=a-b;
            //print("**************************** $a ************************************");
            //print("**************************** $b ************************************");
            if(a>b)
            {
              //print("************************* condition matched 1: **************************");
              return Text(
                "\$ $c Rs",
                style: GoogleFonts.muli(
                    letterSpacing: 1,
                    fontSize: 20,
                    color: Colors.green),
              );
            }
            else
            {
              //print("************************* condition matched 2: **************************");
              return Text(
                "\$ $c Rs",
                style: GoogleFonts.muli(
                    letterSpacing: 1,
                    fontSize: 20,
                    color: Colors.red),
              );
            }
          }
        }
        return null;
      },
    );
  }
}
