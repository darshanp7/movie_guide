import 'package:meta/meta.dart';

class Movie 
{
  int id;
  String title;
  List<String> categories;
  String releaseDate;
  String desc;
  double rating;
  String directors;
  String language;
  String country;
  String imgURL;

  Movie(
  {
    this.id,
    this.title,
    this.categories,
    this.releaseDate,
    this.desc,
    this.rating,
    this.directors,
    this.language,
    this.country,
    this.imgURL
  }
  );
}

