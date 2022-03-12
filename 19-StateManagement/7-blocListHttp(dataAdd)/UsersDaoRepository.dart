import 'package:bloc_list/Users.dart';
import 'package:bloc_list/UsersResponse.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


// TEMPLATE
abstract class UsersRepository{
  //data process ( async -> Future )
  Future<List<Users>> getUsers();
  Future<void> deleteUser(int user_ID);
  Future<void> registerUser(String user_name,String user_phone);
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


  @override
  Future<void> deleteUser(int user_ID) async{

    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php");
    var data = {"kisi_id" : user_ID.toString()};
    var response = await http.post(url,body: data);

    print("Delete response : ${response.body}");
  }


  @override
  Future<void> registerUser(String user_name,String user_phone) async{

    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php");
    var data = {"kisi_ad" : user_name, "kisi_tel" : user_phone};
    var response = await http.post(url,body: data);

    print("Adding response : ${response.body}");
  }


}

