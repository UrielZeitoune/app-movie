import 'package:flutter/material.dart';
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
                    '   Mas valoradas ',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 17),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageMoviePopular()));
                    },
                    child: Text(
                      'Mas populares',
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
                    snapshot.listMovieTopRated == []
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
                            itemCount: snapshot.listMovieTopRated.length,
                            itemBuilder: (context, index) => MovieWidget(
                              movie: snapshot.listMovieTopRated[index],
                            ),
                          ),
              ),
            ],
          )),
    );
  }
}
