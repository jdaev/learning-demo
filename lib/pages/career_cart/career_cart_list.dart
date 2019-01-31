import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edapt/pages/career_cart/view_career.dart';
import 'package:flutter/material.dart';

class CareerList extends StatelessWidget {
  final careerList;

  const CareerList({Key key, this.careerList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Careers'),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(), // new
          children: <Widget>[
            Column(
              children: <Widget>[
                _buildListItem(
                    context, _splitList(careerList, 'law'), 'Law', 'law'),
                _buildListItem(context, _splitList(careerList, 'management'),
                    'Management', 'management'),
                _buildListItem(
                    context, _splitList(careerList, 'tech'), 'Tech', 'tech'),
                _buildListItem(context, _splitList(careerList, 'mechanics'),
                    'Mechanics', 'mechanics'),
                _buildListItem(context, _splitList(careerList, 'masscom'),
                    'Mass Communication', 'masscom'),
                _buildListItem(context, _splitList(careerList, 'finance'),
                    'Finance', 'finance'),
                _buildListItem(context, _splitList(careerList, 'science'),
                    'Science', 'science'),
                _buildListItem(context, _splitList(careerList, 'computerapp'),
                    'Computer Application', 'computerapp'),
                _buildListItem(context, _splitList(careerList, 'health'),
                    'Health', 'health'),
                _buildListItem(
                    context, _splitList(careerList, 'arts'), 'Arts', 'arts'),
                _buildListItem(context, _splitList(careerList, 'sports'),
                    'Sports', 'sports'),
                _buildListItem(context, _splitList(careerList, 'service'),
                    'Service', 'service'),
                _buildListItem(
                    context, _splitList(careerList, 'skill'), 'Skill', 'skill'),
                _buildListItem(context, _splitList(careerList, 'others'),
                    'Others', 'others'),
              ],
            )
          ],
        ),
      ),
    );
  }

  _splitList(careerList, classification) {
    List subCareers = [];
    for (int i = 0; i < careerList.length; i++) {
      if (careerList[i]['classification'] == classification) {
        subCareers.add(careerList[i]);
      }
    }
    print(classification);
    print(subCareers.length);
    return subCareers;
  }

  _buildListItem(BuildContext context, displaycareerList, classificationName,
      classification) {
    if (displaycareerList != null) {
      List<Widget> careers = displaycareerList.map<Widget>((career) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: ListTile(
            title: Text(career['careerName']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CareerView(career: career,)),
              );
            },
          ),
        );
      }).toList();
      if (careers.length >= 1) {
        return ExpansionTile(
          title: Text(classificationName),
          children: careers,
        );
      } else
        return Container();
    }
  }
}
