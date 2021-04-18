import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bt5_backend/Authetication_Services.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOME"),
            TextButton(
              onPressed: () {
                context.read<AuthenticationServices>().signOut();
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
