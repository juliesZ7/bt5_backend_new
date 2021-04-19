import 'dart:io';

import 'package:bt5_backend/Register/Personal_Info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Authetication_Services.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hideOrShow1 = true;
  bool hideOrShow2 = true;

  void _showPassword() {
    setState(() {
      hideOrShow1 = !hideOrShow1;
    });
  }

  void _showRePassword() {
    setState(() {
      hideOrShow2 = !hideOrShow2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          'REGISTER',
          style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 15),
        ),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
        child: Column(
          children: [
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                                hintText: 'type your username here',
                                hintStyle: TextStyle(
                                  color: Colors.white30,
                                  fontSize: 14,
                                )),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (!value.contains('@gmail.com')) {
                                return 'Please enter full form of email';
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextFormField(
                            obscureText: hideOrShow1,
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'type your password here',
                              hintStyle: TextStyle(
                                  color: Colors.white30, fontSize: 14),
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value.length < 6)
                                return 'Your password is too short';
                              return null;
                            },
                          ),
                          TextButton(
                              onPressed: () {
                                _showPassword();
                              },
                              child: Text(hideOrShow1 ? "Show" : "Hide")),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Re-Password',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextFormField(
                            obscureText: hideOrShow2,
                            controller: rePasswordController,
                            decoration: InputDecoration(
                              hintText: 'type your password again here',
                              hintStyle: TextStyle(
                                  color: Colors.white30, fontSize: 14),
                            ),
                            validator: (value) {
                              if (value != passwordController.text) {
                                return 'Password does not match';
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                _showRePassword();
                              },
                              child: Text(hideOrShow2 ? "Show" : "Hide")),
                        ],
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Container(
                          height: 45,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.orangeAccent,
                                  Colors.redAccent
                                ]),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (_formKey.currentState.validate()) {
                                  context.read<AuthenticationServices>().signUp(
                                      email: usernameController.text.trim(),
                                      password: passwordController.text.trim());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PersonalInfo()));
                                }
                              });
                            },
                            child: Text('REGISTER',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    letterSpacing: 2)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

popupNoti() {
  return AlertDialog(
    title: Text("Error"),
    content: Text("Password does not match"),
    actions: [TextButton(onPressed: () {}, child: Text("OK"))],
  );
}
