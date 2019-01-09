import 'package:edapt/pages/skills_for_future/course_enroll_screen.dart';
import 'package:flutter/material.dart';

class SkillsForFuture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills For Future'),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16,16,0,0),
              child: Text('Type 1 Skills',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            new SubList(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16,16,0,0),
              child: Text('Type 2 Skills',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            new SubList(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16,16,0,0),
              child: Text('Type 3 Skills',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            new SubList(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16,16,0,0),
              child: Text('Type 3 Skills',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            new SubList(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16,16,0,0),
              child: Text('Type 4 Skills',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            new SubList(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16,16,0,0),
              child: Text('Type 5 Skills',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            new SubList()
          ],
        ),
      ),
    );
  }
}

class SubList extends StatelessWidget {
  const SubList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          RaisedButton(
              child: Text('Course 1',style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EnrollVideoScreen()
                              ),
                            );
              },
              color: Colors.white,
              elevation: 8.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0))),
          SizedBox(
            width: 8,
          ),
          RaisedButton(
              child: Text('Course 2',style: TextStyle(fontSize: 18)),
              onPressed: () {},
              color: Colors.white,
              elevation: 8.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0))),
          SizedBox(
            width: 8,
          ),
          RaisedButton(
              child: Text('Course 3',style: TextStyle(fontSize: 18)),
              onPressed: () {},
              elevation: 8.0,
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0))),
          SizedBox(
            width: 8,
          ),
          RaisedButton(
              child: Text('Course 4',style: TextStyle(fontSize: 18)),
              onPressed: () {},
              elevation: 8.0,
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0))),
          SizedBox(
            width: 8,
          ),
          RaisedButton(
              child: Text('Course 5',style: TextStyle(fontSize: 18)),
              onPressed: () {},
              elevation: 8.0,
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0))),
          SizedBox(
            width: 8,
          ),
          RaisedButton(
              child: Text('Course 6',style: TextStyle(fontSize: 18)),
              onPressed: () {},
              elevation: 8.0,
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0))),
        ],
      ),
    );
  }
}
