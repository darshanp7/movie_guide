import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MovieGuideApp());

class MovieGuideApp extends StatelessWidget {
  final List<String> imagesURL = [
    'assets/images/lorena.bmp',
    'assets/images/papalion.bmp',
    'assets/images/johnwick.jpg',
    "assets/images/dict.jpg",
    "assets/images/fight.jpg",
    "assets/images/twoguys.jpg",
    "assets/images/wildtales.jpg",
    "assets/images/shanghai.jpg",
    "assets/images/abad.jpg",
    "assets/images/dict.jpg"
  ];

  MovieGuideApp() {}

  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    print('In Build');
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Movie Guide'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: () {},
                )
              ],
              leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            ),
            body: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(4.0),
              childAspectRatio: 140 / 209,
              children: List.generate(imagesURL.length, (index) {
                return _singleGridCard(index, context);
              }),
            )));
  }

  Widget _singleGridCard(int index, BuildContext context) {
    var gridCard = Card(
        elevation: 1.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        clipBehavior: Clip.hardEdge,
        child: Container(
            child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 2 / 2.7,
              child: Image.asset(
                imagesURL[index],
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Movie Name',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        )));

    return gridCard;
  }
}
