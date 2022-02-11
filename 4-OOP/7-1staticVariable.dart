// used to get value inside "class" without creating Object
// Usually static statements are used with "final".
// We make "static" to access frequently used methods
class GenerateStatic{
  static int variable1 = 10;

  static final double rate = 10.4; // If we want the value inside to not change

  static void greeting(){
    print('Hi!');
  }
}