import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNo;
  String smsCode;
  String verificationId;

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
        timeout: const Duration(seconds: 60),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
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
                  FirebaseAuth.instance.currentUser().then((user) {
                    if (user != null) {
                      print(user.uid);
                      Navigator.of(context).pop();
                      
                      Navigator.of(context).pushReplacementNamed('/homepage');
                    } else {
                      print(user);

                      Navigator.of(context).pop();
                      signIn();
                      
                    }
                    
                  });
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
      Navigator.of(context).pushReplacementNamed('/homepage');
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
          body: Container(
        decoration: new BoxDecoration(
          color: Color(0xFF2C6DFD)
        ),
          child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Edapt',
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.none,fontSize: 48),
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
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text('New User?'),
                                Text(
                                  'Create an Account',
                                  style:
                                      TextStyle(color: Color(0xFF2C6DFD), fontSize: 18),
                                ),
                              ],
                            ),
                          ),
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
      )),
    );
  }
}
