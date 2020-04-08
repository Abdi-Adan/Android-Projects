import 'package:flutfire/Screens/root.dart';
// import 'package:flutfire/services/auth.dart';
// import 'package:provider/provider.dart';
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
      home: Root(),
      routes: <String, WidgetBuilder>{
        "/landingPage": (BuildContext context) => MyApp(),
      },
    );
  }
}

// StreamProvider<User>.value(
//       value: AuthService().user,
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Firebase Auth',
//         theme: ThemeData(
//           primarySwatch: Colors.deepOrange,
//           accentColor: Colors.orange,
//         ),
//         home: Root(),
//         routes: <String, WidgetBuilder>{
//           "/landingPage": (BuildContext context) => MyApp(),
//         },
//       ),
//     );
