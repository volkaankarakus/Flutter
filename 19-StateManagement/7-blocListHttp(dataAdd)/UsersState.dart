// INTERFACE
import 'package:bloc_list/Users.dart';

abstract class UsersState{
  UsersState();
}

class UsersStartClass extends UsersState{
  UsersStartClass(); // default state
}

class UsersLoadingClass extends UsersState{
  UsersLoadingClass();
}

class UsersLoadedClass extends UsersState{
  List<Users> userList;
  UsersLoadedClass(this.userList);
}

class UsersErrorClass extends UsersState{
  String errorMessage;
  UsersErrorClass(this.errorMessage);
}


