import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier{
  int counter = 0;

  //read data
  int readCounter(){
    return counter;
  }

  void increaseCounter(){
    counter += 1;
    notifyListeners(); //trigger the listeners
  }

  void decreaseCounter(int amount){
    counter -=amount;
    notifyListeners();
  }
}