Future<void> main() async {
  print('Pending to get data...');
  var data = await getDataFromDatabase();
  print('Receiving data...');
  print('Received data : ${data}');

}

Future<String> getDataFromDatabase() async {

  for(var i=1;i<=5;i++){
     Future.delayed(Duration(seconds: i) , ()  => print('Amount of received data : ${i*20}'));
  }

  return Future.delayed(Duration(seconds: 5) , ()  => print('Database all data received. '));
}