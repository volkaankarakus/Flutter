import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit():super(0); //inital value is 0.

  void increaseCounter(){
    int counter = state + 1 ;
    emit(counter); // interface triggering
  }

  void decreaesCounter(int amount){
    int counter = state - amount ;
    emit(counter);
  }

}