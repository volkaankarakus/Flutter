import 'dart:async';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaserealtime/daily_special.dart';
import 'package:firebaserealtime/order.dart';
import 'package:flutter/cupertino.dart';

class CafeModel extends ChangeNotifier{
  DailySpecial? _dailySpecial;
  List<Order> _orders = [];
  final _db = FirebaseDatabase.instance.reference();

  static const DAILY_SPECIAL_PATH = 'dailySpecial';
  static const ORDERS_PATH = 'orders';

  late StreamSubscription<Event> _dailySpecialStream;
  late StreamSubscription<Event> _orderStream;

  DailySpecial? get dailySpecial => _dailySpecial;
  List<Order> get orders => _orders;

  CafeModel(){
    _listenToDailySpecial();
    _listenToOrders();
  }

  void _listenToDailySpecial(){
    _dailySpecialStream = _db.child(DAILY_SPECIAL_PATH).onValue.listen((event) {
      _dailySpecial = DailySpecial.fromRTDB(
        Map<String,dynamic>.from(event.snapshot.value));
      notifyListeners();
    });
  }

  void _listenToOrders(){
    _orderStream = _db.child(ORDERS_PATH).onValue.listen((event) {
      final allOrders = Map<String,dynamic>.from(event.snapshot.value);
      _orders = allOrders.values.map((orderAsJSON) =>
        Order.fromRTDB(Map<String,dynamic>.from(orderAsJSON))
      ).toList();
    notifyListeners();
    });
  }

  repriceDailySpecial(){
    final newPrice = Random().nextInt(1000) / 100.0;
    _db.child(DAILY_SPECIAL_PATH).update({'price' : newPrice});

  }

  @override
  void dispose() {
    _dailySpecialStream.cancel();
    _orderStream.cancel();
    super.dispose();
  }
}