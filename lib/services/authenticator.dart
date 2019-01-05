import 'package:edapt/home.dart';
import 'package:edapt/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Authenticator {
  Widget handleAuth() {
    return new StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData){
          return Home();
        }
        return LoginScreen();
      },
    );
  }
}
