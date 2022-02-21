import 'package:app_structure/main.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Stateful Page 1!'),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);

            },
                child: Text('Return to previous page'),
            ),
            ElevatedButton(onPressed: (){ // No return page
              Navigator.of(context).popUntil((route) => route.isFirst);

            },
              child: Text('Return to homepage'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title : 'Homepage'),),);

            },
              child: Text('Switch to homepage'), // Opens a new page
            ),
          ],
        ),
      ),
    );
  }
}
