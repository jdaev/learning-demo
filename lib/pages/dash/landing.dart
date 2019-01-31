import 'package:edapt/pages/dash/landing_content.dart';
import 'package:edapt/pages/home_temp.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              height: 260.0,
              width: double.infinity,
              color: Color(0xFF2C6DFD),
            ),
            Positioned(
              bottom: 50.0,
              right: 100.0,
              child: Container(
                height: 400.0,
                width: 400.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    color: Colors.blue.withOpacity(0.4)),
              ),
            ),
            Positioned(
              bottom: 100.0,
              left: 150.0,
              child: Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150.0),
                      color: Colors.lightBlueAccent.withOpacity(0.5))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50.0),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Lets Learn',
                    style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: 25.0),
                SizedBox(height: 10.0)
              ],
            ),
            Positioned(
              top: 150,
              child: Container(
                height: 172,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: LandingContent(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 50,),
        Container(
          child: Container(
            margin: EdgeInsets.all(16),
            height: 256,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: new Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('No new notifications :)')),
          ),
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height * 3 / 10);
    path.lineTo(size.width, size.height * 2 / 10);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TrapeziumClipper oldClipper) => false;
}

class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0.0, size.height * 3 / 10);
    path.lineTo(size.width, size.height * 2 / 10);

    canvas.drawShadow(path, Colors.black12, 8.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
