import 'package:flutter/material.dart';
import 'package:ledgerapp/login_screen.dart';

class CreditScreen extends StatefulWidget {
  @override
  _CreditScreenState createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  TextEditingController senderNameTE = TextEditingController();
  TextEditingController bankNameTE = TextEditingController();
  TextEditingController accountNumberTE = TextEditingController();
  TextEditingController IfscCodeTE = TextEditingController();
  TextEditingController amountTE = TextEditingController();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
    //   resizeToAvoidBottomPadding: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Text(
                  "Receive From Other Accounts",
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.green),
                ),
                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text("Name")),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: senderNameTE,
                          decoration: InputDecoration(hintText: "Enter Name"),
                        ),
                      )
                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text("Bank Name :")),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: bankNameTE,
                          decoration: InputDecoration(hintText: "Bank Name"),
                        ),
                      )
                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text("Account Number :")),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: accountNumberTE,
                          decoration: InputDecoration(hintText: "Enter Accout Number"),
                        ),
                      )
                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text("IFSC code:")),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: IfscCodeTE,
                          decoration: InputDecoration(hintText: "Enter IFSC Code"),
                        ),
                      )
                    ],
                  ),
                ),




                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text("Amount:")),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: amountTE,
                          decoration: InputDecoration(hintText: "Enter Amount To Send"),
                        ),
                      )
                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child:Container()),
                      Expanded(
                        flex: 2,
                        child: FlatButton(
                          color: Colors.blue,
                          child:Text("Send",style: TextStyle(color: Colors.white),),
                          onPressed: () async {

                            showDialog(
                                context: (context),
                                builder: (context) {
                                  return AlertDialog(
                                    //   title: Text("Simple Alert"),
                                    content: Text("Transcation Completed"),
                                    actions: [
                                      Row(
                                        children: [
                                          SizedBox(),
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Ok",style: TextStyle(color: Colors.white),),
                                            color: Colors.blue,
                                          ),
                                          SizedBox(width: 100,),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      ),
                                    ],
                                  );
                                });


                            Map<String, dynamic> map = {
                              "senderName":senderNameTE.text,
                              "type": "Credit",
                              "BankName": bankNameTE.text,
                              "accountNumber": accountNumberTE.text,
                              "IFSCCode": IfscCodeTE.text,
                              "amount": amountTE.text,
                            };

                            await allTranscationRef
                                .document(google.currentUser.id)
                                .collection(google.currentUser.displayName)
                                .document()
                                .setData(map);


                            bankNameTE.clear();
                            accountNumberTE.clear();
                            IfscCodeTE.clear();
                            amountTE.clear();
                            senderNameTE.clear();

                          },
                        ),

                      ),
                      Expanded(flex: 1, child: Container()),

                    ],
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
