class Users{
  String userID;
  String userName;
  String userPhone;

  Users(this.userID, this.userName, this.userPhone);

  factory Users.fromJson(Map<String,dynamic> json){
    return Users(
        json["kisi_id"] as String,
        json["kisi_ad"] as String,
        json["kisi_tel"] as String,
    );
  }
}