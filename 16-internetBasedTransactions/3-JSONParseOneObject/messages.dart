class Messages{
  int message_code;
  String message_content;

  Messages(this.message_code, this.message_content);

  factory Messages.fromJson(Map<String,dynamic> json){ // keys are Strings, values are dynamic
    return Messages(json['mesaj_kod'] as int, json['mesaj_icerik'] as String);

  }
}