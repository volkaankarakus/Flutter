void main(){
  String text = 'I am so happy to present these codes!';

  // to get a certain part

  String subText = text.substring(0,8);
  print(subText);

  String upper = text.toUpperCase();
  String lower = text.toLowerCase();

  // break a sentence into words
  String sentence = "Hi Hello How About You?";
  var list = sentence.split(" ");
  for (var i in list){
    print(i);
  }


}