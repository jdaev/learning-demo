import 'package:flutter/material.dart';
import 'package:edapt/pages/home_screen.dart';
import 'package:edapt/pages/account.dart';
import 'package:edapt/pages/library.dart';
import 'package:edapt/pages/notifications.dart';
import 'package:edapt/pages/paused.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  double _appBarElevation = 0.0;
  final List<Widget> _children = [
    HomeScreen(),
    PausedScreen(),
    LibraryScreen(),
    NotificationsScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Edapt'),
            elevation: _appBarElevation,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {})
            ],
          ),
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: onTabTapped,
              currentIndex: _currentIndex,

              
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.blue[700],
                  
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                  icon: new Icon(
                    Icons.home,
                    color: Color(0x8A000000),
                ),),
                BottomNavigationBarItem(
                    activeIcon: new Icon(
                      Icons.play_arrow,
                      color: Colors.blue[700],
                    ),
                    icon: new Icon(
                      Icons.play_arrow,
                      color: Color(0x8A000000),
                    ),
                    title: Text(
                      'Paused',
                      style: TextStyle(color: Colors.blue[700]),
                    )),
                BottomNavigationBarItem(
                  activeIcon: new Icon(
                    Icons.subscriptions,
                    color: Colors.blue[700],
                  ),
                  icon: new Icon(
                    Icons.subscriptions,
                    color: Color(0x8A000000),
                  ),
                  title: Text(
                    'Library',
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                ),
                BottomNavigationBarItem(
                    activeIcon: new Icon(
                      Icons.notifications,
                      color: Colors.blue[700],
                    ),
                    icon: new Icon(
                      Icons.notifications,
                      color: Color(0x8A000000),
                    ),
                    title: Text(
                      'Notifications',
                      style: TextStyle(color: Colors.blue[700]),
                    )),
                BottomNavigationBarItem(
                    activeIcon: new Icon(
                      Icons.account_circle,
                      color: Colors.blue[700],
                    ),
                    icon: new Icon(
                      Icons.account_circle,
                      color: Color(0x8A000000),
                    ),
                    title: Text(
                      'Account',
                      style: TextStyle(color: Colors.blue[700]),
                    ))
              ]),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      //_appBarElevation = index != 0 ? 4.0 : 0.0;
    });
  }
}
