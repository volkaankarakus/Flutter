import 'package:jsonparsecomplexdata2/categories.dart';
import 'package:jsonparsecomplexdata2/directors.dart';

class Films{
  String filmID;
  String filmName;
  String filmYear;
  String filmImage;
  Categories category;
  Directors director;

  Films(this.filmID, this.filmName, this.filmYear, this.filmImage,
      this.category, this.director);

  factory Films.fromJson(Map<String,dynamic> json){
    return Films(
        json["film_id"] as String,
        json["film_ad"] as String,
        json["film_yil"] as String,
        json["film_resim"] as String,
        Categories.fromJson(json["kategori"]), // Parse process as Object
        Directors.fromJson(json["yonetmen"]),
    );
    
  }
}