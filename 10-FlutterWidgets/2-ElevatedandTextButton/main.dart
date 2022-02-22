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
              ElevatedButton(onPressed: (){
                print('ElevatedButton Clicked..');
              },
                  child: Text('ElevatedButton', style: TextStyle(color : Colors.black87),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange, // background color
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape : RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              TextButton(onPressed: (){
                print('TextButton Clicked.');
              },
                  child: Text('TextButton',style: TextStyle(color : Colors.white),),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.teal, //background color. But it is suitable for without background
                  shadowColor: Colors.black,
                  elevation: 10,
                ),
              ),
            ],
          ),
      ),
    );
  }
}
