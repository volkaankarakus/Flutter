import 'package:bloc_list/Users.dart';


// TEMPLATE
abstract class UsersRepository{
  //data process ( async -> Future )
  Future<List<Users>> getUsers();
}

class UsersDaoRepository implements UsersRepository {

  @override
  Future<List<Users>> getUsers() async{
    var userList = <Users>[];

    var user1 = Users("1", "Ahmet", "1111111111");
    var user2 = Users("2", "Mehmet", "1123111111");
    userList.add(user1);
    userList.add(user2);
    
    return userList;

  }


}

