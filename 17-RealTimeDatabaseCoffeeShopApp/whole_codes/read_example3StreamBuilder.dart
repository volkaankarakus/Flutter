import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaserealtime/daily_special.dart';
import 'package:flutter/material.dart';

class ReadExamples3 extends StatefulWidget {
  const ReadExamples3({Key? key}) : super(key: key);

  @override
  State<ReadExamples3> createState() => _ReadExamples3State();
}

class _ReadExamples3State extends State<ReadExamples3> {

  String _displayText = 'Results go here';
  final _database = FirebaseDatabase.instance.reference();
  // late StreamSubscription _daiySpecialStream;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _activateListeners();
    _performSingleFetch();
  }


  /*
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
  */


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
              SizedBox(height: 50,),
              StreamBuilder(
                  stream: _database.child('orders').orderByKey().limitToLast(10).onValue,
                  builder: (context,snapshot) {
                    final tilesList = <ListTile>[];
                    if(snapshot.hasData){
                      final myOrders = Map<String,dynamic>.from((snapshot.data! as Event).snapshot.value);
                      myOrders.forEach((key, value) {
                        final nextOrder = Map<String,dynamic>.from(value);
                        final orderTile = ListTile(
                          leading: Icon(Icons.local_cafe),
                          title:Text(nextOrder['description']),
                            subtitle : Text(nextOrder['costumer']));
                        tilesList.add(orderTile);
                      });
                    }
                    return Expanded(
                      child: ListView(
                        children: tilesList,
                      ),
                    );
                  }),

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
