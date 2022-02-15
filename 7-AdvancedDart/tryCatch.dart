void main(){

  var numbers = <int>[33,542,123,12,14];

  try{
    numbers[8] = 11;
    print('It works');
  }catch(e){
    print('You have exceeded the size of the list');
  }

}