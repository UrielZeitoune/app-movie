import 'package:flutter/material.dart';
import 'package:movie/pages/page_movie_popular.dart';
import 'package:movie/pages/page_movie_top_rated.dart';
import 'package:movie/pages/page_movie_upcoming.dart';
import 'package:movie/providers/movie_provider.dart';
import 'package:movie/widgets/movie_home_widget.dart';
import 'package:provider/provider.dart';

// pagina principal
class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/logo.jpg', height: 80),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: ListView(
          children: [
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageMoviePopular()));
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Mas populares',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 225),
              child: Consumer<MovieProvider>(
                builder: (context, snapshot, child) =>
                    snapshot.listMoviePopular == []
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemExtent: 145,
                            itemCount: snapshot.listMoviePopular.length,
                            itemBuilder: (context, index) => MovieWidgetHome(
                              movie: snapshot.listMoviePopular[index],
                            ),
                          ),
              ),
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageMovieTopRated()));
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Mas valoradas',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 225),
              child: Consumer<MovieProvider>(
                builder: (context, snapshot, child) =>
                    snapshot.listMovieTopRated == []
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemExtent: 145,
                            itemCount: snapshot.listMovieTopRated.length,
                            itemBuilder: (context, index) => MovieWidgetHome(
                              movie: snapshot.listMovieTopRated[index],
                            ),
                          ),
              ),
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageMovieUpcoming()),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Poximamente',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 225),
              child: Consumer<MovieProvider>(
                builder: (context, snapshot, child) =>
                    snapshot.listUpcoming == []
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemExtent: 145,
                            itemCount: snapshot.listUpcoming.length,
                            itemBuilder: (context, index) => MovieWidgetHome(
                              movie: snapshot.listUpcoming[index],
                            ),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
