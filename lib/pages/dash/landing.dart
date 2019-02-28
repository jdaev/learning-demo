import 'package:edapt/pages/dash/landing_content.dart';
import 'package:edapt/pages/home_temp.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Center(
                child: Padding(
              padding: const EdgeInsets.all(36.0),
              child:
                  SizedBox(width: 120, child: Image.asset('assets/logo.png')),
            )),
            Container(
              height: 555,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            
                            children: <Widget>[
                              Text('Welcome\n', textAlign: TextAlign.center, style: TextStyle(fontSize: 16.1)),
                              Text(
                                  'It seems like you haven\'t started learning any of our courses yet. \n Please feel free to look at all the content we offer below.',
                                  textAlign: TextAlign.center, style: TextStyle(fontSize: 16.1)),
                              Text(
                                  '\nPrepare for the Fourth Industrial Revolution.',
                                  textAlign: TextAlign.center, style: TextStyle(fontSize: 16.1))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 172,
                          child: LandingContent(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Container(
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
