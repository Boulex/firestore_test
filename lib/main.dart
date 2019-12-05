import 'package:flutter/material.dart';
import 'package:firestore_test/login.dart';
import'package:firestore_test/homepage.dart';
import 'package:firestore_test/signup.dart';
import 'package:firestore_test/mainpage.dart';
import 'package:firestore_test/url.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        'home_screen':(context)=>HomePage(),
        'login_screen':(context)=> Login(),
        'signup_screen':(context)=> SignUp(),
        'mainpage_screen':(context)=> MainPage(),
        'url_screen':(context)=> Url(),
      },
    );
  }
}
