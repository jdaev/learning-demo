import 'package:flutter/material.dart';

class CareerCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 2;

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: (itemWidth / itemHeight),
          controller: new ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
                child: Stack(children: <Widget>[
              new Positioned.fill(
                bottom: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Color(0x40000000),
                        blurRadius: 10.0,
                        offset: new Offset(0.0, 2.0),
                      ),
                    ],
                  ),
                  child: new Center(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                   new Image.asset('assets/EmergingCareer.png'),
                                  SizedBox(
                                    width: 0.0,
                                  )
                                ]),
                          ),
                          new Text(
                            'Expiring Careers',
                            style: new TextStyle(
                              color: Color(0xFF2C6DFD),
                              fontSize: 16.1,
                            ),
                            textAlign: TextAlign.center,
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
                    onTap: () {},
                  ),
                ),
              ),
            ])),
            Container(
                child: Stack(children: <Widget>[
              new Positioned.fill(
                bottom: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Color(0x40000000),
                        blurRadius: 10.0,
                        offset: new Offset(0.0, 2.0),
                      ),
                    ],
                  ),
                  child: new Center(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                   new Image.asset('assets/ExistingCareers.png'),
                                  SizedBox(
                                    width: 0.0,
                                  )
                                ]),
                          ),
                          new Text(
                            'Careers unchanged',
                            style: new TextStyle(
                              color: Color(0xFF2C6DFD),
                              fontSize: 16.1,
                            ),
                            textAlign: TextAlign.center,
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
                    onTap: () {},
                  ),
                ),
              ),
            ])),
            Container(
                child: Stack(children: <Widget>[
              new Positioned.fill(
                bottom: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: Color(0x40000000),
                        blurRadius: 10.0,
                        offset: new Offset(0.0, 2.0),
                      ),
                    ],
                  ),
                  child: new Center(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Image.asset('assets/EmergingCareer.png'),
                                  SizedBox(
                                    width: 0.0,
                                  )
                                ]),
                          ),
                          new Text(
                            'Emerging Careers',
                            style: new TextStyle(
                              color: Color(0xFF2C6DFD),
                              fontSize: 16.1,
                            ),
                            textAlign: TextAlign.center,
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
                    onTap: () {},
                  ),
                ),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
