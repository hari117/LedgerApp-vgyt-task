import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TranscationScreen extends StatefulWidget {
  @override
  _TranscationScreenState createState() => _TranscationScreenState();
}

class _TranscationScreenState extends State<TranscationScreen> {
  TextEditingController accoutNameController = TextEditingController();
  TextEditingController transcationAmountController = TextEditingController();
  TextEditingController transcationNote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          color: Colors.black,
          iconSize: 40,
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: Text(
          "New Transcation",
          style: GoogleFonts.muli(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.3),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Accout Name",
              style: GoogleFonts.muli(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: TextField(
                onTap: () {
                  print("textfeild  pressed");
                },
                readOnly: true,
                keyboardType: TextInputType.number,
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "Accout",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.black45,
                        )),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45),
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Transcation ",
              style: GoogleFonts.muli(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 2),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onTap: () {
                        print("Amount  pressed");
                      },
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      decoration: InputDecoration(
                          hintText: "Amount",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.black45,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45),
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                      height: 57,
                      color: Colors.blue,
                      child: Text(
                        "Select Data",
                        style: GoogleFonts.muli(color: Colors.white),
                      ),
                      onPressed: () {
                        print("button pressed");
                      })
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Transcation Note",
              style: GoogleFonts.muli(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 17),
              child: TextField(
                onTap: () {
                  print("textfeild  pressed");
                },
                readOnly: true,
                keyboardType: TextInputType.number,
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "Note",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.black45,
                        )),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45),
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: MaterialButton(
                     height: 50,
                    color: Colors.red,
                    onPressed: () {
                       print("debit button is pressed");
                       Navigator.pop(context);
                    },
                  child: Text("Dedit",style: GoogleFonts.muli(fontSize: 18,letterSpacing: 1.2,fontWeight: FontWeight.w500),),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: MaterialButton(
                  height: 50,
                  color: Colors.green,
                    onPressed: () {
                    print("credit button is pressed");

                    Navigator.pop(context);

                    },
                  child: Text("Credit",style: GoogleFonts.muli(fontSize: 18,letterSpacing: 1.2,fontWeight: FontWeight.w500)),
                    ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          boxShadow: [

            BoxShadow(
              blurRadius: 10,
              spreadRadius: 0,
              color: Colors.black12,
              offset: Offset(-10,10),
            )
          ]
        ),
      ),
    );
  }
}
