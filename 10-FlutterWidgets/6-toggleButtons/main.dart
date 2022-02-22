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

  bool switchControl = false;

  var toggleStates = [false,true,false];
  int chosenToggleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toggle'),
      ),
      body: Center(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(children: [
                Icon(Icons.looks_one),
                Icon(Icons.looks_two),
                Icon(Icons.looks_3),
              ],
              isSelected: toggleStates,
              color : Colors.red, // for notselecting
              selectedColor: Colors.green,
              fillColor: Colors.yellow,

              onPressed: (int chosenIndex){
                chosenToggleIndex = chosenIndex;
                print('${chosenIndex+1}th toggle selected.');

                setState(() {
                  toggleStates[chosenIndex] = !toggleStates[chosenIndex] ;
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
