import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserViewScreen extends StatefulWidget {
  String friendName;

  UserViewScreen({this.friendName});

  @override
  _UserViewScreenState createState() => _UserViewScreenState();
}

class _UserViewScreenState extends State<UserViewScreen> {
  TextEditingController textEditingController = TextEditingController();

  CollectionReference collectionReference =
      Firestore.instance.collection("friends");

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Venkat Money history"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: collectionReference.document("HLDGKW0kSl1KAW5Z1sio").collection(widget.friendName).snapshots(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return Center(
              child: Text("Wait a Min Data Fetching from cloud ...."),
            );
          }
          List<DocumentSnapshot> ds= snap.data.documents;
          for(DocumentSnapshot d in ds)
          {
          print(d["amount"]);
          }

          return ListView.builder(
            itemCount: snap.data.documents.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                width: MediaQuery.of(context).size.width * .7,
                height: 100,

                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20)
                ),
              );
            },
          );
        },
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
                                DateTime d = DateTime.now();
                                Map<String, dynamic> userData = {
                                  "sentDate": d.toString(),
                                  "amount": int.parse(textEditingController.text)
                                };
                                print(d);
                                print(textEditingController.text);
                                collectionReference
                                    .document("HLDGKW0kSl1KAW5Z1sio")
                                    .collection("venkatesh")
                                    .doc()
                                    .set(userData);

                                Navigator.pop(context);
                                textEditingController.clear();
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
