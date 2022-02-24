import 'dart:math';

import 'package:coding_techniques_in_widgets/resultPage.dart';
import 'package:flutter/material.dart';

class GuessScreen extends StatefulWidget {
  const GuessScreen({Key? key}) : super(key: key);

  @override
  _GuessScreenState createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {

  var textFieldGuess = TextEditingController();
  int randomVariable = 0 ;
  int remainingTry = 5 ;
  String direction = '' ;

  @override
  void initState() {
    super.initState();
    randomVariable = Random().nextInt(100); // 0-100
    print('Random variable is ${randomVariable}');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guess Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text('Remaining Try : ${remainingTry}',
              style:TextStyle(
                color: Colors.pinkAccent,fontSize: 30,
              ),
            ),

            Text('Direction : ${direction}',
              style:TextStyle(
                color: Colors.black87,fontSize: 24,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textFieldGuess,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,

                decoration: InputDecoration(
                  labelText: 'Guess',
                  border : OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: 200,

              child: ElevatedButton(onPressed: (){

                setState(() {
                  remainingTry = remainingTry - 1 ;
                });

                int guess = int.parse(textFieldGuess.text) ;

                if(guess == randomVariable){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ResultPage(result: true,),),);
                  return ;
                }

                if(guess > randomVariable){
                  setState(() {
                    direction = 'Reduce Your Guess';
                  });
                }

                if(guess < randomVariable){
                  setState(() {
                    direction = 'Increase Your Guess';
                  });
                }

                if(remainingTry == 0 ){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ResultPage(result: false,),),);
                }

                textFieldGuess.text = '' ;

                },
                child: Text('Guess',style: TextStyle(
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
