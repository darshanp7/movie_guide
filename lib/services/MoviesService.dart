import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../model/Movie.dart';

class MoviesServices{
  List<Movie> _movies;
  final String _filename = 'assets/database/db.json';

  List<String> getTitles()
  {
    List<String> titles;
    for(Movie m in _movies) {
      titles.add(m.title);
    }
    return titles;
  }

  List<Movie> getMovieList()
  {
    return _movies;
  }

  Future<String> getMovies() async {
    return await rootBundle.loadString(_filename);
  }

  void parseJson(String response) {
    if (response == null) return null;
    final parsed =
    json.decode(response.toString()).cast<Map<String, dynamic>>();
    List<Movie> list = List<Movie>.from(parsed.map((i) => Movie.fromJson(i)));
    _movies = list;
    //return parsed.map<Movie>((json) => new Movie.fromJson(json)).toList();
  }
}
