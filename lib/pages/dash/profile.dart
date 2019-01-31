import 'package:edapt/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: SharedPreferencesHelper.getUserDetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(snapshot.data['name']),
                  Text(snapshot.data['standard']),
                  Text(snapshot.data['syllabus']),
                  OutlineButton(
                    child: Text('Log Out'),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LoginScreen();
                        },
                      ));
                    },
                  )
                ],
              ),
            );
          } else
            return Container();
        },
      ),
    );
  }
}

class SharedPreferencesHelper {
  static final Map _userDetails = {
    'name': '',
    'phone': '',
    'standard': '',
    'syllabus': '',
  };

  static Future<Map> getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _userDetails['name'] = prefs.getString('username') ?? 'Error?';
    _userDetails['phone'] = prefs.getString('phone') ?? 'Error?';
    _userDetails['standard'] = prefs.getString('standard') ?? 'Error?';
    _userDetails['syllabus'] = prefs.getString('syllabus') ?? 'Error?';

    return _userDetails;
  }
}
