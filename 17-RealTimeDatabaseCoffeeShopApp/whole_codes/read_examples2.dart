import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaserealtime/daily_special.dart';
import 'package:flutter/material.dart';

class ReadExamples2 extends StatefulWidget {
  const ReadExamples2({Key? key}) : super(key: key);

  @override
  State<ReadExamples2> createState() => _ReadExamples2State();
}

class _ReadExamples2State extends State<ReadExamples2> {

  String _displayText = 'Results go here';
  final _database = FirebaseDatabase.instance.reference();
  late StreamSubscription _daiySpecialStream;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _activateListeners();
    _performSingleFetch();
  }

  void _activateListeners(){
    _daiySpecialStream=
        _database.child('dailySpecial').onValue.listen((event) {
          final data = new Map<String,dynamic>.from(event.snapshot.value);
          final dailySpecial = DailySpecial.fromRTDB(data);
          setState(() {
            _displayText = dailySpecial.fancyDescription();
          });
        });

  }

  void _performSingleFetch(){
    _database.child('dailySpecial').once().then((snapshot) {
      final data = new Map<String,dynamic>.from(snapshot.value);
      final dailySpecial = DailySpecial.fromRTDB(data);

      setState(() {
        _displayText = dailySpecial.fancyDescription();
      });

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read examples'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_displayText),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    // _daiySpecialStream.cancel();
    super.deactivate();
  }
}
