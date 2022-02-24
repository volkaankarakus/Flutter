import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {

  bool result ;


  ResultPage({required this.result});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            widget.result ? Image.asset('images/happy.jpg') : Image.asset('images/sad.jpg') ,

            Text( widget.result ? 'YOU WIN' : 'YOU LOST',
              style:TextStyle(
                color: Colors.black87,fontSize: 36,
              ),
            ),



            SizedBox(
              width: 200,
              child: ElevatedButton(onPressed: (){
                Navigator.pop(context);
              },
                child: Text('Play Again',style: TextStyle(
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
