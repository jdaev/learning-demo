import 'package:flutter/material.dart';

class PreviousQuestionPaperScreen extends StatefulWidget {
  _PreviousQuestionPaperScreenState createState(
    
  ) =>
      _PreviousQuestionPaperScreenState();
}

class _PreviousQuestionPaperScreenState
    extends State<PreviousQuestionPaperScreen> {
  Icon downloadIcon = Icon(Icons.file_download,color: Colors.black12,);
  Icon downloadedIcon = Icon(Icons.done,color: Color(0xFF2C6DFD));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Previous Questions'),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(data[index].year),
                    ),
                    IconButton(
                      icon: data[index].downloaded == true ? downloadedIcon : downloadIcon,
                      onPressed: () {
                      setState(() {
      
                                        });
                      },
                    )

                  ],
                ),
                SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: Container(
                    color: Colors.black12,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class QuestionPapers {
  final String year;
  bool downloaded;

  QuestionPapers(this.year, this.downloaded);
}

List<QuestionPapers> data = [
  QuestionPapers('2016', false),
  QuestionPapers('2017', false),
  QuestionPapers('2018', false),
  QuestionPapers('2019', true)
];
