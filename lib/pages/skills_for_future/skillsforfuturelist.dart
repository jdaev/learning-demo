import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edapt/pages/skills_for_future/course_into_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class SkFList extends StatefulWidget {
  _SkFListState createState() => _SkFListState();
}

class _SkFListState extends State<SkFList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Courses'),
        ),
        body: StreamBuilder(
            stream: Firestore.instance
                .collection('fl_content')
                .where('_fl_meta_.schema', isEqualTo: 'skillsCourses')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                child: new SizedBox(
                    width: 128,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Color(0xFF2C6DFD)),
                    )),
              );
                default:
                  return new ListView(
                    padding: EdgeInsets.all(16),
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                          print(document['bannerImageLink']);
                      return Card(
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: new ListTile(
                          contentPadding: EdgeInsets.all(16),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CourseIntroScreen(
                                        docID: document.documentID,
                                      )),
                            );
                          },
                          leading: SizedBox(width: 64,height: 64,child: Container(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0),)),
                          title: new Text(document['courseName']),
                        ),
                      );
                    }).toList(),
                  );
              }
            }));
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key key,
      this.startColor,
      this.endColor,
      this.label,
      this.icon,
      this.correction,
      this.route})
      : super(key: key);

  final int startColor;
  final String route;
  final int endColor;
  final double correction;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: <Widget>[
      new Positioned.fill(
        bottom: 0.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(startColor), Color(endColor)],
              tileMode: TileMode.repeated,
            ),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Color(0x40000000),
                blurRadius: 10.0,
                offset: new Offset(0.0, 2.0),
              ),
            ],
          ),
          child: new Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            icon,
                            size: 64,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: correction,
                          )
                        ]),
                  ),
                  new Text(
                    label,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 16.1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]),
          ),
        ),
      ),
      new Positioned.fill(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: () {
              Navigator.of(context).pushNamed(route);
            },
          ),
        ),
      ),
    ]));
  }
}
