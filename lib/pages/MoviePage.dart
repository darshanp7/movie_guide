import 'package:flutter/material.dart';

import '../model/Movie.dart';

class MoviePage extends StatelessWidget
{
  Movie movie;

  MoviePage(Movie selectedMovie)
  {
    this.movie = selectedMovie;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(title: Text(movie.title)),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        children: <Widget>[
          HeaderBanner(movie),
          GetTags(movie.category),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
            child: Text(
              movie.desc,
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
              width: 80.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Text(
                  'Watch Movies',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF761322),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderBanner extends StatelessWidget {
  final Movie _movie;

  HeaderBanner(this._movie);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 380,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            HeaderImage(this._movie.bannerURL),
            HeaderContent(this._movie)
          ],
        ),
      ),
    );
  }
}

class HeaderImage extends StatelessWidget{

  final String bannerURL;

  HeaderImage(this.bannerURL);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      bannerURL,
      width: 600,
      height: 380,
      fit: BoxFit.cover,
    );
  }
}

class GetTags extends StatelessWidget {

  final List<String> _categories;

  GetTags(this._categories);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //width: 50,
      height: 35.0,
      margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index)
          {
            return InkWell(
              onTap: () => print('${_categories[index]} clicked'),
              child: Container(
                width: 100.0,
                height: 35.0,
                margin: EdgeInsets.only(
                  left: 5.0,
                  right: 5.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF761322),
                  border: Border.all(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Text(
                    _categories[index],
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
            );
          })
    );
  }
}

class HeaderContent extends StatelessWidget {

  final Movie _movie;

  HeaderContent(this._movie);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Opacity(
        opacity: 0.6,
        child: Container(
          decoration: BoxDecoration(color: Color.alphaBlend(Colors.black26, Colors.black)),
          constraints: BoxConstraints.expand(
            height: 110.0,
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 1.0),
                          child: Text(
                            _movie.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 26.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //GetRatings(),
                        Container(
                          margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                          child: Text(
                            _movie.directors,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Container(
                          //margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                          child: Text(
                            _movie.releaseDate,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}