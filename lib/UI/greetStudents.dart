import 'package:flutter/material.dart';

class GreetStudents extends StatelessWidget{
  final String _studentName;
  GreetStudents(this._studentName);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome back " + _studentName + "!!!",
      style: TextStyle(
        color: Colors.white,
        fontSize: 40.0
      ),
      textAlign: TextAlign.center,
    );
  }
}