import 'package:bloc_list/Users.dart';

class UsersResponse{

  int success;
  List<Users> usersList;

  UsersResponse(this.success, this.usersList);

  factory UsersResponse.fromJSON(Map<String,dynamic> json){

    var jsonArray = json["kisiler"] as List;

    List<Users> usersList = jsonArray.map((jsonArrayObject) => Users.fromJSON(jsonArrayObject)).toList();

    return UsersResponse(json["success"] as int, usersList);
  }
}