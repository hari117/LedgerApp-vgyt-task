import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParticularUserScreen extends StatefulWidget {
  @override
  _ParticularUserScreenState createState() => _ParticularUserScreenState();
}

class _ParticularUserScreenState extends State<ParticularUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          "Ravi Kumar",
          style: GoogleFonts.muli(
            letterSpacing: 1.1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              height: MediaQuery.of(context).size.height * .3,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "+918608602032",
                          style: GoogleFonts.muli(
                              letterSpacing: 1.1,
                              color: Colors.white,
                              fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.mail_outline,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "HariKrishnarko007@gmail.com",
                          style: GoogleFonts.muli(
                              letterSpacing: 1.1,
                              color: Colors.white,
                              fontSize: 12),
                        )
                      ],
                    ),
                    Container(
                      //  color: Colors.black45,
                      width: double.infinity,
                      height: 100,
                      alignment: Alignment.center,
                      child: Text(
                        "\$ 100 Rs",
                        style: GoogleFonts.muli(
                            letterSpacing: 1,
                            fontSize: 20,
                            color: Colors.white),
                      ),
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
                                      color: Colors.white, width: 1)),
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
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
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
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 80,
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
                  Text(
                    "22-10-2020",
                    style: GoogleFonts.muli(),
                  ),
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: ()
        {

        },
        child: Icon(Icons.attach_money,color: Colors.white,),
      ),
    );
  }
}
