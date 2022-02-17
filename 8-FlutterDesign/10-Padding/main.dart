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
      home: const MyHomePage(title: 'Title'),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 20,
                height: 150,
                color: Colors.deepPurple,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Hello Everyone'),
                ),
              ),
            ),

            Container(
              width: 20,
              height: 150,
              color: Colors.yellow,
            ),
            Container(width: 20,height: 150,color: Colors.blue,),
            Container(width: 20,height: 150,color: Colors.red,),
            Container(width: 20,height: 150,color: Colors.green,),
          ],
        ),
      ),

    );
  }
}
