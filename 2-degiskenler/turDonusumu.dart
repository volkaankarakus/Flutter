void main() {
  // int to double / double to int
  int i = 42;
  double d = 42.24;

  int result1 = d.toInt();
  double result2 = i.toDouble();

  // int to string
  String str1 = i.toString();
  String str2 = d.toString();

  // string to int
  String message = "Hi!";
  int s1 = int.parse(message);
  double s2 = double.parse(message);
}
