import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24 -32) / 8;
    final double itemWidth = size.width / 2;

    final List<Widget> _pages = <Widget>[
      new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional(0.0, 0.0),
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: const AssetImage('assets/page1.png'),
                  ),
                ),
                child: Center(
                  child: Text(
                    'This is Page 1',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 32,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Colors.white),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Colors.white),
                          Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Colors.white),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Colors.white),
                        ]),
                  ),
                ),
              ),
            ]),
      ),
      new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional(0.0, 0.0),
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: const AssetImage('assets/page2.png'),
                  ),
                ),
                child: Center(
                  child: Text(
                    'This is Page 2',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 32,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Colors.white),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Colors.white),
                          Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Colors.white),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Colors.white),
                        ]),
                  ),
                ),
              ),
            ]),
      ),
      new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional(0.0, 0.0),
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: const AssetImage('assets/page3.png'),
                  ),
                ),
                child: Center(
                  child: Text(
                    'This is Page 3',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 32,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Colors.white),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Colors.white),
                          Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Colors.white),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Colors.white),
                        ]),
                  ),
                ),
              ),
            ]),
      ),
    ];

    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Container(
                  child: Stack(children: <Widget>[
                    PageView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return _pages[index % _pages.length];
                      },
                    ),
                  ]),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        offset: new Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  height: itemHeight * 2,
                  width: size.width,
                )),
          ),
          GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              controller: new ScrollController(keepScrollOffset: true),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(16),
              children: <Widget>[
                new RoundButton(
                  label: 'Information Portal',
                ),
                new RoundButton(
                  label: 'Calender',
                ),
                new RoundButton(
                  label: 'Tuition',
                  route: '/tuition_page',
                ),
                new RoundButton(
                  label: 'Competency Skills',
                ),
                new RoundButton(
                  label: 'Skills for Future',
                ),
                new RoundButton(
                  label: 'Career Cart',
                ),
                new RoundButton(
                  label: 'DIY Store',
                ),
                new RoundButton(
                  label: 'Doubt Destroyer',
                ),
                new RoundButton(
                  label: 'eResouces',
                ),
                new RoundButton(
                  label: 'Homework Assistance',
                ),
              ]),
        ],
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final String route;
  final String label;
  const RoundButton({
    Key key,
    this.route,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      new Positioned.fill(
        bottom: 0.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0),
              ),
            ],
          ),
          child: new Center(
            child: new Text(
              label,
              style: new TextStyle(color: Colors.blue, fontSize: 16.1),
            ),
          ),
        ),
      ),
      new Positioned.fill(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: () {
              if (route != null) {
                Navigator.of(context).pushNamed(route);
              }
            },
          ),
        ),
      ),
    ]);
  }
}
