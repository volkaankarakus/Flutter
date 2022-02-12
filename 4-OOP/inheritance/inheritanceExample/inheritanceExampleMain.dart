import 'package:oop/inheritanceExample/palace.dart';
import 'package:oop/inheritanceExample/villa.dart';

void main(){
  var topkapiPallace = Palace(3, 3);
  var villa1 = Villa(true, 5);

  print('Number of Topkapi Pallace Tower : ${topkapiPallace.numberOfTowers}');
} 