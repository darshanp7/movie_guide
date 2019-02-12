import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

import '../model/Movie.dart';
import './MoviePage.dart';

class HomePage extends StatelessWidget {
  List<Movie> _movieList;

  final String _filename = 'assets/database/db.json';

  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    print('In Build');
    return Scaffold(
        appBar: AppBar(
          title: Text('Movie Guide'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //showSearch(context: context, delegate: );
              },
            ),
            IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {},
            )
          ],
        ),
        drawer: SizedBox(
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
        ),
        body: Container(
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString(_filename),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    print('snapshot data is null');
                    return Container(
                        child: Center(
                      child: Text('LOADING'),
                    ));
                  } else {
                    print('snapshot data is not null');
                    _movieList = _parseJson(snapshot.data.toString());
                    return Container(
                      child: ListView.builder(
                        itemCount: _movieList.length,
                        itemBuilder: (context, index){
                          return _singleGridCard(index);
                          },
                      ),
                    );
                  }
                })));
  }

  List<Movie> _parseJson(String response) {
    if (response == null) return [];
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Movie>((json) => new Movie.fromJson(json)).toList();
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
                _movieList[index].imgURL,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _movieList[index].title,
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

//  List<Movie> movieList()
//  {
//    return [
//      Movie(
//          id: 1,
//          title: "Lorena",
//          categories: ["Biography", "Drama"],
//          releaseDate: "12 February 2019",
//          desc: "A new perspective on the story of Lorena Bobbitt and how one event laid the groundwork for the modern 24-hour news cycle and increasing sensationalized media coverage.",
//          rating: 3.7,
//          directors: "Lorena Bobbitt, Joshua Rofé",
//          language: "English",
//          country: "USA",
//          imgURL: "assets/images/lorena.bmp",
//          bannerURL: "assets/images/lorena_banner.jpg"
//      ),
//      Movie(
//          id: 2,
//          title: "Papillon",
//          categories: ["Crime", "Drama", "Mystery"],
//          releaseDate: "24 August 2018",
//          desc: "Wrongfully convicted for murder, Henri Charriere forms an unlikely relationship with fellow inmate and quirky convicted counterfeiter Louis Dega, in an attempt to escape from the notorious penal colony on Devil's Island.",
//          rating: 7.1,
//          directors: "Michael Noer",
//          language: "English",
//          country: "USA",
//          imgURL: "assets/images/papalion.bmp",
//          bannerURL: "assets/images/papillion_banner.jpg"
//      ),
//      Movie(
//          id: 3,
//          title: "Life+1Day",
//          categories: ["Drama"],
//          releaseDate: "16 March 2016",
//          desc: "Somaieh, the youngest daughter of an indigent family, is getting married and fear is overwhelming each and every member of the family regarding how to overcome their difficulties after she's gone.",
//          rating: 8.3,
//          directors: "Saeed Roustayi",
//          language: "Persian",
//          country: "Iran",
//          imgURL: "assets/images/abad.jpg",
//          bannerURL: "assets/images/abad_banner.jpg"
//      ),
//      Movie(
//          id: 4,
//          title: "Shanghai",
//          categories: ["Crime", "Mystery", "Thriller"],
//          releaseDate: "8 June 2012",
//          desc: "Prime leader of a campaign against a big government project is killed in what appears to be a road accident. An IAS officer is ordered to probe the incident and the veils of falsehood begin to drop. ",
//          rating: 7.2,
//          directors: "Dibakar Banerjee",
//          language: "Hindi",
//          country: "India",
//          imgURL: "assets/images/shanghai.jpg",
//          bannerURL: "assets/images/shanghai_banner.jpg"
//      ),
//      Movie(
//          id: 5,
//          title: "Wild Tales",
//          categories: ["Comedy", "Drama", "Thriller"],
//          releaseDate: "21 August 2014",
//          desc: "Six short stories that explore the extremities of human behavior involving people in distress.",
//          rating: 8.1,
//          directors: "Damián Szifron",
//          language: " Spanish",
//          country: "Argentina",
//          imgURL: "assets/images/wildtales.jpg",
//          bannerURL: "assets/images/wild_banner.jpg"
//      ),
//      Movie(
//          id: 6,
//          title: "Incendies",
//          categories: ["Mystery", "Drama", "War"],
//          releaseDate: "12 January 2011",
//          desc: "Twins journey to the Middle East to discover their family history and fulfill their mother's last wishes.",
//          rating: 8.2,
//          directors: "Denis Villeneuve",
//          language: "French",
//          country: "France",
//          imgURL: "assets/images/incendies.jpg",
//          bannerURL: "assets/images/incendies-banner.jpg"
//      ),
//      Movie(
//          id: 7,
//          title: "Two Guys",
//          categories: ["Comedy", "Action"],
//          releaseDate: "9 July 2004",
//          desc: "A credit shark and a defrauding cab driver come across a suitcase which happens to take them through a journey of their life.",
//          rating: 6.9,
//          directors: "Hun-Su Park",
//          language: "Korean",
//          country: "South Korea",
//          imgURL: "assets/images/twoguys.jpg",
//          bannerURL: "assets/images/twoguys_banner.jpg"
//      ),
//      Movie(
//          id: 8,
//          title: "Fight Club",
//          categories: ["Drama"],
//          releaseDate: "15 October 1999",
//          desc: "An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.",
//          rating: 8.8,
//          directors: "David Fincher",
//          language: "English",
//          country: "USA",
//          imgURL: "assets/images/fight.jpg",
//          bannerURL: "assets/images/fight_banner.jpg"
//      ),
//      Movie(
//          id: 9,
//          title: "John Wick",
//          categories: ["Action", "Crime", "Thriller"],
//          releaseDate: "24 October 2014",
//          desc: "An ex-hit-man comes out of retirement to track down the gangsters that killed his dog and took everything from him.",
//          rating: 7.3,
//          directors: "Chad Stahelski",
//          language: "English",
//          country: "USA",
//          imgURL: "assets/images/johnwick.jpg",
//          bannerURL: "assets/images/johnwick_banner.jpg"
//      ),
//      Movie(
//          id: 10,
//          title: "The Dictator",
//          categories: ["Comedy"],
//          releaseDate: "16 May 2012",
//          desc: "The heroic story of a dictator who risked his life to ensure that democracy would never come to the country he so lovingly oppressed.",
//          rating: 6.4,
//          directors: "Larry Charles",
//          language: "English",
//          country: "USA",
//          imgURL: "assets/images/dict.jpg",
//          bannerURL: "assets/images/dict_banner.png"
//      )
//    ];
//  }
