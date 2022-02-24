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
        primarySwatch: Colors.red,
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
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title : Text('Sun'),
            subtitle: Text('Sun subtitle'),
            trailing: Icon(Icons.arrow_right_alt_outlined),
            onTap: (){
              print('Sun clicked.');
            },
          ),

          ListTile(
            leading: Icon(Icons.brightness_2),
            title : Text('Moon'),
            subtitle: Text('Moon subtitle'),
            trailing: Icon(Icons.arrow_right_alt_outlined),
            onTap: (){
              print('Moon clicked.');
            },
          ),

          ListTile(
            leading: Icon(Icons.star),
            title : Text('Star'),
            subtitle: Text('Star subtitle'),
            trailing: Icon(Icons.arrow_right_alt_outlined),
            onTap: (){
              print('Star clicked.');
            },
          ),

          GestureDetector(
            onTap: (){
              print('Card clicked.');
            },
            child: Card(
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Text('Card design'),
                    Spacer(),
                    Icon(Icons.more_vert),
                  ],
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              print('Container clicked.');
            },
            child: Container(
              height: 50,
              color: Colors.red,
              child: Text('Hi !'),
            ),
          ),
        ],
      ),

    );
  }
}
