import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Enter your verification code',
                ),
                onEditingComplete: () {},
              ),
              FloatingActionButton(
                child: Icon(Icons.arrow_forward),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
