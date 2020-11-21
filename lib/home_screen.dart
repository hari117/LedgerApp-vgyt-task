import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ledgerapp/accout_settings_page.dart';
import 'package:ledgerapp/orthers_amount_screen.dart';
import 'package:ledgerapp/debit_amount_screen.dart';
import 'package:ledgerapp/hostory_screen.dart';
import 'package:ledgerapp/login_screen.dart';

 int GolobalAmount=0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.redAccent,
          appBar: AppBar(
            title: Text("Ledger App",style: GoogleFonts.roboto(letterSpacing: 1.1),),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Debit",
                ),
                Tab(
                  text: "Others",
                ),
                Tab(
                  text: "history",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [

              DebitAmountScreen(),
              CreditScreen(),
              HistoryScreen(),
            ],
          ),
          drawer: Drawer(
            child: Container(
              color: Colors.blue,
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    maxRadius: 60,
                    backgroundImage:NetworkImage(google.currentUser.photoUrl),
                  ),
                  Divider(),
                  Text(google.currentUser.displayName),
                  Divider(),
                 InkWell(child: Text("Add Money"),onTap: ()
                   {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => AccoutsettingsPage()),
                     );
                   },),
                  Divider(),
                  FlatButton(
                    child: Text("Logout"),
                   onPressed: ()
                    {
                      googleLogout();
                    },
                     ),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  googleLogout()
  {
    google.signOut();
  }
}
