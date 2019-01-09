import 'package:edapt/pages/diy_store/diy_video_thumbnail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutube/flutube.dart';

class DIYVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 2;

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('DIY'),
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
                    
                    SizedBox(
                      height: 48,
                                          child: Text(
                        'As a business owner or manager, the decision to opt for offshore software development can be difficult. As anyone who has experience knows, there are advantages and disadvantages to outsourcing software development. How then, do you balance the risks and rewards and come out on top? Here are five tips to ensure that you receive an excellent return on investment: 1. Complex project management experience………. Read More ',softWrap: true,maxLines: 3,
                      overflow: TextOverflow.ellipsis),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: SizedBox(
                        width: double.infinity,
                        height: 1,
                        
                      ),
                    ),
                    Text('Related Videos',
                        style: TextStyle(
                            color: Color(0x8A000000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 8.0,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(0.0),
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 4.0,
                      childAspectRatio: (itemWidth / itemHeight),
                      controller: new ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        DIYThumbnail(
                          imagePath: 'assets/dummyImage5.jpg',
                          title: 'Learn to bind a book',
                        ),
                        DIYThumbnail(
                          imagePath: 'assets/dummyImage6.jpg',
                          title: 'A stack of books',
                        ),
                        DIYThumbnail(
                          imagePath: 'assets/dummyImage7.jpg',
                          title: 'Program something',
                        ),
                        DIYThumbnail(
                          imagePath: 'assets/dummyImage8.jpg',
                          title: 'A proper workstation',
                        ),
                        DIYThumbnail(
                          imagePath: 'assets/dummyImage9.jpg',
                          title: 'DIY headphones?',
                        ),
                        DIYThumbnail(
                          imagePath: 'assets/dummyImage10.jpg',
                          title: 'The body is a temple',
                        ),
                        DIYThumbnail(
                          imagePath: 'assets/dummyImage11.jpg',
                          title: 'Type a little something',
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
