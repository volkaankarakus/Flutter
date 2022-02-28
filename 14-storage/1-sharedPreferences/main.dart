import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> saveData() async{

    var sp = await SharedPreferences.getInstance(); // get authorization from SharedPreferences
    // Thanks to "await", we will run the sp after the definition here is finished.

    sp.setString("name", "Volkan");
    sp.setInt("age", 18);
    sp.setDouble("height", 1.74);
    sp.setBool("marriedOrNot", false);

    var friendList = <String>[];
    friendList.add('Ali');
    friendList.add('Veli');

    sp.setStringList("friendList", friendList);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  saveData();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));
                },
                child: Text('Go to other page'),
            ),
          ],
        ),
      ),

    );
  }
}
