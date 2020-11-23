import 'package:flutter/material.dart';
import 'package:ledgerapp/login_screen.dart';

class AccoutsettingsPage extends StatefulWidget {
  @override
  _AccoutsettingsPageState createState() => _AccoutsettingsPageState();
}

class _AccoutsettingsPageState extends State<AccoutsettingsPage> {

     TextEditingController moneyTE=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Money To Your Accout"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text('Enter Amount'),
                            children: <Widget>[
                              SimpleDialogOption(
                                  onPressed: () {},
                                  child: TextField(

                                    decoration:
                                        InputDecoration(hintText: "100.0 rs"),
                                    keyboardType: TextInputType.number,
                                    controller: moneyTE,
                                  ),
                              ),
                              SimpleDialogOption(
                                child: SizedBox(height: 12,),
                              ),
                              SimpleDialogOption(
                                onPressed: () {},
                                child: FlatButton(
                                  onPressed: ()async {
                                    await userAccountRef
                                        .document(google.currentUser.id)
                                        .update({"accountBalance": moneyTE.text});
                                    Navigator.pop(context);
                                    moneyTE.clear();
                                  //  loc<UserAccountModel>().accountBalanc = doc["accountBalance"];

                                  },
                                  color: Colors.blue,
                                  child: Text("Ok",style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ],
                          );
                        });

                    addBankBalance(100);
                  },
                  child: Text(
                    "add Money",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  addBankBalance(int currency) async {

    setState(() {});
  }
}
