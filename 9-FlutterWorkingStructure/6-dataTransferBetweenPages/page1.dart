import 'package:app_structure/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Stateless Page 1!'),
            ElevatedButton(onPressed: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Page2(),),);
            },
                child: Text('Go to Page2')),
          ],
        ),
      ),
    );
  }
}