import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './Movie.dart';
import './pages/HomePage.dart';

void main() => runApp(MovieGuideApp());

class MovieGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}



