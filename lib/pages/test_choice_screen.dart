import 'package:edapt/pages/custom_widgets/test_question_widget.dart';
import 'package:edapt/pages/descriptive_question_widget.dart';
import 'package:flutter/material.dart';
import 'package:edapt/test_icons_icons.dart';

class TestChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 2;

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 4.0,
          childAspectRatio: (itemWidth / itemHeight),
          controller: new ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
                child: Stack(children: <Widget>[
              new Positioned.fill(
                bottom: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    TestIcons.objective,
                                    size: 64,
                                    color: Color(0xFF2C6DFD),
                                  ),
                                  SizedBox(
                                    width: 0.0,
                                  )
                                ]),
                          ),
                          new Text(
                            'Objective',
                            style: new TextStyle(
                              color: Color(0xFF2C6DFD),
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
                            builder: (context) => ObjectiveTestQuestion(
                                  questionNumber: 1,
                                  question:
                                      'How much wood could a wood chuck chuck if a wood chuck could chuck wood ?',
                                      answerA: 'Nitwit',
                                      answerB: 'Blubber',
                                      answerC: 'Oddment',
                                      answerD: 'Tweak',
                                      answerDetail: 'About as much as the airspeed velocity of an unladen swallow',
                                      correctAnswer: 'a',
                                )),
                      );
                    },
                  ),
                ),
              ),
            ])),
            Container(
                child: Stack(children: <Widget>[
              new Positioned.fill(
                bottom: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    TestIcons.descriptive,
                                    size: 64,
                                    color: Color(0xFF2C6DFD),
                                  ),
                                  SizedBox(
                                    width: 0.0,
                                  )
                                ]),
                          ),
                          new Text(
                            'Descriptive',
                            style: new TextStyle(
                              color: Color(0xFF2C6DFD),
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
                            builder: (context) => DescriptiveQuestion(
                              questionNumber: 1,
                              question: 'Which is the latest rover to land on Mars?',
                              answerDetail: 'Insight',
                              marks: 1,
                            )),
                      );
                    },
                  ),
                ),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
