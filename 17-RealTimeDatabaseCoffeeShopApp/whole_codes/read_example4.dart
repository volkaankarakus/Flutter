import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaserealtime/daily_special.dart';
import 'package:firebaserealtime/order.dart';
import 'package:flutter/material.dart';

class ReadExamples4 extends StatefulWidget {
  const ReadExamples4({Key? key}) : super(key: key);

  @override
  State<ReadExamples4> createState() => _ReadExamples4State();
}

class _ReadExamples4State extends State<ReadExamples4> {

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

              FutureBuilder(
                  future: _database.child('dailySpecial').once(),
                  builder: (context,snapshot) {
                    if (snapshot.hasData) {
                      final dailySpecial = DailySpecial.fromRTDB(
                          Map<String, dynamic>.from(
                              (snapshot.data as DataSnapshot).value));
                      return Text(dailySpecial.fancyDescription());
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
              ),

              Text(_displayText),

              SizedBox(height: 50,),

              StreamBuilder(
                  stream: _database.child('orders').orderByKey().limitToLast(10).onValue,
                  builder: (context,snapshot) {
                    final tilesList = <ListTile>[];
                    if(snapshot.hasData) {
                      final myOrders = Map<String, dynamic>.from(
                          (snapshot.data! as Event).snapshot.value);

                      tilesList.addAll(
                        myOrders.values.map((value) { // like forEach in RTDB
                          final nextOrder = Order.fromRTDB(
                              Map<String, dynamic>.from(value));
                          return ListTile(
                              leading: Icon(Icons.local_cafe),
                              title: Text(nextOrder.description),
                              subtitle: Text(nextOrder.costumerName));
                        }),
                      );
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
