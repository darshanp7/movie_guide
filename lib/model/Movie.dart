import 'package:meta/meta.dart';
import 'dart:convert';

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
  String bannerURL;

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
    this.imgURL,
    this.bannerURL
  }
  );

  factory Movie.fromJson(Map<String, dynamic> json)
  {
    return new Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      categories: json['categories'] as List<String>,
      releaseDate: json['releaseDate'] as String,
      desc: json['desc'] as String,
      rating: json['rating'] as double,
      directors: json['directors'] as String,
      language: json['language'] as String,
      country: json['country'] as String,
      imgURL: json['imgURL'] as String,
      bannerURL: json['bannerURL'] as String,
    );
  }
}

