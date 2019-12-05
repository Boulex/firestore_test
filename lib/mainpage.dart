import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_test/login.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MainPage extends StatefulWidget {
  static String id = "mainpage_screen";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  final _fireStore = Firestore.instance;
  bool showSpinner=false;

//  @override
//  void initState() {
//    super.initState();
//    getCurrentUser();
//    //print(loggedInUser.email);
//  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  getUsername() async {
    await for (var snapshot in _fireStore.collection('appusers').snapshots()) {
      for (var name in snapshot.documents) {}
      ;
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pushNamed(context, Login.id);
            },
            icon: Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
        ],
        title: Text(
          "Ekabo O!",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

//          StreamBuilder<QuerySnapshot>(
//            stream: _fireStore.collection('appusers').snapshots(),
//            // ignore: missing_return
//            builder: (context, snapshot) {
//              if (snapshot.hasData) {
//                final userEmail = snapshot.data.documents;
//                List<Text> userEmailWidgets = [];
//                for (var user in userEmail) {
//                  final emailText = user.data['email'];
//                  final userEmailWidget = Text("Email is: $emailText");
//                  userEmailWidgets.add(userEmailWidget);
//                }
//              }
//            },
//          ),
            Center(
              child: Text(
                "Eka boo o !, Eku irin. Kile bawa mubo?.",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  //number= value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter the Url Address you want to test',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Implement login functionality.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Test Correctness of Url',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
