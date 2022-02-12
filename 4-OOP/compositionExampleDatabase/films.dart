import 'package:oop/compositionExampleDatabase/categories.dart';
import 'package:oop/compositionExampleDatabase/directors.dart';

class Films{
  int filmID;
  String filmName;
  int filmYear;
  Categories categories ;
  Directors directors ;

  Films(this.filmID, this.filmName, this.filmYear, this.categories,
      this.directors);
}