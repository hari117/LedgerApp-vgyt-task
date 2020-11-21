import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ledgerapp/login_screen.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: allTranscationRef
            .doc(google.currentUser.id)
            .collection(google.currentUser.displayName)
            .snapshots(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return Center(
              child: Text("Wait a Second Fetching Data"),
            );
          }
           List<DocumentSnapshot> ds=snap.data.documents;
          for(DocumentSnapshot d in ds)
            {
              print(d.data());
            }
          return ListView.builder(
            itemBuilder: (context, index)
            {
              // print(snap.data.dcoument[index]);
            //  return Text(ds[index]["amount"]);
             return historyCard(ds[index]);
            },
            itemCount: ds.length,
           // itemCount: snap.data.documents.length,
          );
        },
      ),
    );
  }

  historyCard(DocumentSnapshot doc) {
    Color color;
    String amout;
    if("Debit"==doc["type"])
      {
        color=Colors.red;
        amout=" - ${doc["amount"]}";
      }
    else
      {
        amout=" + ${doc["amount"]}";
        color=Colors.green;
      }
    //Color color=doc["Credit"]=="Credit"?Colors.green:Colors.red;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      width: MediaQuery.of(context).size.width * .9,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          //background color of box
          BoxShadow(
            color: Colors.black12,
            blurRadius: 25.0, // soften the shadow
            spreadRadius: 10.0, //extend the shadow
            offset: Offset(
              15.0, // Move to right 10  horizontally
              15.0, // Move to bottom 10 Vertically
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            doc["senderName"],
            style: GoogleFonts.roboto(color: Colors.blue, fontSize: 17),
          ),
          Text(
            amout,
            style: GoogleFonts.roboto(color: color, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
