import 'package:flutter/material.dart';
import 'package:ledgerapp/getit_locaters.dart';
import 'package:ledgerapp/login_screen.dart';
import 'package:ledgerapp/useraccoutmodel.dart';

class DebitAmountScreen extends StatefulWidget {
  @override
  _DebitAmountScreenState createState() => _DebitAmountScreenState();
}

class _DebitAmountScreenState extends State<DebitAmountScreen> {
  TextEditingController bankNameTE = TextEditingController();
  TextEditingController accountNumberTE = TextEditingController();
  TextEditingController IfscCodeTE = TextEditingController();
  TextEditingController amountTE = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(

            child: Column(
              children: [
                Text(
                  "Transfer Money To Other Accounts",
                  style: TextStyle(fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                      "Balance: ${loc<UserAccountModel>().accountBalanc} rs"),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text("Enter Bank Name :")),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: bankNameTE,
                          decoration:
                          InputDecoration(hintText: "Enter Bank Name"),
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
                          decoration:
                          InputDecoration(hintText: "Enter Accout Number"),
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
                          decoration:
                          InputDecoration(hintText: "Enter IFSC Code"),
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
                          decoration:
                          InputDecoration(hintText: "Enter Amount To Send"),
                        ),
                      )
                    ],
                  ),
                ),

                //send button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 2,
                        child: FlatButton(
                          color: Colors.blue,
                          child: Text(
                            "Send",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            // code here
                            print("send button is pressed");

                            loc<UserAccountModel>().accountBalanc =
                                loc<UserAccountModel>().accountBalanc -
                                    int.parse(amountTE.text);


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
                                            child: Text("Ok", style: TextStyle(
                                                color: Colors.white),),
                                            color: Colors.blue,
                                          ),
                                          SizedBox(width: 100,),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                      ),
                                    ],
                                  );
                                });

                            Map<String, dynamic> map = {
                              "senderName": google.currentUser.displayName,
                              "type": "Debit",
                              "BankName": bankNameTE.text,
                              "accountNumber": accountNumberTE.text,
                              "IFSCCode": IfscCodeTE.text,
                              "amount": amountTE.text,
                            };
                            int temp = int.parse(amountTE.text);


                            await allTranscationRef
                                .document(google.currentUser.id)
                                .collection(google.currentUser.displayName)
                                .document()
                                .setData(map);


                            bankNameTE.clear();
                            accountNumberTE.clear();
                            IfscCodeTE.clear();
                            amountTE.clear();
                            setState(() {

                            });
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
