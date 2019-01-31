import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final String phoneNumber;

  const SignUpScreen({Key key, this.phoneNumber}) : super(key: key);

  @override
  SignUpScreenState createState() {
    return new SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  String firstName;
  String lastName;
  String dob;
  String _standard;
  String syllabus;
  @override
  Widget build(BuildContext context) {
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
                      setState(() {
                        firstName = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    onChanged: (value) {
                      setState(() {
                        lastName = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Date Of Birth', hintText: 'DD-MM-YYYY'),
                    onChanged: (value) {
                      setState(() {
                        dob = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: Text('Grade'),
                    value: _standard,
                    onChanged: (String value) {
                      _standard = value;
                      setState(() {
                        _standard = value;
                      });
                    },
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
                        child: Text(value),
                      );
                    }).toList(),
                    value: syllabus,
                    onChanged: (String newValue) {
                      setState(() {
                        syllabus = newValue;
                      });
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
                        switch (syllabus) {
                          case 'Kerala State Board':
                            syllabus = 'KSB';
                            break;
                          case 'CBSE':
                            syllabus = 'CBSE';
                            break;
                          case 'ICSE':
                            syllabus = 'ICSE';
                            break;
                        }
                        switch (_standard) {
                          case '8th Standard':
                            _standard = '8';
                            break;
                          case '9th Standard':
                            _standard = '9';
                            break;
                          case '10th Standard':
                            _standard = '10';
                            break;
                          case '11th Standard':
                            _standard = '11';
                            break;
                          case '12th Standard':
                            _standard = '12';
                            break;
                        }
                        Firestore.instance.collection('users').add({
                          'firstName': firstName,
                          'lastName': lastName,
                          'dob': dob,
                          'phone': widget.phoneNumber,
                          'syllabus': syllabus,
                          'standard': _standard,
                        }).then((onValue) {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushReplacementNamed('/homepage');
                        }).catchError((onError) {
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
