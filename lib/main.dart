import 'package:flutter/material.dart';
import 'home.dart';
import 'package:edapt/pages/login.dart';
import 'package:edapt/pages/sign_up.dart';
import 'package:edapt/pages/otp_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edapt',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: <String, WidgetBuilder> {
        '/homepage': (BuildContext context) => Home(),
        '/loginpage': (BuildContext context) => LoginScreen(),
        '/signup_page': (BuildContext context) => SignUpScreen(),
      },
    );
  }
}
