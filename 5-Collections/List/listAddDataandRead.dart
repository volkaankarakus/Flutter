import 'package:flutter/material.dart';

void main(){
  var fruits = <String>[];

  fruits.add('Apple');
  fruits.add('Banana');
  fruits.add('Strawberry');
  fruits.add('Cherry');
  fruits.add('Kiwi');

  print(fruits);

  fruits[2] = 'Orange';

  // adding data to the index we want and scrolling the rest
  fruits.insert(3,'Watermelon');

  // Data Reading
  String firstFruit = fruits[0];
  print(firstFruit);
}