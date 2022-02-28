import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int counter = 0;

  Future<void> counterControl() async{

    var sp = await SharedPreferences.getInstance();

    counter = sp.getInt('counter') ?? 0 ;
    setState(() {
      counter = counter + 1 ;

    });

    sp.setInt('counter', counter);
  }

  @override
  void initState() {
    super.initState();
    counterControl();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count : ${counter}', style: TextStyle(color: Colors.orange,fontSize: 30),),
          ],
        ),
      ),

    );
  }
}
