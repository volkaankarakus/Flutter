import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  Future<void> readData() async{

    var sp = await SharedPreferences.getInstance(); // get authorization from SharedPreferences
    // Thanks to "await", we will run the sp after the definition here is finished.

    String name = sp.getString("name") ?? "Unknown name" ; // if error occurs
    int age = sp.getInt("age") ?? 999;
    double height = sp.getDouble('height') ?? 1.80;
    bool marriedOrNot = sp.getBool('marriedOrNot') ?? false;
    
    var friendList = sp.getStringList('friendList') ?? null ;
    print('Name : ${name}');
    print('Age : ${age}');
    print('Height : ${height}');
    print('Married?  : ${marriedOrNot}');

    for( var a in friendList!){
      print('Friend : ${a}');
    }

  }

  Future<void> deleteData() async{

    var sp = await SharedPreferences.getInstance(); // get authorization from SharedPreferences
    // Thanks to "await", we will run the sp after the definition here is finished.

    sp.remove("name");
  }

  Future<void> updateData() async{

    var sp = await SharedPreferences.getInstance(); // get authorization from SharedPreferences
    // Thanks to "await", we will run the sp after the definition here is finished.

    sp.setInt("age", 29);
  }


  @override
  void initState() {
    super.initState();

    //deleteData();
    updateData();
    readData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body: Center(),

    );
  }
}
