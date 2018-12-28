import 'package:flutter/material.dart';
import 'package:flutube/flutube.dart';

class TopicVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tuition'),
        ),
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
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  shrinkWrap: true,
                    children: <Widget>[
                      Text(
                        "Video Title, Unfortunately embedding copyrighted video isn't possible",
                        style: TextStyle(color: Color(0xFF2C6DFD), fontSize: 24),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text('Video Summary',
                          style: TextStyle(
                              color: Color(0x8A000000),
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'As a business owner or manager, the decision to opt for offshore software development can be difficult. As anyone who has experience knows, there are advantages and disadvantages to outsourcing software development. How then, do you balance the risks and rewards and come out on top? Here are five tips to ensure that you receive an excellent return on investment: 1. Complex project management experience………. Read More ',
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: SizedBox(
                          width: double.infinity,
                          height: 1,
                          child: Container(
                            color: Color(0x8A000000),
                          ),
                        ),
                      ),
                      Text('Video Transcript',
                          style: TextStyle(
                              color: Color(0x8A000000),
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'As a business owner or manager, the decision to opt for offshore software development can be difficult. As anyone who has experience knows, there are advantages and disadvantages to outsourcing software development. How then, do you balance the risks and rewards and come out on top? Here are five tips to ensure that you receive an excellent return on investment: 1. Complex project management experience………. Read More ',
                      ),
                    ],
                  ),
              ),
              
            
          ]
          ,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
