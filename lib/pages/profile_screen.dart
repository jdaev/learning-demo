import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double screenHeight = (size.height - kToolbarHeight - 24);
    final double screenWidth = size.width;

    return Container(
      child: Container(
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: TrapeziumClipper(),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2C6DFD),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Teddy Lupin',
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.class_,
                          color: Colors.white,
                        ),
                        Text(
                          '  First Year',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.grade,
                          color: Colors.white,
                        ),
                        Text(
                          '  Gold Badge',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.library_add,
                          color: Colors.white,
                        ),
                        Text(
                          '  1st in Class',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height / 14,
              left: size.width - 200,
              child: SizedBox(
                height: 144,
                width: 144,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.yellow),
                      image: DecorationImage(
                          image: AssetImage('assets/dummyImage2.jpg'),
                          fit: BoxFit.cover),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: Colors.black38,
                          blurRadius: 10.0,
                          offset: new Offset(0.0, 10.0),
                        ),
                      ]),
                ),
              ),
            ),
            Positioned(
                top: size.height / 4,
                left: 16,
                child: Text('Recent Achivements')),
            Positioned.fill(
                top: size.height / 4 + 8,
                bottom: size.height / 4 + 144,
                child: new SubList()),
            Positioned.fill(
              top: size.height / 4 + 144,
              left: size.width/5.5,
                          child: Center(
                child: Column(
                  
                  children: <Widget>[
                    ProfileSettingsButtons()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSettingsButtons extends StatelessWidget {
  const ProfileSettingsButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
            child: Row(
              children: <Widget>[
                Icon(Icons.history),
                SizedBox(width: 16,),
                Text('Student History',style: TextStyle(fontSize: 24),textAlign: TextAlign.start,)

              ],
            ),
            onPressed: () {},
            color: Colors.transparent,
            elevation: 0.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0))),
        SizedBox(
          width: 8,
        ),
        RaisedButton(
            child: Row(
              children: <Widget>[
                Icon(Icons.person_outline),
                SizedBox(width: 16,),
                Text('Account Settings',style: TextStyle(fontSize: 24),textAlign: TextAlign.start,)

              ],
            ),
            onPressed: () {},
            color: Colors.transparent,
            elevation: 0.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0))),
        SizedBox(
          width: 8,
        ),
        RaisedButton(
            child:
                Row(
              children: <Widget>[
                Icon(Icons.exit_to_app),
                SizedBox(width: 16,),
                Text('Sign Out',style: TextStyle(fontSize: 24),textAlign: TextAlign.start,)

              ],
            ),
            onPressed: () {},
            elevation: 0.0,
            color: Colors.transparent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0))),
      ],
    );
  }
}

class SubList extends StatelessWidget {
  const SubList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          RaisedButton(
              child: Text('arbitrary', style: TextStyle(fontSize: 18)),
              onPressed: () {},
              color: Colors.white,
              elevation: 8.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0))),
          SizedBox(
            width: 8,
          ),
          RaisedButton(
              child: Text('satisfying', style: TextStyle(fontSize: 18)),
              onPressed: () {},
              color: Colors.white,
              elevation: 8.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0))),
          SizedBox(
            width: 8,
          ),
          RaisedButton(
              child: Text('achievement', style: TextStyle(fontSize: 18)),
              onPressed: () {},
              elevation: 8.0,
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0))),
          SizedBox(
            width: 8,
          ),
          RaisedButton(
              child: Text('yeah', style: TextStyle(fontSize: 18)),
              onPressed: () {},
              elevation: 8.0,
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0))),
          SizedBox(
            width: 8,
          ),
        ],
      ),
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
