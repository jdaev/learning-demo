import 'package:flutter/material.dart';

class ModuleText extends StatefulWidget {
  final String title;
  final String sources;
  final String content;
  final String time;

  const ModuleText({Key key, this.title, this.sources, this.content, this.time})
      : super(key: key);
  _ModuleTextState createState() => _ModuleTextState();
}

class _ModuleTextState extends State<ModuleText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text(widget.title)),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(widget.content.replaceAll("\\n", '\n')),
              )
              ],
          )),
    );
  }

  
}
