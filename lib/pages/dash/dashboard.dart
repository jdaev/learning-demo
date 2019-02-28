import 'package:edapt/pages/dash/landing.dart';
import 'package:edapt/pages/dash/learn_list.dart';
import 'package:edapt/pages/dash/profile.dart';
import 'package:edapt/pages/home_temp.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dash extends StatefulWidget {
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  var _appBarTitle = 'Edapt';
  bool _appBarVisible = false;
  int _currentPage = 1;
  bool _blueBack = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _getAppBar(),
        backgroundColor: _blueBack ? Color(0xFF2C6DFD) : Colors.white,
        body: Container(
          child: _getPage(),
        ),
        bottomNavigationBar: FancyBottomNavigation(
          initialSelection: 1,
          tabs: [
            TabData(iconData: FontAwesomeIcons.bookOpen, title: "Learn"),
            TabData(iconData: FontAwesomeIcons.home, title: "Home"),
            TabData(iconData: FontAwesomeIcons.user, title: "Account")
          ],
          onTabChangedListener: (position) {
            setState(() {
              _currentPage = position;
              switch (_currentPage) {
                case 0:
                  _appBarVisible = true;
                  _appBarTitle = 'Edapt';
                  _blueBack = false;
                  break;
                case 1:
                  _appBarVisible = false;
                  _blueBack = true;
                  _appBarTitle = 'Learn';
                  break;
                case 2:
                  _appBarVisible = true;
                  _appBarTitle = 'Profile';
                  _blueBack = false;
                  break;
              }
            });
          },
        ));
  }

  _getAppBar() {
    if (_appBarVisible) {
      return new AppBar(
        title: Text(_appBarTitle),
      );
    } else {
      return null;
    }
  }

  _getPage() {
    switch (_currentPage) {
      case 0:
        return LearnList();
        break;
      case 1:
        return LandingPage();
        break;
      case 2:
        return Profile();
        break;
    }
  }
}
