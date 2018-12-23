import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Edapt',
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.none),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Card(
                elevation: 8.0,
                margin: EdgeInsets.fromLTRB(16, 16, 16, 100),
                child: SizedBox(
                  height: 200,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.phone_android),
                              labelText: 'Mobile Number'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text('New User?'),
                                Text(
                                  'Create an Account',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 165,
                top: 189,
                child: SizedBox(
                  height: 56,
                  width: 56,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    elevation: 8.0,
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
