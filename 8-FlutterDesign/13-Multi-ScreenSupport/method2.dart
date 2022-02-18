import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    var screenInformation = MediaQuery.of(context);
    final double screenHeight = screenInformation.size.height;
    final double screenWidth = screenInformation.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight/100),
            child: SizedBox(
                width: screenWidth/2,height: screenHeight/5,
                child: Image.asset("images/flutter5786.jpg")),
          ),
          Container(
            width: screenWidth,
            height: screenHeight/5,
            color: Colors.red,
          ),
          Text('Hello everyone',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}





class BlueBox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blue,);
  }
}

class RedBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
    );
  }
}

class TextEntry extends StatelessWidget {
  String content;
  double textSize;


  TextEntry(this.content, this.textSize);

  @override
  Widget build(BuildContext context) {


    return Text(
      content,
      style: TextStyle(fontSize: textSize),
    );
  }


}
