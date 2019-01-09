import 'package:flutter/material.dart';

class DescriptiveQuestion extends StatefulWidget {
  final List questions;

  const DescriptiveQuestion({Key key, this.questions}) : super(key: key);
  _DescriptiveQuestionState createState() => _DescriptiveQuestionState();
}

class _DescriptiveQuestionState extends State<DescriptiveQuestion> {
  double _bodyHeight = 0.0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Descriptive Test'),
        ),
        body: Scaffold(
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
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            (index+1).toString() +
                                '. ' +
                                widget.questions[index]['question'],
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16.1),
                          ),
                          //  Row(
                          //    crossAxisAlignment: CrossAxisAlignment.end,
                          //    mainAxisAlignment: MainAxisAlignment.end,
                          //    children: <Widget>[
                          //      Padding(
                          //        padding: const EdgeInsets.all(8.0),
                          //        child: Text(widget.marks.toString() + ' Marks',
                          //            style: TextStyle(
                          //                fontSize: 12.1, color: Colors.black26)),
                          //      )
                          //    ],
                          //  ),
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
                                onPressed: () {
                                  setState(() {
                                    if (index > 0) {
                                      index--;
                                    }
                                  });
                                },
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Solution',
                                      style:
                                          TextStyle(color: Color(0xFF2C6DFD)),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.expand_more,
                                        color: Color(0xFF2C6DFD),
                                      ),
                                      onPressed: () {
                                        if (this._bodyHeight == 0.0) {
                                          setState(() {
                                            this._bodyHeight = 300.0;
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
                                onPressed: () {
                                  setState(() {
                                    if (index < widget.questions.length - 1) {
                                      print(widget.questions.length);
                                      index++;
                                    }
                                  });
                                },
                              )
                            ],
                          ),
                          new AnimatedContainer(
                            child: AnimatedOpacity(
                                opacity: this._bodyHeight != 0 ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 500),
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          widget.questions[index]['answer'],
                                          style: TextStyle(fontSize: 16.1),
                                        )
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
      ),
    );
  }
}
