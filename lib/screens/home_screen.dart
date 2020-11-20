import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ledgerapp/friends/venkat_dart.dart';
import 'package:ledgerapp/main.dart';
import 'package:ledgerapp/models/locator.dart';
import 'package:ledgerapp/models/user_model.dart';
import 'package:ledgerapp/screens/dashboard_screen.dart';
import 'package:ledgerapp/stateManagenet/allmembers.dart';

class HomeScreen extends StatefulWidget {
  String name;
  String imgUrl;
  String emailId;

  HomeScreen({this.name, this.imgUrl, this.emailId});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      // body: ListView(
      //   children: [
      //     Venkat(),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: instance<Members>().collectionOfUsers.length,
        itemBuilder: (context, index) {
          User user = instance<Members>().collectionOfUsers[index];
          return Venkat(
            friendName: user.name,
          );
        },
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
                height: 40,
              ),
              InkWell(
                onTap: ()
                {
                  Navigator.push(
                      context, new MaterialPageRoute(
                      builder: (context) =>DashBoardScreen()));
                },
                child: Container(
                  height: 30,
                  child: Text(
                    "DashBoard",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.6,
                        fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              MaterialButton(
                color: Colors.cyan,
                onPressed: ()
                {
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
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .7,
                        height: MediaQuery.of(context).size.height * .2,
                        color: Colors.cyan,
                        child: Column(
                          children: [
                            TextField(
                              onTap: () {},
                              controller: textEditingController,
                              decoration: InputDecoration(
                                hintText: "Hint text sample",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                            ),
                            OutlineButton(
                              child: Text("sumbit to store"),
                              onPressed: () {
                                User u = User();
                                u.name = textEditingController.text;
                                instance<Members>().collectionOfUsers.add(u);
                                Navigator.pop(context);
                                textEditingController.clear();
                                print(instance<Members>()
                                    .collectionOfUsers
                                    .length);
                                setState(() {});
                                //   Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
      ),
    );
  }
}
