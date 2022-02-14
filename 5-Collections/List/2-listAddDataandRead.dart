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

  print(fruits.isEmpty); // empty or not
  print(fruits.length);
  print(fruits.first);
  print(fruits.last);
  print(fruits.contains('Kiwi')); // Is there "Kiwi" on the list

  // List Reverse
  var reverseList = fruits.reversed;
  print(reverseList);

  //List Sort
  fruits.sort();
  print(fruits);

  // Element Remove
  fruits.removeAt(2); //2nd element removed.
  // Element Removing with Element Name
  fruits.remove('Watermelon'); // It removes all Watermelons.

  // List Clear
  fruits.clear();
  

}