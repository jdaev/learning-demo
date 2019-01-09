import 'package:edapt/pages/diy_store/diy_video_screen.dart';
import 'package:flutter/material.dart';

class DIYThumbnail extends StatelessWidget {
  final String title;
  final String imagePath;

  const DIYThumbnail({Key key, this.title, this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            child: Stack(children: <Widget>[
      new Positioned.fill(
        bottom: 0.0,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: new Offset(0.0, 10.0),
                ),
              ],
              color: Colors.white),
          child: new Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      title,
                      style: new TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ]),
          ),
        ),
      ),
      new Positioned.fill(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DIYVideoScreen(),
                ),
              );
            },
          ),
        ),
      ),
    ])));
  }
}
