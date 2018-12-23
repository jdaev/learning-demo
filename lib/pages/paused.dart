import 'package:flutter/material.dart';

class PausedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: 360,
          child: Card(
            margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
            elevation: 4.0,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                  child: SizedBox(
                    height: 206,
                    width: 385,
                  ),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Text('This is a sample course title, lorem ipsum something something')),
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    width: 56,
                  )
                ]),
                ButtonBar(
                  mainAxisSize: MainAxisSize.max,
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.message),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 330,
          top: 193,
                  child: SizedBox(
            height: 40,
            width: 40,
                    child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
              
            ),
          ),
        )
      ],
    );
  }
}
