import 'dart:async';
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

  late Timer time;
  int remainTime = 10;


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
           Text('Remain time : ${remainTime}sn', style: TextStyle(fontSize: 30),),

            ElevatedButton(
                onPressed: (){
                  time = Timer.periodic(Duration(seconds: 1), (timer) {

                    setState(() {
                      if(remainTime<1){
                        remainTime = 10;
                        time.cancel();
                      }else{
                        remainTime = remainTime -1 ;
                      }

                    });
                  });

                },
                child: Text('Start'),
            ),
          ],
        ),
      ),

    );
  }
}
