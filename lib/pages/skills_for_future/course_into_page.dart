import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edapt/pages/skills_for_future/modules_list.dart';
import 'package:edapt/pages/skills_for_future/skf_modules_list.dart';
import 'package:flutter/material.dart';

class CourseIntroScreen extends StatefulWidget {
  final String docID;

  const CourseIntroScreen({Key key, this.docID}) : super(key: key);
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
            .collection('fl_content')
            .document(widget.docID)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              var dataMap = snapshot.data.data;
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data.data['courseName'],
                          style:
                              TextStyle(color: Color(0xFF2C6DFD), fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: ExpansionTile(
                            initiallyExpanded: true,
                            title: Text('About the Course'),
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  //shrinkWrap: true,
                                  children: <Widget>[
                                    Text(dataMap['courseDescription']),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RaisedButton(
                            color: Color(0xFF2C6DFD),
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ModulesList(
                                    modules: dataMap['modules'],
                                  )
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Start Course',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
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
