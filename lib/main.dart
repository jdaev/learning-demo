import 'package:edapt/pages/calendar_screen.dart';
import 'package:edapt/pages/career_cart_screen.dart';
import 'package:edapt/pages/skills_for_future/course_into_page.dart';
import 'package:edapt/pages/diy_store/diy_store.dart';
import 'package:edapt/pages/home_temp.dart';
import 'package:edapt/pages/skills_for_future/skills_for_future.dart';
import 'package:edapt/pages/skills_for_future/skillsforfuturelist.dart';
import 'package:edapt/pages/tuition/tuition.dart';
import 'package:edapt/services/authenticator.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:edapt/pages/login.dart';
import 'package:edapt/pages/sign_up.dart';
import 'package:edapt/pages/tuition/tuition.dart';
import 'package:edapt/pages/tuition/tution_topic_video_screen.dart';


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
        primaryColor: Color(0xFF2C6DFD),
      ),
      home: LoginScreen(),//Authenticator().handleAuth(),
      routes: <String, WidgetBuilder> {
        '/homepage': (BuildContext context) => HomeTemp(),
        '/loginpage': (BuildContext context) => LoginScreen(),
        '/signup_page': (BuildContext context) => SignUpScreen(),
        '/tuition_page': (BuildContext context) => TuitionScreen(),
        '/diy_store':(BuildContext context) => DIYStoreScreen(),
        '/skills_for_future':(BuildContext context) => SkFList(),
        '/career_cart':(BuildContext context) => CareerCartScreen(),
        '/calendar':(BuildContext context) => CalendarScreen(),
      },
    );
  }
}
