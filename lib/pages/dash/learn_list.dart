import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edapt/my_flutter_app_icons.dart';
import 'package:edapt/pages/skills_for_future/course_into_page.dart';
import 'package:edapt/pages/tuition/tution_button.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LearnList extends StatefulWidget {
  @override
  LearnListState createState() {
    return new LearnListState();
  }
}

class LearnListState extends State<LearnList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('fl_content')
            .where('_fl_meta_.schema', isEqualTo: 'skillsCourses')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: SizedBox(
                    width: 128,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF2C6DFD)),
                    )),
              );
            default:
              return ListView(
                padding: EdgeInsets.all(16),
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  print(document['bannerImageLink']);
                  return Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
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
                      leading: SizedBox(
                          width: 64,
                          height: 64,
                          child: Container(
                            color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                        .toInt() <<
                                    0)
                                .withOpacity(1.0),
                          )),
                      title: new Text(document['courseName']),
                    ),
                  );
                }).toList(),
              );
          }
        });
  }

  _returnTuitionList() {
    return SizedBox(
      height: 172,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          TutionButton(
            title: 'Physics',
            icon: MyFlutterApp.icon,
            startColor: 0xFF3324AD,
            endColor: 0xFFBE69D4,
          ),
          TutionButton(
            title: 'Chemistry',
            icon: MyFlutterApp.atom,
            startColor: 0xFF2496B3,
            endColor: 0xFF66CFE7,
          ),
          TutionButton(
            title: 'Biology',
            icon: MyFlutterApp.microscope,
            startColor: 0xFFF9D184,
            endColor: 0xFFEF4A4B,
          ),
          TutionButton(
            title: 'Mathematics',
            icon: MyFlutterApp.compass,
            startColor: 0xFFBB51E5,
            endColor: 0xFFEB4B5A,
          ),
          TutionButton(
            title: 'Geography',
            icon: MyFlutterApp.globe_grid,
            startColor: 0xFF15BCE8,
            endColor: 0xFFA042E5,
          ),
          TutionButton(
            title: 'History',
            icon: MyFlutterApp.bookshelf,
            startColor: 0xFFB32926,
            endColor: 0xFF6D1F1D,
            correction: 10.0,
          ),
          TutionButton(
            title: 'English',
            icon: MyFlutterApp.blackboard,
            startColor: 0xFFF40194,
            endColor: 0xFF592C47,
            correction: 26.0,
          ),
          TutionButton(
            title: 'IT',
            icon: MyFlutterApp.computer,
            startColor: 0xFF24463D,
            endColor: 0xFF68B08F,
          ),
        ],
      ),
    );
  }
}
