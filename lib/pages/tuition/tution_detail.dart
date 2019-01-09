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

  const TuitionDetail({Key key, this.subject, this.startColor, this.endColor})
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

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.subject),
        ),
        body: StreamBuilder(
            stream: Firestore.instance
                .collection('fl_content')
                .where('standard', isEqualTo: '9th')
                .where('subject', isEqualTo: 'physics')
                .where('syllabus', isEqualTo: 'ksb')
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
                          GridView.count(
                            crossAxisCount: 2,
                            padding: EdgeInsets.all(16.0),
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 4.0,
                            childAspectRatio: (itemWidth / itemHeight),
                            controller:
                                new ScrollController(keepScrollOffset: false),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              TutionButton(
                                title: 'History & Evolution',
                                icon: TuitionDetailIcons.alarm_clock,
                                startColor: widget.startColor,
                                endColor: widget.endColor,
                              ),
                              Container(
                                  child: Stack(children: <Widget>[
                                new Positioned.fill(
                                  bottom: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(widget.startColor),
                                          Color(widget.endColor)
                                        ],
                                        tileMode: TileMode.repeated,
                                      ),
                                      boxShadow: <BoxShadow>[
                                        new BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 10.0,
                                          offset: new Offset(0.0, 10.0),
                                        ),
                                      ],
                                    ),
                                    child: new Center(
                                      child: new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 0, 8.0),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    new Icon(
                                                      TuitionDetailIcons.test,
                                                      size: 64,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 0.0,
                                                    )
                                                  ]),
                                            ),
                                            new Text(
                                              'Previous Questions',
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PreviousQuestionPaperScreen()),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ]))
                            ],
                          ),
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
