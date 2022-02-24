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
        primarySwatch: Colors.red,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: Card(
                color: Colors.deepOrange,
                shadowColor: Colors.orangeAccent,
                elevation: 10,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(width: 1,color : Colors.black87), // frame
                ),

                  child:Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Score', style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star,color: Colors.amber,),
                              Text('150',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
