class Directors{
  String directorID;
  String directorName;

  Directors(this.directorID, this.directorName);

  factory Directors.fromJson(Map<String,dynamic> json){
    return Directors(json["yonetmen_id"] as String,json["yonetmen_ad"] as String);
  }
}