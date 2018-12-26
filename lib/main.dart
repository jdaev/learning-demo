import 'package:edapt/pages/tuition.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:edapt/pages/login.dart';
import 'package:edapt/pages/sign_up.dart';
import 'package:edapt/pages/otp_screen.dart';
import 'package:edapt/pages/tuition.dart';
import 'package:edapt/pages/tution_topic_video_screen.dart';

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
      home: Home(),
      routes: <String, WidgetBuilder> {
        '/homepage': (BuildContext context) => Home(),
        '/loginpage': (BuildContext context) => LoginScreen(),
        '/signup_page': (BuildContext context) => SignUpScreen(),
        '/tuition_page': (BuildContext context) => TuitionScreen(),
      },
    );
  }
}
