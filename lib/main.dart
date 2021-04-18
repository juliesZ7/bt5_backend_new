import 'package:bt5_backend/Authetication_Services.dart';
import 'package:bt5_backend/HomePage.dart';
import 'package:bt5_backend/Register/Personal_Info.dart';
import 'package:bt5_backend/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationServices>(
              create: (_) => AuthenticationServices(FirebaseAuth.instance)),
          StreamProvider(
            create: (context) =>
                context.read<AuthenticationServices>().authStateChanges,
            initialData: null,
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: PersonalInfo()));
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomePage();
    }
    return WelcomePage();
  }
}
