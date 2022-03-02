import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jsonparseoneobject/messages.dart';
import 'package:jsonparseoneobject/users.dart';

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

void mesajParse(){   // Creating JSON Model
  String strData = '{ "mesajlar" : {"mesaj_kod" : 1, "mesaj_icerik" : "basarili" }}';

  var jsonData = json.decode(strData); // converting String to JSON

  var jsonObject = jsonData["mesajlar"] ; // accessing JSON content

  var message = Messages.fromJson(jsonObject); // converting to Object

  print('Message code : ${message.message_code}');
  print('Message content : ${message.message_content}');

}


void usersParse(){
  String strData = '{"kisiler" : '
      '[{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"1231231231"}'
      ',{"kisi_id":"2","kisi_ad":"Mehmet","kisi_tel":"435456345345"}]}';

  var jsonData = json.decode(strData);
  var jsonArray = jsonData["kisiler"] as List;
  List<Users> usersList = jsonArray.map((jsonArrayObject) => Users.fromJson(jsonArrayObject)).toList();

  for(var k in usersList){
    print('******************');
    print('User ID : ${k.userID}');
    print('User Name : ${k.userName}');
    print('User Phone : ${k.userPhone}');
  }
}





@override
  void initState() {
    super.initState();
    //mesajParse();
    usersParse();
  }



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

          ],
        ),
      ),

    );
  }
}
