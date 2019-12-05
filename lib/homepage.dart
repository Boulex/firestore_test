import 'package:flutter/material.dart';
import 'package:firestore_test/login.dart';
import 'package:firestore_test/signup.dart';

class HomePage extends StatefulWidget {
  static String id = "home_screen";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Login.id);

                  },
                  minWidth: 400.0,
                  height: 42.0,
                  child: Text(
                    'Login',style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUp.id);

                  },
                  minWidth: 400.0,
                  height: 42.0,
                  child: Text(
                    'Sign Up',style: TextStyle(
                    fontSize: 25.0,
                  ),
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
