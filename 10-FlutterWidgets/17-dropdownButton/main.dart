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
      home: const MyHomePage(title: 'Dropdown Button'),
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
  var ulkeler=<String>[];
  String seciliUlke="Türkiye";

  @override
  void initState(){
    super.initState();
    ulkeler.add("Türkiye");
    ulkeler.add("Almanya");
    ulkeler.add("Rusya");
    ulkeler.add("Ukrayna");
    ulkeler.add("İngiltere");
    ulkeler.add("Avusturya");
    ulkeler.add("Fransa");
    ulkeler.add("İtalya");
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
            DropdownButton<String>(
              value: seciliUlke,
              items: ulkeler.map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text("$value",style: TextStyle(color: Colors.deepPurple,fontSize: 20),),
                );
              }).toList(),
              icon: Icon(Icons.arrow_drop_down_circle),
              onChanged: (String? secilenVeri){
                setState(() {
                  seciliUlke=secilenVeri!;
                });
              },
            ),
            Text("Seçilen Ülke: $seciliUlke"),
          ],
        ),
      ),
    );
  }
}