import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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

  var textFieldInput = TextEditingController();

  Future<void> writeData() async{

    var add = await getApplicationDocumentsDirectory();
    var appDirectoryPath = await add.path;

    var directory = File('${appDirectoryPath}/directory.txt');
    
    directory.writeAsString(textFieldInput.text);
    textFieldInput.text = '';
  }

  Future<void> readData() async{

    try{
      var add = await getApplicationDocumentsDirectory();
      var appDirectoryPath = await add.path;
      var directory = File('${appDirectoryPath}/directory.txt');

      String readedData = await directory.readAsString();
      textFieldInput.text=readedData;

    }catch(e){
      e.toString();
    }
  }


  Future<void> deleteData() async{

    var add = await getApplicationDocumentsDirectory();
    var appDirectoryPath = await add.path;
    var directory = File('${appDirectoryPath}/directory.txt');

    if(directory.existsSync()){
      directory.delete();
      textFieldInput.text = '';
    }
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: textFieldInput,
                decoration: InputDecoration(
                  hintText: 'Entry a data',
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: (){
                      writeData();
                    },
                    child: Text('Write'),),

                ElevatedButton(
                  onPressed: (){
                    readData();
                  },
                  child: Text('Read'),),

                ElevatedButton(
                  onPressed: (){
                    deleteData();
                  },
                  child: Text('Delete'),),
              ],
            ),

          ],
        ),
      ),

    );
  }
}
