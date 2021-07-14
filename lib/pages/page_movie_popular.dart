import 'package:flutter/material.dart';
import 'package:movie/pages/page_home.dart';
import 'package:movie/pages/page_movie_favorites.dart';
import 'package:movie/pages/page_movie_search.dart';
import 'package:movie/pages/page_movie_top_rated.dart';
import 'package:movie/pages/page_movie_upcoming.dart';
import 'package:movie/providers/movie_provider.dart';
import 'package:movie/widgets/bottom_navigation_bar.dart';
import 'package:movie/widgets/movie_widget.dart';
import 'package:provider/provider.dart';

// pagina popular
class PageMoviePopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/logo.jpg', height: 80),
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
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Text(
                  '   Mas populares ',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 17),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageMovieTopRated()));
                  },
                  child: Text(
                    'Mas valoradas',
                    style: TextStyle(fontSize: 17, color: Colors.grey[600]),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageMovieUpcoming()));
                  },
                  child: Text(
                    'Proximamente',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Consumer<MovieProvider>(
              builder: (context, snapshot, child) =>
                  snapshot.listMoviePopular == []
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        )
                      : GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: snapshot.listMoviePopular.length,
                          itemBuilder: (context, index) => MovieWidget(
                            title: snapshot.listMoviePopular[index].title,
                            urlImage: snapshot
                                        .listMoviePopular[index].posterPath !=
                                    null
                                ? "https://image.tmdb.org/t/p/w500${snapshot.listMoviePopular[index].posterPath}"
                                : "https://www.themoviedb.org/assets/2/apple-touch-icon-cfba7699efe7a742de25c28e08c38525f19381d31087c69e89d6bcb8e3c0ddfa.png",
                            movie: snapshot.listMoviePopular[index],
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
