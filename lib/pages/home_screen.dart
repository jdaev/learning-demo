import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Card(
                margin: EdgeInsets.all(16.0),
                elevation: 4.0,
                child: Container(
                  decoration: new BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                  height: 187,
                  width: 384,
                )),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 3, 5, 3),
                    child: RaisedButton(
                      color: Colors.white,
                      child: SizedBox(child: Center(child: Text('Information Portal')),
                      height: 56,),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 3, 16, 3),
                    child: RaisedButton(
                      color: Colors.white,
                      child: SizedBox(child: Center(child: Text('Calender')),
                      height: 56,),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 3, 5, 3),
                    child: RaisedButton(
                      color: Colors.white,
                      child: SizedBox(child: Center(child: Text('Tuition')),
                      height: 56,),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 3, 16, 3),
                    child: RaisedButton(
                      color: Colors.white,
                      child: SizedBox(child: Center(child: Text('Competency Skills')),
                      height: 56,),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 3, 5, 3),
                    child: RaisedButton(
                      color: Colors.white,
                      child: SizedBox(child: Center(child: Text('Skills for Future')),
                      height: 56,),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 3, 16, 3),
                    child: RaisedButton(
                      color: Colors.white,
                      child: SizedBox(child: Center(child: Text('Career Cart')),
                      height: 56,),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 3, 5, 3),
                    child: RaisedButton(
                      color: Colors.white,
                      child: SizedBox(child: Center(child: Text('DIY Store')),
                      height: 56,),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 3, 16, 3),
                    child: RaisedButton(
                      color: Colors.white,
                      child: SizedBox(child: Center(child: Text('Doubt Destroyer')),
                      height: 56,),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 3, 5, 3),
                    child: RaisedButton(
                      color: Colors.white,
                      child: SizedBox(child: Center(child: Text('eResources')),
                      height: 56,),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 3, 16, 3),
                    child: RaisedButton(
                      color: Colors.white,
                      child: SizedBox(child: Center(child: Text('Homework Assistance',textAlign: TextAlign.center, )),
                      height: 56,),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
