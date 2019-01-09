import 'package:flutter/material.dart';
import 'package:flutube/flutube.dart';

class TopicVideoScreen extends StatefulWidget {
  final String videoLink;
  final String videoTitle;
  final String description;
  final String source;
  final String videoLink2;
  final String source2;

  const TopicVideoScreen(
      {Key key,
      this.videoLink,
      this.videoTitle,
      this.description,
      this.source,
      this.videoLink2,
      this.source2})
      : super(key: key);

  @override
  TopicVideoScreenState createState() {
    return new TopicVideoScreenState();
  }
}

class TopicVideoScreenState extends State<TopicVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tuition'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: FluTube(
                widget.videoLink,
                autoInitialize: true,
                showThumb: false,
                autoPlay: false,
                
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
                    widget.videoTitle,
                    style: TextStyle(color: Color(0xFF2C6DFD), fontSize: 24),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text('Video Summary',
                      style: TextStyle(
                          color: Color(0x8A000000),
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    widget.description,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
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
