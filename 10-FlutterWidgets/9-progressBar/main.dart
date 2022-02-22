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

  bool progressBarVisibility = false ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('ProgressBar'),
      ),
      body: Center(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: progressBarVisibility,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                ),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  progressBarVisibility = true;
                });
              },
                  child:Text('Click to start progressbar'),
              ),

              ElevatedButton(onPressed: (){
                setState(() {
                  progressBarVisibility = false;
                });
              },
                child:Text('Click to stop progressbar'),
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
