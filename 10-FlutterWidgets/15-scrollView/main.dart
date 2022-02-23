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

  String imageName = 'django.png' ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollView'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 500,
                color: Colors.indigo,
              ),

              Container(
                width: 300,
                height: 500,
                color: Colors.orange,
                child: FadeInImage.assetNetwork(
                    placeholder: 'images/placeholder.jpg',
                    image: 'http://kasimadalan.pe.hu/filmler/resimler/${imageName}'),
              ),


              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      imageName = 'inception.png';
                    });

              },
                  child: Text('Inception'),
              ),

              ElevatedButton(
                onPressed: (){
                  setState(() {
                    imageName = 'django.png';
                  });
                },
                child: Text('Django'),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
