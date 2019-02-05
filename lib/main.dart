import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MovieGuideApp());

class MovieGuideApp extends StatelessWidget {
  final List<String> imagesURL = [
    'assets/images/lorena.bmp',
    'assets/images/papalion.bmp',
    'assets/images/papalion.bmp'
  ];

  MovieGuideApp() {}

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true;
    print('In Build');
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Movie Guide'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.sort),
          onPressed: () {},
        )
      ]),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (130/ 199),
        children: List.generate(imagesURL.length, (index) {
          return GestureDetector(
            child: InkWell(
              onTap: (){
                print('${imagesURL[index]}');
              },
              child: Column(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height:290,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(imagesURL[index])),
                            color: Colors.redAccent,
                      )),
                ],
              ),
            ),
            onTap: () {
              //print('${imagesURL[index]}');
            },
          );
        }),
      ),
    ));
  }
}

class ImageData {
  static List<String> imagesURL;

  ImageData() {
    print('In Constructor');
    List<String> imagesURL = new List();
    imagesURL.add('assets/images/lorena.bmp');
    imagesURL.add('assets/images/papalion.bmp');
    print(imagesURL.elementAt(0));
    print(imagesURL.elementAt(1));
    print(imagesURL);
  }

  static List<String> getImagePaths() {
    return imagesURL;
  }
}
