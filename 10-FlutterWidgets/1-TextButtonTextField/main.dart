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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var textFieldController = TextEditingController();
  String receivedData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text-Button-Textfield'),
      ),
      body: Center(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textFieldController,
                decoration: InputDecoration(
                  hintText: 'Write',
                ),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  receivedData = textFieldController.text;
                });

              },
                  child: Text('Receive'),
              ),
              Text('Received data : ${receivedData}'),
            ],
          ),
      ),
    );
  }
}
