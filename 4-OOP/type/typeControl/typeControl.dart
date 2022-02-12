// an object, we can convert it to an object from another class.
// We find which class our object belongs to with "is".

import 'package:oop/typeControl/computer.dart';

void main(){

  var computer = Computer('new', 300);

  if (computer is Computer) {
    print('It is an computer');
  }else {
    print('It is not a computer');
  }

}
