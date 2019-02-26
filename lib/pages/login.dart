import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edapt/pages/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNo;
  String smsCode;
  Widget bodyWidget;
  bool exists;
  String verificationId;
  bool isLoggedIn;
  @override
  void initState() {
    isLoggedIn = false;
    bodyWidget = loadingScreen();
    FirebaseAuth.instance.currentUser().then((user) => user != null
        ? setState(() {
            print(user.phoneNumber);
            phoneNo = user.phoneNumber;
            isLoggedIn = true;
            verifyExistence();
          })
        : setState(() {
            bodyWidget = loginBox();
          }));

    super.initState();
    // new Future.delayed(const Duration(seconds: 2));
  }

  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsCodeDialog(context).then((value) {
        print('Signed in');
      });
    };

    final PhoneVerificationCompleted verifiedSuccess = (FirebaseUser user) {
      print('verified');
    };

    final PhoneVerificationFailed veriFailed = (AuthException exception) {
      print('${exception.message}');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.phoneNo,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 30),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
  }

  Future<void> verifyExistence() async {
    final QuerySnapshot result = await Firestore.instance
        .collection('users')
        .where('phone', isEqualTo: phoneNo)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (documents.isNotEmpty) {
      prefs.setString(
          'username',
          result.documents[0]['firstName'] +
              ' ' +
              result.documents[0]['lastName']);
      prefs.setString("phone", phoneNo);
      prefs.setString("standard", result.documents[0]['standard']);
      prefs.setString("syllabus", result.documents[0]['syllabus']);
    }
    setState(() {
      if (documents.length == 1) {
        //Navigator.pop(context);
        Navigator.pushReplacementNamed(context, '/homepage');
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SignUpScreen(
                    phoneNumber: phoneNo,
                  )),
        );
      }
    });
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter Verification Code'),
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                child: Text('Done'),
                onPressed: () {
                  signIn();
                },
              )
            ],
          );
        });
  }

  signIn() {
    FirebaseAuth.instance
        .signInWithPhoneNumber(verificationId: verificationId, smsCode: smsCode)
        .then((user) {
      if (user != null) {
        Navigator.of(context).pop();
        setState(() {
          bodyWidget =loadingScreen();
        });
        verifyExistence();
      }
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomPadding: true, body: bodyWidget);
  }

  Widget loginBox() {
    return Container(
        decoration: new BoxDecoration(color: Color(0xFF2C6DFD)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  'Edapt',
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 48),
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 100),
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.phone_android),
                                labelText: 'Mobile Number'),
                            onChanged: (value) => this.phoneNo = value,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width / 2 - 32 + 4),
                  top: 189,
                  child: SizedBox(
                    height: 56,
                    width: 56,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      elevation: 8.0,
                      onPressed: () {
                        verifyPhone();
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF2C6DFD),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget loadingScreen() {
    return Container(
      color: Color(0xFF2C6DFD),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 120, child: Image.asset('assets/logo.png')),
            SizedBox(
              height: 8,
            ),
            SizedBox(
                width: 128,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xFF2C6DFD)),
                )),
          ],
        ),
      ),
    );
  }
}
