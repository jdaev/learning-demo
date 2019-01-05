import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:edapt/pages/course_modules_screen.dart';

class CourseIntroScreen extends StatefulWidget {
  @override
  CourseIntroScreenState createState() {
    return new CourseIntroScreenState();
  }
}

class CourseIntroScreenState extends State<CourseIntroScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return StreamBuilder(
        stream: Firestore.instance
            .collection('courses')
            .document('exp_tech')
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              var dataMap = snapshot.data.data;
              List<String> objectives = dataMap['objectives'].cast<String>();
              List<String> curriculum = dataMap['curriculum'].cast<String>();
              print(dataMap);
              return new Scaffold(
                appBar: AppBar(
                  title: Text('Course Info'),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: size.height / 4,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          child: Container(
                            child: Image.asset(
                              'assets/dummyImage1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(dataMap['title']),
                      ExpansionTile(
                          initiallyExpanded: true,
                          title: Text('About the Course'),
                          children: <Widget>[
                            Column(
                              //shrinkWrap: true,
                              children: <Widget>[
                                Text(dataMap['about']),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: objectives.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Text(objectives[index]),
                                )
                              ],
                            ),
                          ]),
                      ExpansionTile(
                        title: Text('Curriculum'),
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: curriculum.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Text(curriculum[index]),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseModuleScreen(),
                              ),
                            );
                          },
                          child: Text('Start Course'),
                        ),
                      )
                    ],
                  ),
                ),
              );
          }
        });
  }
}
