class Deneme {
  int x = 10; // Global
  int y = 20; // Global

  void topla() {
    int x = 40; // Local
    int y = 10;
    x = x + y;
    print(x);
  }

  void carpma() {
    x = x * y;
    print(x);
  }
}
