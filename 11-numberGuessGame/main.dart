import 'package:coding_techniques_in_widgets/guessPage.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Guess Game',
            style:TextStyle(
              color: Colors.black87,fontSize: 36,
            ),
            ),

            Image.asset('images/dice.png'),

            SizedBox(
              width: 200,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => GuessScreen(),),);

              },
                  child: Text('Play Game',style: TextStyle(
                    color: Colors.white,
                  ),
                  ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}