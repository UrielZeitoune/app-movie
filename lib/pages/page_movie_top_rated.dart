import 'package:flutter/material.dart';
import 'package:movie/class/movie.dart';
import 'package:movie/pages/page_movie_favorites.dart';
import 'package:movie/pages/page_movie_popular.dart';
import 'package:movie/pages/page_movie_search.dart';
import 'package:movie/pages/page_movie_upcoming.dart';
import 'package:movie/providers/movie_provider.dart';
import 'package:movie/widgets/bottom_navigation_bar.dart';
import 'package:movie/widgets/movie_widget.dart';
import 'package:provider/provider.dart';

// pagina mas valoradas
class PageMovieTopRated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Movie> popular =
        Provider.of<MovieProvider>(context, listen: false).listMovieTopRated;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          snap: true,
          floating: true,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.jpg',
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageSearch()));
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageFavorites()));
                },
                icon: Icon(Icons.favorite)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return BottomNavigationBarHome();
                    },
                  ), (Route<dynamic> route) => false);
                },
                icon: Icon(Icons.home)),
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate(<Widget>[
          ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 60),
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Chip(
                  backgroundColor: Colors.grey[900],
                  label: Text(
                    'Mas valoradas',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageMoviePopular()));
                  },
                  child: Chip(
                    backgroundColor: Colors.grey[700],
                    label: Text(
                      'Mas populares',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageMovieUpcoming()));
                  },
                  child: Chip(
                    backgroundColor: Colors.grey[700],
                    label: Text(
                      'Proximamente',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ]))
        ])),
        SliverGrid.count(crossAxisCount: 2, children: [
          for (var movie in popular)
            MovieWidget(
              movie: movie,
            )
        ])
      ]),
    );
  }
}