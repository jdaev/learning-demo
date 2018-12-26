import 'package:edapt/pages/custom_widgets/tution_button.dart';
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
                  TutionButton(
                    title: 'Previous Questionss',
                    icon: TuitionDetailIcons.test,
                    startColor: widget.startColor,
                    endColor: widget.endColor,
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) =>
                    EntryItem(data[index]),
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
        'Section A0',
        <Entry>[
          Entry('Item A0.1'),
          Entry('Item A0.2'),
        ],
      ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'Chapter B',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return Padding(
      padding: const EdgeInsets.fromLTRB(16,0,16,0),
      child: ListTile(title: Text(root.title)),
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
