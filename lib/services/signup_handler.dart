import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:edapt/home.dart';
import 'package:edapt/pages/sign_up.dart';

class Verifier {
  Widget handleVerification(String phone) {
    print('mango');
    return StreamBuilder(
        stream: Firestore.instance
            .collection('users')
            .where('phone', isEqualTo: phone)
            .limit(1)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          print('jello');
          if (snapshot.hasData) {
            return new Home();
          } else {
            return new SignUpScreen(phoneNumber: phone,);
          }
        });
  }
}
