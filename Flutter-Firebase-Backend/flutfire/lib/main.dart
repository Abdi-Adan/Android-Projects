import 'package:flutfire/Homepage.dart';
import 'package:flutfire/login.dart';
import 'package:flutfire/signup.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.orange,
      ),
      home: Login(),
      routes: <String, WidgetBuilder> {
        "/landingPage": (BuildContext context) => MyApp(),
        "/signup": (BuildContext context) => SignUp(),
        "/homepage": (BuildContext context) => Home(),
      },
    );
  }
}
