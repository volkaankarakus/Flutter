void main(){
  List<Teacher> teachers = [
    Teacher('Volkan'),
    EnglishTeacher('Speaking', 'John'),
  ];

  for(final o in teachers){
    o.sayHiTeacher();
  }
}

class Teacher {
  String name;

  Teacher(this.name);

  void sayHiTeacher(){
    print('Hi, Im $name teacher');
  }
}

class EnglishTeacher extends Teacher{
  String chapter;

  EnglishTeacher(this.chapter,String name) : super(name);

  @override
  void sayHiTeacher() {
    super.sayHiTeacher();
    print('I was at $chapter chapter');
  }
}