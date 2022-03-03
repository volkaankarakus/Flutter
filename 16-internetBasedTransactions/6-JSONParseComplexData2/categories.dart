class Categories{
  String categoryID;
  String categoryName;

  Categories(this.categoryID, this.categoryName);
  
  factory Categories.fromJson(Map<String,dynamic> json){
    return Categories(json["kategori_id"] as String, json["kategori_ad"] as String);
  }
}