import 'package:edapt/pages/diy_store/diy_video_thumbnail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutube/flutube.dart';

class DIYVideoScreen extends StatelessWidget {
  final String videoLink;
  final String name;
  final String description;
  final String steps;
  final String items;
  final String source;

  const DIYVideoScreen(
      {Key key,
      this.videoLink,
      this.name,
      this.description,
      this.steps,
      this.items,
      this.source})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 2;

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('DIY'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: FluTube(
                videoLink,
                autoInitialize: true,
                aspectRatio: 16 / 9,
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
                      name,
                      style: TextStyle(color: Color(0xFF2C6DFD), fontSize: 24),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 48,
                      child: Text(description,
                          softWrap: true,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: SizedBox(
                        width: double.infinity,
                        height: 1,
                      ),
                    ),
                    Text('Items Required',
                        style: TextStyle(
                            color: Color(0x8A000000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      items,
                      softWrap: true,
                      //maxLines: 3,
                      //overflow: TextOverflow.ellipsis
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text('Steps',
                        style: TextStyle(
                            color: Color(0x8A000000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
            
                    Text(
                      steps
                          .replaceAll("\\n", '')
                          .replaceAllMapped(
                              new RegExp(r"\d+[)]"), (Match m) => '\n\n' + m[0])
                          .replaceFirst('\n', ''),
                      softWrap: true,
                      //overflow: TextOverflow.ellipsis
                    ),
                  ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
