import 'package:flutter/material.dart';
import '../UI/greetStudents.dart';
import 'DisplayPage.dart';
import 'dart:convert';

class InputPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new InputPageState();
}

class InputPageState extends State<InputPage>{
  bool studentsDataReceived;
  Map<String, dynamic> _studentsData;
  GreetStudents result;
  TextEditingController studentNameTxtFieldController = new TextEditingController();
  TextEditingController studentCodeTxtFieldController = new TextEditingController();

@override
  void initState() {
    super.initState();
    studentsDataReceived = false;
  }

@override
  void dispose() {
    studentNameTxtFieldController.dispose();
    studentCodeTxtFieldController.dispose();
    super.dispose();
  }

  /*
    wait for Json File to load then flag end of reciption.
    flag can be useful so as to not use a value(eg: _studentsData) unless it is true.
    Not certain: might need to reRender UI by setState(eg: this.setState((){_studentsData = json.decode(tempString);}))
  */ 
  void _getStudentsData(BuildContext contxt, String fileName) async{
    String tempString  = await DefaultAssetBundle.of(contxt).loadString("jsonFiles/" + fileName);
    studentsDataReceived = true;
    _studentsData = json.decode(tempString);
  }

  // Error checking on inputed data 
  bool _verify(String sName, String sCode, Map<String, dynamic> registeredStudents){
    if(sName == "" || sCode == ""){
      return false;
    }else{
      if(registeredStudents.containsKey(sCode)){
        if(registeredStudents[sCode]['name'].toString().toLowerCase() == sName.toLowerCase()){
          return true;
        }else{
          return false;
        }
      }else {
        return false;
      }
    }
  }

  /* 
    if verification is successful return a customized greeting (customized by name)
    object to be used as widget in build (here it is passed as parameter to be used in DisplayPage)
  */
  GreetStudents generateResult(){
    if(_verify(studentNameTxtFieldController.text, studentCodeTxtFieldController.text, _studentsData)){
      return new GreetStudents(_studentsData[studentCodeTxtFieldController.text]['name']);
    }else{
      return null;
    }
  }

  @override
  Widget build(context) {
    // Maybe could put it in initState()
    _getStudentsData(context,"students.json");
    return new Material(
      color: Colors.lime,
      child: new InkWell(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(10.0),
              child : new  TextField(
                decoration: InputDecoration(
                  hintText: "Student Name" ,
                ),
                controller: studentNameTxtFieldController,
              )
            ),
            new Container(
              padding: EdgeInsets.all(10.0),
              child : new  TextField(
                decoration: InputDecoration(
                  hintText: "Student Code" ,
                ),
                controller: studentCodeTxtFieldController,
              )
            ),
            new Container(
              padding: EdgeInsets.only(top: 15.0),
              child : new FloatingActionButton(
                backgroundColor: Colors.limeAccent,
                onPressed: () {
                  result = generateResult();
                  if(result == null){
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: new Text("ACCESS DENIED!!!"),
                          content: new Text("Missing or incorrect data!!!"),
                        );
                      }
                    );
                  }else{
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new DisplayPage(result)));
                  }
                },
                child: new Icon(Icons.airplay),
              )
            ),
          ],
        ),
      )
    );
  }
}