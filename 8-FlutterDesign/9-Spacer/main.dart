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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 150,
              color: Colors.deepPurple,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text('Hello Everyone'),
              ),
            ),

            SizedBox(
                width: 100,
                height: 120,
                child: Container(
                  width: 100,
                  height: 150,
                  color: Colors.yellow,
                )
            ),
            Container(width: 20,height: 150,color: Colors.blue,),
            Spacer(flex :30,),
            Container(width: 20,height: 150,color: Colors.red,),
            Spacer(flex :70,),
            Container(width: 20,height: 150,color: Colors.green,),
          ],
        ),
      ),

    );
  }
}
