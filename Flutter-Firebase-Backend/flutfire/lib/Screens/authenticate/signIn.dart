import 'package:flutfire/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Auth Testing'),
        elevation: 10,
      ),
      body: SafeArea(
        child: Container(
            child: RaisedButton(
              elevation: 10,
              color: Colors.red,
              onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if(result==null) {
                  print("error signing anonymously");
                } else{
                  print("Signed in");
                  print(result);
                }
              },
              child: Text("SignIn Annonymous"),
            ),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
      ),
    );
  }
}
