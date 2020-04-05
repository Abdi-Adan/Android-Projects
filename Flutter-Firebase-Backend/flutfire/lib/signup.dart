import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutfire/services/userManagement.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'email'),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'password'),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text("SignUp"),
                color: Colors.deepOrange,
                textColor: Colors.white,
                elevation: 10,
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((signedInUser) {
                        UserManagement().storeNewUser(signedInUser, context);
                      })
                      .catchError((e) {
                    print(e);
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text("Already have an account?"),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text("Login"),
                color: Colors.deepOrange,
                textColor: Colors.white,
                elevation: 10,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
