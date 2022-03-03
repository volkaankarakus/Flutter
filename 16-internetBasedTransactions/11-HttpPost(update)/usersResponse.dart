import 'package:httplibrary/users.dart';

class UsersResponse{
  int success;
  List<Users> usersList;

  UsersResponse(this.success, this.usersList);

  factory UsersResponse.fromJson(Map<String,dynamic> json){
    var jsonArray = json["kisiler"] as List;
    List<Users> usersList =jsonArray.map((jsonArrayObject) => Users.fromJson(jsonArrayObject)).toList();
    return UsersResponse(json["success"] as int, usersList);
  }
}