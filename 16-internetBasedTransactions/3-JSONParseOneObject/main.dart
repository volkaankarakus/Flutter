import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jsonparseoneobject/messages.dart';

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

void mesajParse(){   // Creating JSON Model
  String strData = '{ "mesajlar" : {"mesaj_kod" : 1, "mesaj_icerik" : "basarili" }}';

  var jsonData = json.decode(strData); // converting String to JSON

  var jsonObject = jsonData["mesajlar"] ; // accessing JSON content

  var message = Messages.fromJson(jsonObject); // converting to Object

  print('Message code : ${message.message_code}');
  print('Message content : ${message.message_content}');

}

@override
  void initState() {
    super.initState();
    mesajParse();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      ),

    );
  }
}
