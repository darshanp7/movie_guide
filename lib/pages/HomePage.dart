import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

import './MoviePage.dart';
import '../services/MoviesService.dart';

class HomePage extends StatelessWidget {

  final MoviesServices movieService = new MoviesServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        drawer: _buildDrawer(context),
        body: _buildDynamicGridList(context));
  }

  AppBar _buildAppBar() {
    return AppBar(
        title: Text('Movie Guide'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              //showSearch(context: context, delegate: TitleSearchDelegate());
            },
          ),
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {},
          )
        ],
      );
  }

  SizedBox _buildDrawer(BuildContext context) {
    return SizedBox(
        width: (MediaQuery.of(context).size.width * 0.6),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Select Category',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Action'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Biography'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Comedy'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Crime'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Drama'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Mystery'),
                onTap: () {},
              ),
              ListTile(
                title: Text('Thriller'),
                onTap: () {},
              ),
            ],
          ),
        ),
      );
  }

  Container _buildDynamicGridList(BuildContext context) {

    return Container(
        child: new FutureBuilder(
            future: movieService.getMovies(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                print('snapshot data is null');
                return Container(
                    child: Center(
                      child: Text('LOADING'),
                    ));
              } else {
                print('snapshot data is not null');
                movieService.parseJson(snapshot.data.toString());
                return GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(4.0),
                  childAspectRatio: 140 / 209,
                  children: List.generate(movieService.getMovieList().length, (index) {
                    return Stack(
                      children: <Widget>[
                        Positioned.fill(
                            bottom: 0.0, child: _singleGridCard(index)),
                        Positioned.fill(
                            child: new Material(
                              color: Colors.transparent,
                              child: new InkWell(
                                splashColor: Colors.lightBlue,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                          new MoviePage(
                                              movieService.getMovieList()[index])));
                                },
                              ),
                            ))
                      ],
                    );
                  }),
                );
              }
            }));
  }

  Widget _singleGridCard(int index) {
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
                movieService.getMovieList()[index].imgURL,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movieService.getMovieList()[index].title,
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

class TitleSearchDelegate extends SearchDelegate<String>
{
  List<String> _movieNames;
  bool isEmpty;

  TitleSearchDelegate(List<String> movieNames)
  {
        if(movieNames.length == 0){
          isEmpty = true;
        }
        else {
          this._movieNames = movieNames;
        }
  }

  final trendingMovies = [
    'Lorena',
    'Papillon',
    'Shanghai',
    'John Wick'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation), onPressed: null);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?trendingMovies:_movieNames;
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(suggestionList[index]),
        ),
        itemCount: suggestionList.length,
    );
  }

}