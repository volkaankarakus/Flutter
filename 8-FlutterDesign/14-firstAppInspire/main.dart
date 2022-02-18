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
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Inspire'),
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
    
    var screenInformation = MediaQuery.of(context);
    final double screenHeight = screenInformation.size.height;
    final double screenWidth = screenInformation.size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top:screenHeight/100 ,bottom: screenHeight/100,),
            child: SizedBox(
              width: screenWidth/3,
                child: Image.asset("images/image1.jpg",),
            ),
          ),
          Spacer(flex: 5,),
          Text('Steve Jobs',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth/25,
            ),
          ),
          Spacer(flex :95,),
          Padding(
            padding: EdgeInsets.only(left: screenWidth/25,top: screenWidth/25,),
            child: SizedBox(
              width: screenWidth/2,
              height: screenHeight/15,
              child: ElevatedButton(
                onPressed: (){
                print('Inspired...');
              },
                  child: Text('Inspire', style: TextStyle(fontSize: screenWidth/25),
                  ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
