import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabs/Page1.dart';
import 'package:tabs/Page2.dart';
import 'package:tabs/Page3.dart';

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
        primarySwatch: Colors.orange,
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

  var pageList = [Page1(),Page2(),Page3()];

  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: 'One',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: 'Two',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: 'Three',
          ),
        ],

        backgroundColor:Colors.orange,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.white,

        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
