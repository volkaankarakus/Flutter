import 'package:oop/compositionExampleDatabase/categories.dart';
import 'package:oop/compositionExampleDatabase/directors.dart';
import 'package:oop/compositionExampleDatabase/films.dart';

void main(){
  var category1 = Categories(1, 'Dram');
  var category2 = Categories(2, 'Comedy');
  var category3 = Categories(3, 'Science Fiction');
  
  var director1 = Directors(1, 'Nuri Bilgi Ceylan');
  var director2 = Directors(2, 'Quentin Tarantino');
  var director3 = Directors(3, 'Christopher Nolan');

  var film1 = Films(1,'Django', 2013, category1, director2);
  var film2 = Films(2, 'Inception', 2006, category3, director3);

  print('Film ID : ${film1.filmID}');
  print('Film Name : ${film1.filmName}');
  print('Film Year : ${film1.filmYear}');
  print('Film Category : ${film1.categories.categoryName}');
  print('Film Directore : ${film1.directors.directorName}');   
}