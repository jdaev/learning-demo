import 'package:flutter/material.dart';

class ModuleActivity extends StatefulWidget {
  final String title;
  final String content;

  const ModuleActivity({Key key, this.title, this.content})
      : super(key: key);
  _ModuleActivityState createState() => _ModuleActivityState();
}

class _ModuleActivityState extends State<ModuleActivity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Container(
          child: Text(widget.content),
        ),
      ),
    );
  }
}