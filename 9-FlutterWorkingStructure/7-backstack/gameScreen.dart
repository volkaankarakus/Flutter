import 'package:backstack/resultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gameScreen extends StatefulWidget {
  const gameScreen({Key? key}) : super(key: key);

  @override
  _gameScreenState createState() => _gameScreenState();
}

class _gameScreenState extends State<gameScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(),),);

          },
            child: Text('Go to Result Page'),
          ),
        ],
      ),
    );

  }
}
