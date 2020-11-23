import 'package:flutter/material.dart';
import 'package:ledgerapp/login_screen.dart';

class CreateAccout extends StatefulWidget {
  @override
  _CreateAccoutState createState() => _CreateAccoutState();
}

class _CreateAccoutState extends State<CreateAccout> {
  TextEditingController userNameTE = TextEditingController();
  TextEditingController bankNameTE = TextEditingController();
  TextEditingController accountNumberTE = TextEditingController();
  TextEditingController ifscTE = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("userName"),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: userNameTE,
                  decoration: InputDecoration(hintText: "Enter UserName"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("bankName"),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: bankNameTE,
                  decoration: InputDecoration(hintText: "Enter bankName"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("accountNumber"),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: accountNumberTE,
                  decoration: InputDecoration(hintText: "Enter accountNumber"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("IFSC Code"),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: ifscTE,
                  decoration: InputDecoration(hintText: "Enter IFSC Code"),
                ),
                SizedBox(
                  height: 40,
                ),
                FlatButton(
                  color: Colors.blue,
                  onPressed: () async {
                    Map<String, dynamic> map = {
                      "userNam": userNameTE.text,
                      "name": google.currentUser.displayName,
                      "id": google.currentUser.id,
                      "email": google.currentUser.email,
                      "photoUrl": google.currentUser.photoUrl,
                      "bankName": bankNameTE.text,
                      "bankAccount": accountNumberTE.text,
                      "ifscCode": ifscTE.text,
                      "accountBalance":0.0,
                    };
                 await userAccountRef
                        .doc(google.currentUser.id)
                        .setData(map);
                 Navigator.pop(context);
                    userNameTE.clear();
                    bankNameTE.clear();
                    accountNumberTE.clear();
                    ifscTE.clear();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
