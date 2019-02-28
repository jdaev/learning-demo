import 'dart:math';

import 'package:edapt/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Profile extends StatefulWidget {
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: SharedPreferencesHelper.getUserDetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF2C6DFD),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: Color(0x40000000),
                            blurRadius: 10.0,
                            offset: new Offset(0.0, 2.0),
                          ),
                        ],
                      ),
                      height: 172,
                      width: 172,
                      margin: EdgeInsets.all(36),
                      padding: EdgeInsets.all(16),
                      child:Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        
                      ),
                      child: Icon(FontAwesomeIcons.user,size:64,color: Colors.white,),
                    ), 
                    ),
                    Text(snapshot.data['name'],
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    OutlineButton(
                      child: Text('Log Out'),
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (BuildContext context) {
                            return LoginScreen();
                          },
                        ));
                      },
                    ),                SizedBox(
                      height: 256,
                      width: MediaQuery.of(context).size.width -36,
                      child: HorizontalBarLabelChart.withSampleData()
                    )
                  ],
                ),
              ],
            );
          } else
            return Container();
        },
      ),
    );
  }
}

class SharedPreferencesHelper {
  static final Map _userDetails = {
    'name': '',
    'phone': '',
    'standard': '',
    'syllabus': '',
  };

  static Future<Map> getUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _userDetails['name'] = prefs.getString('username') ?? 'Error?';
    _userDetails['phone'] = prefs.getString('phone') ?? 'Error?';
    _userDetails['standard'] = prefs.getString('standard') ?? 'Error?';
    _userDetails['syllabus'] = prefs.getString('syllabus') ?? 'Error?';

    return _userDetails;
  }
}



class HorizontalBarLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  HorizontalBarLabelChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory HorizontalBarLabelChart.withSampleData() {
    return new HorizontalBarLabelChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  // [BarLabelDecorator] will automatically position the label
  // inside the bar if the label will fit. If the label will not fit and the
  // area outside of the bar is larger than the bar, it will draw outside of the
  // bar. Labels can always display inside or outside using [LabelPosition].
  //
  // Text style for inside / outside can be controlled independently by setting
  // [insideLabelStyleSpec] and [outsideLabelStyleSpec].
  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      vertical: false,
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      // Hide domain axis.
      domainAxis:
          new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('Regularity', 5),
      new OrdinalSales('Speed', 25),
      new OrdinalSales('Retention', 100),
      new OrdinalSales('Marks', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Sales',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (OrdinalSales sales, _) =>
              '${sales.year}: ${sales.sales.toString()}')
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
