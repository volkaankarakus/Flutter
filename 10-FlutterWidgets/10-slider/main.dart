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

  double progress = 50.0 ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Center(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Result : ${progress.toInt()} '),
              Slider(
                  max: 100.0,
                  min: 0.0,
                  activeColor: Colors.indigo,
                  inactiveColor: Colors.orange,
                  value: progress,
                  onChanged:(double i){
                    setState(() {
                      progress = i ;
                    });
                  }),
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
