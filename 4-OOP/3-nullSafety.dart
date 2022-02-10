// The application may crash because null is used
// null safety : used with "?". Then the "if" check is done.

// In the null-safe variable, then "!" If it is used, it means I trust the code.

void main(){
  String? message = null;
  String? name = null;

  message = 'Hi!';
  print('message: ${message.toUpperCase()}\nname: ${name}');
  // The application did not crash even though "name" was null.
  if(name != null){
    print('Name is not null.');
  }else{
    print('Name is null and enter a name.');
  }

}