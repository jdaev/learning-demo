import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final String phoneNumber;

  const SignUpScreen({Key key, this.phoneNumber}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String firstName;
    String lastName;
    String dob;
    String standard;
    String syllabus;

    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Container(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'First Name'),
                    onChanged: (value) {
                      firstName = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    onChanged: (value) {
                      lastName = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Date Of Birth', hintText: 'DD-MM-YYYY'),
                    onChanged: (value) {
                      dob = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: Text('Grade'),
                    items: <String>[
                      '8th Standard',
                      '9th Standard',
                      '10th Standard',
                      '11th Standard',
                      '12th Standard'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      standard = value;
                    },
                    isExpanded: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: Text('Syllabus'),
                    items: <String>[
                      'Kerala State Board',
                      'CBSE',
                      'ICSE',
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      syllabus = value;
                    },
                    isExpanded: true,
                  ),
                ),
                //            Padding(
                //              padding: const EdgeInsets.all(8.0),
                //              child: TextField(
                //                decoration: InputDecoration(labelText: 'Areas Of Interest'),
                //              ),
                //            ),

                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //  OutlineButton(
                    //    child: Text('SKIP'),
                    //    onPressed: () {
                    //      Navigator.of(context).pop();
                    //      Navigator.of(context).pushReplacementNamed('/homepage');
                    //    },
                    //  ),
                    RaisedButton(
                      child: Text(
                        'SAVE',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xFF2C6DFD),
                      onPressed: () {
                        Firestore.instance.collection('users').add({
                          'firstName': firstName,
                          'lastName': lastName,
                          'phone': phoneNumber,
                          'syllabus': syllabus,
                          'standard': standard,
                        }).then((onValue){
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacementNamed('/homepage');
                        }).catchError((onError){
                          print(onError);
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
