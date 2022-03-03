import 'package:jsonparsecomplexdata2/films.dart';

class FilmsResponse{
  int success;
  List<Films> filmList;

  FilmsResponse(this.success, this.filmList);

  factory FilmsResponse.fromJson(Map<String,dynamic> json){

    var jsonArray = json["filmler"] as List;
    List<Films> filmList = jsonArray.map((jsonArrayObject) => Films.fromJson(jsonArrayObject)).toList();

    return FilmsResponse(
        json["success"] as int,
        filmList);
  }
}