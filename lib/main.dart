import 'package:flutter/material.dart' show AppBar, BuildContext, Colors, Column, Container, EdgeInsets, FontWeight, InputDecoration, MainAxisAlignment, MaterialApp, MaterialButton, Padding, Row, Scaffold, State, StatefulWidget, StatelessWidget, Text, TextEditingController, TextField, TextInputType, TextStyle, ThemeData, Widget, runApp;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "Calculator app",
      home: new Homepage(),
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange
      ),
    );
  }
}

class Homepage extends StatefulWidget{
  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  var num1 = 0, num2 = 0, sum = 0;

  final TextEditingController t1 = TextEditingController(text: '0');
  final TextEditingController t2 = TextEditingController(text: '0');

  void doAdd(){
    setState((){
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void doMul(){
    setState((){
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void doSub(){
    setState((){
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }

  void doDiv(){
    setState((){
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 ~/ num2;
    });
  }

  void doClear(){
    setState(() {
     t1.text='0';
     t2.text='0'; 
     sum=0;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
        backgroundColor: Colors.red,
      ),
      body: new Container(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[   
            new Text(
              "Output : $sum",
              style: new TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
            ),      
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Enter Number 1"
              ),
              controller: t1,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Enter Number 2"
              ),
              controller: t2, 
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 30),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  color: Colors.greenAccent,
                  child: new Text("+",style: new TextStyle(fontSize: 20),),
                  onPressed: doAdd,
                ),
                new MaterialButton(
                  color: Colors.greenAccent,
                  child: new Text("-",style: new TextStyle(fontSize: 20),),
                  onPressed: doSub,
                )
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 15),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  color: Colors.greenAccent,
                  child: new Text("*",style: new TextStyle(fontSize: 20),),
                  onPressed: doMul,
                ),
                new MaterialButton(
                  color: Colors.greenAccent,
                  child: new Text("/",style: new TextStyle(fontSize: 20,)),
                  onPressed: doDiv,
                )
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  color: Colors.greenAccent,
                  child: new Text("Clear"),
                  onPressed: doClear,
                ),
              ],
            ) 
          ],
        ),
      ),
    );
  }

}