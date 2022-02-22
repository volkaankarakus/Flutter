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

  bool kotlinState = false;
  bool dartState = false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox'),
      ),
      body: Center(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CheckboxListTile(
                  value: kotlinState,
                  title: Text('Kotlin'),
                  controlAffinity: ListTileControlAffinity.leading, // put the rectangle to the left
                  activeColor: Colors.deepOrange,

                  onChanged: (bool? data) {
                    print('Kotlin selected : ${data}');

                    setState(() {
                      kotlinState == data;
                    });
                  },
              ),

              CheckboxListTile(
                value: dartState,
                title: Text('Dart'),
                controlAffinity: ListTileControlAffinity.leading, // put the rectangle to the left
                checkColor: Colors.red,
                activeColor: Colors.deepOrange,

                onChanged: (bool? data) {
                  print('Dart selected : ${data}');


                  setState(() {
                    dartState == data;
                  });
                },
              ),

            ],
          ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:(){
          print('Fab1 clicked.');
        },
        label: Text('Fab'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.pinkAccent,
      ),
    );
  }
}
