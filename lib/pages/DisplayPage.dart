import 'package:flutter/material.dart';
import '../UI/greetStudents.dart';
class DisplayPage extends StatelessWidget{
 
 final GreetStudents _greetingName;
 DisplayPage(this._greetingName);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lime,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _greetingName
        ],
      ),
    );
  }
}