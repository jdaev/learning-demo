import 'package:edapt/pages/diy_store/diy_video_thumbnail_widget.dart';
import 'package:flutter/material.dart';

class DIYStoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('DIY Store'),
      ),
      body: Container(
        child: 
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: (itemWidth / itemHeight),
              controller: new ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                DIYThumbnail(imagePath: 'assets/dummyImage5.jpg',title: 'Learn to bind a book',),
                DIYThumbnail(imagePath: 'assets/dummyImage6.jpg',title: 'A stack of books',),
                DIYThumbnail(imagePath: 'assets/dummyImage7.jpg',title: 'Program something',),
                DIYThumbnail(imagePath: 'assets/dummyImage8.jpg',title: 'A proper workstation',),
                DIYThumbnail(imagePath: 'assets/dummyImage9.jpg',title: 'DIY headphones?',),
                DIYThumbnail(imagePath: 'assets/dummyImage10.jpg',title: 'The body is a temple',),
                DIYThumbnail(imagePath: 'assets/dummyImage11.jpg',title: 'Type a little something',),
              ],
            ),
          
        
      ),
    );
  }
}
