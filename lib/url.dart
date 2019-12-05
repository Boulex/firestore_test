import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_test/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/materialogin.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Url extends StatefulWidget {
  static String id = "url_screen";

  @override
  _UrlState createState() => _UrlState();
}

class _UrlState extends State<Url> {
  String inputUrl;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  Future _loadSite(String url) async {
    try {
      final response = await http.head(url);
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                "The Url you Entered is correct",
                style: TextStyle(fontSize: 20.0),
              ),
              title: Text(
                "Message",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel ",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
              backgroundColor: Colors.white,
            );
          },
        );

        print("nice");
      } else if (response.statusCode == 400) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                "The Url you entered isn't correct.",
                style: TextStyle(fontSize: 20.0),
              ),
              title: Text(
                "Message",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel ",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
              backgroundColor: Colors.white,
            );
          },
        );
        print("not nice");
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                "There is a problem with the Url you entered",
                style: TextStyle(fontSize: 20.0),
              ),
              title: Text(
                "Message",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel ",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                )
              ],
              backgroundColor: Colors.white,
            );
          },
        );
        print("pele");
      }
    } catch (exception) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              "There is a problem with the Url you entered",
              style: TextStyle(fontSize: 20.0),
            ),
            title: Text(
              "Message",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel ",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              )
            ],
            backgroundColor: Colors.white,
          );
        },
      );
      print(exception);
    }
  }

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Url Testing Too Bahd Gan!!!",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            child: Row(
              children: <Widget>[
                Text("Log out"),
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
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "Eka boo o !, Eku irin. Kile bawa mubo?.",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            Center(
              child: Text(
                "Oya Check the Validity of your Url shapaly!",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  inputUrl = value;
                },
                decoration: InputDecoration(
                  hintText:
                      'Enter the Url Address you want to test in the format (https://www.)',
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      {
                        _loadSite(inputUrl);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (exception) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                              "$exception",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            title: Text(
                              "Message",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel ",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              )
                            ],
                            backgroundColor: Colors.white,
                          );
                        },
                      );
                    }
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
