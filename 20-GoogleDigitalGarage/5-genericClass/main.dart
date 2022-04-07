// GENERIC CLASS

void main(){

  final m = MyClass<String>('hi');

  print(m.val);

}

class MyClass<T>{
  T val ;

  MyClass(this.val);
}