import 'package:edapt/pages/skills_for_future/objective_question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutube/flutube.dart';

class ModuleVideo extends StatefulWidget {
  final String link;
  final String title;
  final List questions;
  final String transcript;

  const ModuleVideo(
      {Key key, this.link, this.title, this.questions, this.transcript})
      : super(key: key);
  _ModuleVideoState createState() => _ModuleVideoState();
}

class _ModuleVideoState extends State<ModuleVideo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: FluTube(
                widget.link,
                autoInitialize: true,
                aspectRatio: 16 / 9,
                showThumb: true,
                onVideoStart: () {},
                onVideoEnd: () {},
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                shrinkWrap: true,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: TextStyle(color: Color(0xFF2C6DFD), fontSize: 24),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 1,
                      child: Container(
                        color: Color(0x8A000000),
                      ),
                    ),
                  ),
                  ExpansionTile(
                    title: Text('Video Transcript',
                        style: TextStyle(
                            color: Color(0x8A000000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    children: <Widget>[
                      Text('placeholder'),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: SizedBox(
                      width: double.infinity,
                      height: 1,
                      child: Container(
                        color: Color(0x8A000000),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text('Answer Questions To Proceed'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ObjectiveQuestion(
                                  questions: widget.questions,
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: SizedBox(
                      width: double.infinity,
                      height: 1,
                      child: Container(
                        color: Color(0x8A000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
