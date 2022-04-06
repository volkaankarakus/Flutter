// nullable fielda deger vermezsek null olur : int? a; (null)
// non-nullable fieldlara mutlaka deger vermemiz gerekir.
// int a = 5 ;
// MyClass(this.a) ; MyClass() : a = 5;
// veya late yapabiliriz -> late int a;

class Student{
  String _name;
  int _age;
  String? school; // null being default
  late String address; // there is no problem currently, but when we run this project
                          // it gives run-time error. I should give a value to "address" in main.dart

  Student? benchmate; // Connection Between Objects

  Student(this._name, this._age); // shift + alt + insert

  void sayHi(){
    print('Hi, Im $_name, and my age is $_age');
    if(benchmate != null) {
      print('My benchmate is ${benchmate?._name}');
    }
  }

  void celebrateBirthday() {
    _age +=1;
  }

  void celebrateBirthdayToBenchmate(){
    if(benchmate != null){
      print('$_name celebrated his/her birthday.');
      benchmate!.celebrateBirthday();
    }
  }
}