import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ledgerapp/add_user_screen.dart';
import 'package:ledgerapp/login_screen.dart';
import 'package:ledgerapp/main.dart';
import 'package:ledgerapp/particular_user_screen.dart';

class NewHomeScreen extends StatefulWidget {
  @override
  _NewHomeScreenState createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 30,
        child: Container(

          child: Padding(
            padding: EdgeInsets.only(left:10),
            child: Column(
              children: [

                SizedBox(
                  height: 25,
                ),
                CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: NetworkImage(google.currentUser.photoUrl),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(google.currentUser.displayName,style: GoogleFonts.muli(fontSize: 22,letterSpacing: 1),),
                SizedBox(
                  height: 15,
                ),
                Text(google.currentUser.email,style: GoogleFonts.muli(fontSize: 14,letterSpacing: 1),),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(onPressed: (){
                google.signOut();
                },
                  child: Text("Sign Out",style: GoogleFonts.muli(fontSize: 18,letterSpacing: 1,color: Colors.white),),
                  height: 50,
                  color: Colors.blue,
                  minWidth: 150,

                )
              ],
            ),
          ),
        ),
      ),
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
      floatingActionButton: FloatingActionButton(
        elevation: 12,
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: ()
        {
          Navigator.push(
              context, new MaterialPageRoute(
              builder: (context) => CreateUser()));
        },
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
                              border: Border.all(
                                color: Colors.white,
                                width: 1
                              )
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('\$100  \nCredit',style:GoogleFonts.muli(color:Colors.white,fontSize: 14,letterSpacing: 1.1),),


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
                                border: Border.all(
                                    color: Colors.white,
                                    width: 1
                                )
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('\$100 \nDebit',style:GoogleFonts.muli(color:Colors.white,fontSize: 14,letterSpacing: 1.1),),


                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),


            ListView.builder(
              primary: false,
              itemBuilder: (context, index)
              {
                return  InkWell(
                  onTap: ()
                  {
                    Navigator.push(
                        context, new MaterialPageRoute(
                        builder: (context) => ParticularUserScreen()));
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
                        ]),
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
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: Text("A",style: GoogleFonts.muli(color: Colors.white,fontSize: 22),),
                            ),
                            SizedBox(width: 9,),
                            Text(
                              "Venkatesh \n8608602032",
                              style: GoogleFonts.muli(letterSpacing: 1.1),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_upward_rounded,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "\$100 Rs",
                                  style: GoogleFonts.muli(),
                                ),
                              ],
                            ),SizedBox(width: 10,),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: Colors.black45
                                  )
                              ),

                              child: Icon(Icons.chevron_right),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: 20,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
