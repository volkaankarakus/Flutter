class Students{
  int no;
  String name;
  String className;

  Students(this.no, this.name, this.className);


  // don't add the same numbers.
  @override
  int get hashCode => this.no;

  @override
  bool operator ==(Object other) {
    if(no == (other as Students).no){
      return true;
    }else{
      return false;
    }
  }
}