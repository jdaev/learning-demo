import 'package:flutter/material.dart';

class CourseModuleScreen extends StatefulWidget {
  _CourseModuleScreenState createState() => _CourseModuleScreenState();
}

class _CourseModuleScreenState extends State<CourseModuleScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                color: Colors.white,
                elevation: 8.0,
                padding: EdgeInsets.all(16),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                onPressed: () {},
                child: Text('Module 1'),
              ),
              RaisedButton(
                color: Colors.white,
                elevation: 8.0,
                padding: EdgeInsets.all(16),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                onPressed: () {},
                child: Text('Module 2'),
              ),
              RaisedButton(
                color: Colors.white,
                elevation: 8.0,
                padding: EdgeInsets.all(16),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                onPressed: () {},
                child: Text('Module 3'),
              ),
              RaisedButton(
                color: Colors.white,
                elevation: 8.0,
                padding: EdgeInsets.all(16),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                onPressed: () {},
                child: Text('Module 4'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
