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
      home: const MyHomePage(title: 'Drawer'),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // for exact alignment of the title
          children: [
            DrawerHeader(
                child: Text('Title Design',style: TextStyle(color: Colors.white,fontSize: 30),),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
            ),

            ListTile(   // for line design
              title: Text('Page1'),
              onTap: (){
                setState(() {
                  selectedIndex = 0 ;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(   // for line design
              title: Text('Page2'),
              onTap: (){
                setState(() {
                  selectedIndex = 1 ;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(   // for line design
              title: Text('Page3'),
              leading: Icon(Icons.looks_3,color: Colors.orange,),
              onTap: (){
                setState(() {
                  selectedIndex = 2 ;
                });
                Navigator.pop(context);
              },

            ),
          ],
        ),
      ),

    );
  }
}
