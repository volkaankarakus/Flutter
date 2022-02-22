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

  int radioValue = 0 ;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox'),
      ),
      body: Center(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadioListTile(
                  title: Text('Galatasaray') ,
                  value: 1,
                  groupValue: radioValue,
                  activeColor: Colors.indigo,

                  onChanged:(int? data){
                    setState(() {
                      radioValue == data;
                    });
                    print('Galatasaray selected.');
                  },
              ),
              RadioListTile(
                title:Text('Fenerbahce'),
                value: 2,
                groupValue: radioValue,
                activeColor: Colors.red,
                onChanged:(int? data){
                  setState(() {
                    radioValue == data;
                  });
                  print('Fenerbahce selected.');
                },
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
