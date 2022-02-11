// we can use an object created from one "class" in "another class"
// used in database usage.
// We create a full constructor so that the process is easy.
//   (WITHOUT LATE)

class Address{
  String street;
  String strict;
  String province;

  Address(this.street, this.strict, this.province);
}
