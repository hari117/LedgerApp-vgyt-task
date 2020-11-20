import 'package:flutter/material.dart';
import 'package:ledgerapp/screens/screenchat.dart';

class Venkat extends StatefulWidget {
  String friendName;
  Venkat({this.friendName});
  @override
  _VenkatState createState() => _VenkatState();


}

class _VenkatState extends State<Venkat> {

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()
      {
        print("venkatesh chat box clicked");
        Navigator.push(
            context, new MaterialPageRoute(
            builder: (context) => UserViewScreen(friendName:widget.friendName)));
      },
      child: Container(
        height: 70,
        color: Colors.blue,
        width: double.infinity,
        padding: EdgeInsets.only(left: 20),
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        alignment: Alignment.centerLeft,
        child: Text(widget.friendName),
      ),
    );
  }
}
