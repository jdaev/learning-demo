import 'package:flutter/material.dart';

class ObjectiveTestQuestion extends StatefulWidget {
  final int questionNumber;
  final String question;
  final String answerA;
  final String answerB;
  final String answerC;
  final String answerD;
  final String correctAnswer;
  final String answerDetail;

  const ObjectiveTestQuestion(
      {Key key,
      this.questionNumber,
      this.question,
      this.answerA,
      this.answerB,
      this.answerC,
      this.answerD,
      this.correctAnswer,
      this.answerDetail})
      : super(key: key);
  _ObjectiveTestQuestionState createState() => _ObjectiveTestQuestionState();
}

class _ObjectiveTestQuestionState extends State<ObjectiveTestQuestion> {
  double _bodyHeight = 0.0;
  int _radioValue = -1;
  int correctScore = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
        if (widget.correctAnswer == 'a'){
          }
          break;
        case 1:
        if (widget.correctAnswer == 'b'){
          }
          break;
        case 2:
        if (widget.correctAnswer == 'c'){
          }
          break;
        case 3:
        if (widget.correctAnswer == 'd'){
          }
          break;
      }
    });
  }

  String _returnCorrectAnswer() {
    String correct;
    switch (widget.correctAnswer) {
      case 'a':
        correct = widget.answerA;
        break;
      case 'b':
        correct = widget.answerB;
        break;
      case 'c':
        correct = widget.answerC;
        break;
      case 'd':
        correct = widget.answerD;
        break;
    }
    return correct;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Objective Test'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: new SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(16.0),
                  decoration: new BoxDecoration(
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.questionNumber.toString() +
                              ' ' +
                              widget.question,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16.1
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Column(children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text('a.'),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Expanded(child: Text(widget.answerA)),
                                    Radio(
                                      value: 0,
                                      groupValue: _radioValue,
                                      onChanged: _handleRadioValueChange,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text('b.'),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Expanded(child: Text(widget.answerB)),
                                    Radio(
                                      value: 1,
                                      groupValue: _radioValue,
                                      onChanged: _handleRadioValueChange,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text('c.'),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Expanded(child: Text(widget.answerC)),
                                    Radio(
                                      value: 2,
                                      groupValue: _radioValue,
                                      onChanged: _handleRadioValueChange,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text('d.'),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Expanded(child: Text(widget.answerD)),
                                    Radio(
                                      value: 3,
                                      groupValue: _radioValue,
                                      onChanged: _handleRadioValueChange,
                                    ),
                                  ],
                                ),
                              ])
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1,
                          child: Container(
                            color: Colors.black12,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Solution',style: TextStyle(color: Colors.blue),),
                                  IconButton(
                                    icon: Icon(Icons.arrow_downward, color: Colors.blue,),
                                    onPressed: () {
                                      if (this._bodyHeight == 0.0) {
                                        setState(() {
                                          this._bodyHeight = 300;
                                        });
                                      } else {
                                        setState(() {
                                          this._bodyHeight = 0.0;
                                        });
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                            )
                          ],
                        ),
                        new AnimatedContainer(
                          child: AnimatedOpacity(
                              opacity: this._bodyHeight == 300.0 ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 500),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(widget.correctAnswer + '.', style: TextStyle(color: Colors.blue),),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(_returnCorrectAnswer(),style: TextStyle(color: Colors.blue),)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(widget.answerDetail,style: TextStyle(fontSize: 16.1),)
                                    ],
                                  ),
                                ),
                              )),
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 500),
                          height: this._bodyHeight == 300.0 ? null : 0.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
