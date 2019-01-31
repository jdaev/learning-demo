import 'package:flutter/material.dart';

class CareerView extends StatelessWidget {
  final career;

  const CareerView({Key key, this.career}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Career'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(career['careerName'],
              style: TextStyle(color: Color(0xFF2C6DFD), fontSize: 24)),
          SizedBox(
            height: 24,
          ),
          Text(career['description'].replaceAll('\\n', '\n'),style: TextStyle(fontSize: 18)),
          SizedBox(
            height: 16.0,
          ),
          Text('Activities',
              style: TextStyle(
                  color: Color(0x8A000000),
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 16.0,
          ),
          Text(career['activities'].replaceAll('\\n', '\n'),style: TextStyle(fontSize: 18)),
          Text('Knowledge',
              style: TextStyle(
                  color: Color(0x8A000000),
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 16.0,
          ),
          Text(career['knowledge'].replaceAll('\\n', '\n'),style: TextStyle(fontSize: 18)),
          SizedBox(
            height: 16.0,
          ),
          Text('Skills',
              style: TextStyle(
                  color: Color(0x8A000000),
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 16.0,
          ),
          Text(career['skills'].replaceAll('\\n', '\n'),style: TextStyle(fontSize: 18)),
          Text('Abilities',
              style: TextStyle(
                  color: Color(0x8A000000),
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 16.0,
          ),
          Text(career['abilities'].replaceAll('\\n', '\n'),style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
