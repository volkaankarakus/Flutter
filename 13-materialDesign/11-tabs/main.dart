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
        primarySwatch: Colors.deepPurple,
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
    return DefaultTabController(
      length: 3, // number of tabBar
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),

          bottom: TabBar(
            tabs: [
              Tab(text: 'Bir',),
              Tab(icon: Icon(Icons.looks_two,color: Colors.cyanAccent,),),
              Tab(text: 'Uc',icon: Icon(Icons.looks_3,color: Colors.cyanAccent,),),
            ],
            indicatorColor: Colors.orange,
            labelColor: Colors.greenAccent,
          ),
        ),
        body: TabBarView(
          children: [
            Page1(),
            Page2(),
            Page3(),
          ],
        ),

      ),
    );
  }
}
