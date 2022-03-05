import 'package:firebaserealtime/cafe_model.dart';
import 'package:firebaserealtime/cafe_view.dart';
import 'package:firebaserealtime/read_example3StreamBuilder.dart';
import 'package:firebaserealtime/read_example5.dart';
import 'package:firebaserealtime/read_example6.dart';
import 'package:firebaserealtime/read_examples1.dart';
import 'package:firebaserealtime/read_examples2.dart';
import 'package:firebaserealtime/write_examples.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  // This widget is the root of application.

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Check out examples !'),

              ElevatedButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReadExamples6()));
                  }, child: Text('Read examples')),

              ElevatedButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WriteExamples()));
                  }, child: Text('Write examples')),

              ElevatedButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider<CafeModel>(
                            create: (_) => CafeModel(),
                            child: CafeView(),
                        ),
                    ),);
                  }, child: Text('Provider example')),


            ],
          ),
        ),
      ),
    );
  }
}
