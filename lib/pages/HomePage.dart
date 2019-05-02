import 'package:flutter/material.dart';
import 'InputPage.dart';

class HomePage extends StatefulWidget{
@override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.lime,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ 
          new Container(
            padding: EdgeInsets.only(bottom: 40.0),
            child: new Text("Welcome to the Home Page", textAlign: TextAlign.center, style: TextStyle(fontFamily: "oxygen", color: Colors.white, fontSize: 50.0)),
          ),
          new Column(
            children: <Widget>[
              new Text("Tap below to proceed.", textAlign: TextAlign.center, style: TextStyle(fontSize: 35.0, color: Colors.white,fontFamily: "gugi", fontWeight: FontWeight.bold)),
              new Container(
                padding: EdgeInsets.only(top: 20.0),
                child: new InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new InputPage())),
                  child: new Icon(IconData(58270, fontFamily: 'MaterialIcons'), size: 50.0, color: Colors.green)                
                )
              )
            ],
          ),
        ],
      ),
    );
  }
}