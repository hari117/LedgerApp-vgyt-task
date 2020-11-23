import 'package:flutter/material.dart';
import 'package:ledgerapp/oldtask/addmoney_settings_page.dart';
import 'package:ledgerapp/particular_user_screen.dart';

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(

              height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: TextField(
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Name *",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.black45
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(5.0),
                    )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: TextField(
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: "MobileNumber *",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),

                          borderSide: BorderSide(
                              color: Colors.black45,

                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical:15 ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),

                          borderSide: BorderSide(
                            color: Colors.black45,

                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: TextField(
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),

                          borderSide: BorderSide(
                            color: Colors.black45,

                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),

                width: double.infinity,

                child: FlatButton(
                  shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)),
                  height: 50,
                    onPressed:()
                    {
                      print("add button is pressed");


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ParticularUserScreen()),
                      );




                },
                    color: Colors.blue,
                    child: Text("ADD")

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
