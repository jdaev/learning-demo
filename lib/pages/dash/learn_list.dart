import 'package:edapt/my_flutter_app_icons.dart';
import 'package:edapt/pages/tuition/tution_button.dart';
import 'package:flutter/material.dart';

class LearnList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16,16,0,0),
              child: Text('Tuition',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            _returnTuitionList(),
          ]),
    );
  }

  _returnTuitionList(){
    return SizedBox(
      height: 172,
      
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          TutionButton(
            title: 'Physics',
            icon: MyFlutterApp.icon,
            startColor: 0xFF3324AD,
            endColor: 0xFFBE69D4,
          ),
          TutionButton(
            title: 'Chemistry',
            icon: MyFlutterApp.atom,
            startColor: 0xFF2496B3,
            endColor: 0xFF66CFE7,
          ),
          TutionButton(
            title: 'Biology',
            icon: MyFlutterApp.microscope,
            startColor: 0xFFF9D184,
            endColor: 0xFFEF4A4B,
          ),
          TutionButton(
            title: 'Mathematics',
            icon: MyFlutterApp.compass,
            startColor: 0xFFBB51E5,
            endColor: 0xFFEB4B5A,
          ),
          TutionButton(
            title: 'Geography',
            icon: MyFlutterApp.globe_grid,
            startColor: 0xFF15BCE8,
            endColor: 0xFFA042E5,
          ),
          TutionButton(
            title: 'History',
            icon: MyFlutterApp.bookshelf,
            startColor: 0xFFB32926,
            endColor: 0xFF6D1F1D,
            correction: 10.0,
          ),
          TutionButton(
            title: 'English',
            icon: MyFlutterApp.blackboard,
            startColor: 0xFFF40194,
            endColor: 0xFF592C47,
            correction: 26.0,
          ),
          TutionButton(
            title: 'IT',
            icon: MyFlutterApp.computer,
            startColor: 0xFF24463D,
            endColor: 0xFF68B08F,
          ),
        ],
      ),
    );
  }
}
  