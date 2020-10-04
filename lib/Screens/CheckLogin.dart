import 'package:dsc_gram/Screens/HomeScreen.dart';
import 'package:dsc_gram/Screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        }
        return LoginScreen();
      },
    );
  }
}
