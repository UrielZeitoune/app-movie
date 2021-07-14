import 'package:flutter/material.dart';
import 'package:movie/class/movie.dart';
import 'package:movie/pages/page_movie_overview.dart';
// Widget de la pantalla principal
class MovieWidgetHome extends StatelessWidget {
  final String title;
  final String urlImage;

  final Movie movie;
  MovieWidgetHome(
      { required this.title, required this.urlImage, required this.movie});

  @override
  Widget build(BuildContext context) {
    return
    InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageOverview(
            movie: movie,
          ),
        ),
      ),
     child: 
      Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              urlImage,
              width: 125,
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
     ),
    );
  }
}