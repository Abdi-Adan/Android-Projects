import 'package:flutfire/Screens/root.dart';
import 'package:provider/provider.dart';
import 'package:flutfire/Homepage.dart';
import 'package:flutfire/signup.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase Auth',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.orange,
        ),
        home: Root(),
        routes: <String, WidgetBuilder>{
          "/landingPage": (BuildContext context) => MyApp(),
          "/signup": (BuildContext context) => SignUp(),
          "/homepage": (BuildContext context) => Home(),
        },
      ),
    );
    ;
  }
}

