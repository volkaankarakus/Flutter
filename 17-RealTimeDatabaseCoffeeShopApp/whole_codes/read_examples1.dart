import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebaserealtime/daily_special.dart';
import 'package:flutter/material.dart';

class ReadExamples extends StatefulWidget {
  const ReadExamples({Key? key}) : super(key: key);

  @override
  State<ReadExamples> createState() => _ReadExamplesState();
}

class _ReadExamplesState extends State<ReadExamples> {

  String _displayText = 'Results go here';
  final _database = FirebaseDatabase.instance.reference();
  late StreamSubscription _daiySpecialStream;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _activateListeners();
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
    _daiySpecialStream.cancel();
    super.deactivate();
  }
}
