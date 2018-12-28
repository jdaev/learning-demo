import 'package:flutter/material.dart';
import 'package:flutube/flutube.dart';

class EnrollVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Enroll in Course'),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              child: FluTube(
                'https://www.youtube.com/watch?v=ZpixRmrXlE4',
                autoInitialize: true,
                aspectRatio: 16 / 9,
                onVideoStart: () {},
                onVideoEnd: () {},
              ),
            ),
            
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Video Title, Unfortunately embedding copyrighted video isn't possible",
                        style: TextStyle(color: Color(0xFF2C6DFD), fontSize: 24),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'As a business owner or manager, the decision to opt for offshore software development can be difficult. As anyone who has experience knows, there are advantages and disadvantages to outsourcing software development. How then, do you balance the risks and rewards and come out on top? Here are five tips to ensure that you receive an excellent return on investment: 1. Complex project management experience………. Read More ',
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      
                    ],
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                      child: RaisedButton(
                          child: Text('TAKE THIS COURSE',style: TextStyle(color: Colors.white ),),
                          onPressed: () {},
                          color: Color(0xFF2C6DFD),
                          elevation: 8.0,
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0))),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
