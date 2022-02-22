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

  String imageName = 'recipe1.jpg' ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/${imageName}'),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    imageName = 'recipe1.jpg';
                  });

            },
                child: Text('Image 1'),
            ),

            ElevatedButton(
              onPressed: (){
                setState(() {
                  imageName = 'recipe2.jpg';
                });
              },
              child: Text('Image 2'),
            ),

          ],
        ),
      ),

    );
  }
}
