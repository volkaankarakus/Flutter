import 'package:app_structure/main.dart';
import 'package:app_structure/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {

  Users user;

  Page2({required this.user});

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  Future<bool> backButton(BuildContext context) async {
    print('back button clicked.');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            print('Appbar back button clicked.');
            Navigator.pop(context);
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () => backButton(context),
        child: Center(
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
              Text('Name : ${widget.user.name}'),
              Text('Age : ${widget.user.age}'),
              Text('Height : ${widget.user.height}'),
              Text('Married or not : ${widget.user.married}'),

            ],
          ),
        ),
      ),
    );
  }
}
