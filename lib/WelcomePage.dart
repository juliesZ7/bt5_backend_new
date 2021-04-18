import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'Register/RegisterPage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          'HOMEPAGE',
          style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 15),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 10,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 200),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.lightBlueAccent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 7,
                        spreadRadius: 5,
                      )
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Colors.redAccent,
                          Colors.orangeAccent,
                        ]),
                  ),
                  height: 45,
                  width: 200,
                  child: TextButton(
                    child: Text('LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 2)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  )),
              Container(
                height: 60,
                width: 150,
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue[100],
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
