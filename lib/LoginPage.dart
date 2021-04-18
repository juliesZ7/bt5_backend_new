import 'package:bt5_backend/Authetication_Services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          'LOGIN',
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
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'type your password here',
                            hintStyle:
                                TextStyle(color: Colors.white30, fontSize: 14),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
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
                              colors: [Colors.orangeAccent, Colors.redAccent]),
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<AuthenticationServices>().signIn(
                                email: usernameController.text.trim(),
                                password: passwordController.text.trim());
                          },
                          child: Text('LOGIN',
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
          ],
        ),
      ),
    );
  }
}
