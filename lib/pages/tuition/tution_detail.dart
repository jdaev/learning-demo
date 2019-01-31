import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edapt/pages/tuition/previous_questions_screen.dart';
import 'package:edapt/pages/tuition/test_choice_screen.dart';
import 'package:edapt/pages/tuition/tution_button.dart';
import 'package:edapt/pages/tuition/tution_topic_video_screen.dart';
import 'package:edapt/tuition_detail_icons.dart';
import 'package:flutter/material.dart';

class TuitionDetail extends StatefulWidget {
  final String subject;
  final int startColor;
  final int endColor;
  final String standard;
  final String syllabus;

  const TuitionDetail(
      {Key key,
      this.subject,
      this.startColor,
      this.endColor,
      this.standard,
      this.syllabus})
      : super(key: key);

  @override
  _TuitionDetailState createState() => _TuitionDetailState();
}

class _TuitionDetailState extends State<TuitionDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 2;
    print(widget.standard);
    print(widget.syllabus);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.subject),
        ),
        body: StreamBuilder(
            stream: Firestore.instance
                .collection('fl_content')
                .where('standard', isEqualTo: widget.standard)
                .where('subject', isEqualTo: widget.subject.toLowerCase())
                .where('syllabus', isEqualTo: widget.syllabus)
                .snapshots(),
            builder: (context, snapshot) {
              //print(snapshot.data.);
              //var topics = snapshot.data.document['topics'];
              //var objectiveQuestions = snapshot.data.document['objectiveQuestions'];
              //var descriptiveQuestions = snapshot.data.document['descriptiveQuestion']
              if (snapshot.hasData) {
                return ListView(
                    physics: const AlwaysScrollableScrollPhysics(), // new
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(), // new
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                return Column(children: <Widget>[
                                  _buildListItem(
                                      context, snapshot.data.documents[index]),
                                ]);
                              })
                        ],
                      ),
                    ]);
              } else {
                return Center(child: Text(':( No Data Yet\n Come back later'));
              }
            }));
  }

  _buildListItem(BuildContext context, document) {
    List<Widget> topics = document['topics'].map<Widget>((topic) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: ListTile(
          title: Text(topic['topicTitle']),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TopicVideoScreen(
                        description: topic['description'],
                        source: topic['source'],
                        videoTitle: topic['topicTitle'],
                        videoLink: topic['youtubeLink'],
                        source2: topic['source2'],
                        videoLink2: topic['youtubeLink2'],
                      )),
            );
          },
        ),
      );
    }).toList();
    topics.add(Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      child: ListTile(
          title: Text(
            'Test',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TestChoiceScreen(
                          objectiveQuestions: document['objectiveQuestions'],
                          descriptiveQuestions: document['descriptiveQuestion'],
                        )),
              )),
    ));
    return ExpansionTile(
      title: Text(document['ttle']),
      children: topics,
    );
  }
}
