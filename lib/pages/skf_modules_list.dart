import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edapt/pages/module_text_screen.dart';
import 'package:edapt/pages/module_video_screen.dart';
import 'package:flutter/material.dart';

class SkFModules extends StatefulWidget {
  final String courseID;

  const SkFModules({Key key, this.courseID}) : super(key: key);
  _SkFModulesState createState() => _SkFModulesState();
}

class _SkFModulesState extends State<SkFModules> {
  @override
  Widget build(BuildContext context) {
    String docID = widget.courseID;
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Course Modules'),
          ),
          body: StreamBuilder(
              stream: Firestore.instance
                  .collection('courses')
                  .document(docID)
                  .collection('modules')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Loading data...');
                  default:
                    return new ListView(
                      padding: EdgeInsets.all(16),
                      children: snapshot.data.documents
                          .map<Widget>((DocumentSnapshot document) {
                        return Card(
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: new ListTile(
                            contentPadding: EdgeInsets.all(16),
                            onTap: () {
                              switch (document['type']) {
                                case 'video':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ModuleVideo(
                                          link: document['link'],
                                          questions: document['questions'],
                                          title: document['title'],
                                          
                                        )),
                                  );
                                  break;
                                case 'text':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ModuleText(
                                              title:document['title'],
                                              content: document['content'],
                                              sources: document['sources'],
                                              time: document['time'],
                                            )),
                                  );
                                  break;
                                case 'activity':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SkFModules(
                                              courseID: document.documentID,
                                            )),
                                  );
                                  break;
                                default:
                                  break;
                              }
                            },
                            title: new Text('Module' +
                                " " +
                                document.documentID.substring(3)),
                            subtitle: new Text(document['title']),
                          ),
                        );
                      }).toList(),
                    );
                }
              })),
    );
  }
}
