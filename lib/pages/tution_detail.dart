import 'package:edapt/pages/custom_widgets/tution_button.dart';
import 'package:edapt/pages/previous_questions_screen.dart';
import 'package:edapt/pages/test_choice_screen.dart';
import 'package:edapt/pages/tution_topic_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:edapt/tuition_detail_icons.dart';

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

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.subject),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16.0),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: (itemWidth / itemHeight),
                controller: new ScrollController(keepScrollOffset: false),
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
                            colors: [Color(widget.startColor), Color(widget.endColor)],
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
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
                                builder: (context) => PreviousQuestionPaperScreen()
                              ),
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
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) =>
                    EntryItem(data[index], context),
                itemCount: data.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// Data to display.
const List<Entry> data = <Entry>[
  Entry(
    'Chapter A',
    <Entry>[
      Entry(
        'Subtopic 1',
      ),
      Entry('Subtopic 2'),
      Entry('Subtopic 3'),
      Entry('Test'),
    ],
  ),
  Entry(
    'Chapter B',
    <Entry>[
      Entry('Subtopic 1'),
      Entry('Subtopic 3'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, this.context);
  final BuildContext context;
  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: InkWell(
          child: ListTile(title: Text(root.title)),
          onTap: () {
            if (root.title == 'Test') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TestChoiceScreen(),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopicVideoScreen(),
                ),
              );
            }
          },
        ),
      );
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: Text(root.title),
        children: root.children.map(_buildTiles).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
