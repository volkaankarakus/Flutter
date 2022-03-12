import 'package:bloc_list/Users.dart';
import 'package:bloc_list/UsersResponse.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


// TEMPLATE
abstract class UsersRepository{
  //data process ( async -> Future )
  Future<List<Users>> getUsers();
}

class UsersDaoRepository implements UsersRepository {

  List<Users> parseUsersResponse(String response){
    return UsersResponse.fromJSON(json.decode(response)).usersList;
  }


  @override
  Future<List<Users>> getUsers() async{

    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");

    var response = await http.get(url);

    return parseUsersResponse(response.body);

  }


}

