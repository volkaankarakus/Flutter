import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaserealtime/daily_special.dart';
import 'package:firebaserealtime/order.dart';
import 'package:flutter/material.dart';

class ReadExamples5 extends StatelessWidget {



  final _database = FirebaseDatabase.instance.reference();


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
              StreamBuilder(
                  stream: _database.child('dailySpecial').onValue,
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      final dailySpecial = DailySpecial.fromRTDB(
                        Map<String,dynamic>.from(
                            (snapshot.data! as Event).snapshot.value));
                      return Text(
                        dailySpecial.fancyDescription(),
                        style:TextStyle(
                          fontSize:18, fontWeight:FontWeight.w600),
                        textAlign:TextAlign.center,
                      );
                    }else{
                      return CircularProgressIndicator();
                    }
                  },
              ),

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
}

