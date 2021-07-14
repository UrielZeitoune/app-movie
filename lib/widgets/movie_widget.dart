import 'package:flutter/material.dart';
import 'package:movie/class/movie.dart';
import 'package:movie/pages/page_movie_overview.dart';
// Widget de las pantallas Mas populares, Mas valoradas y Proximamente.
class MovieWidget extends StatelessWidget {
  final String? title;
  final String? urlImage;

  final Movie movie;
  MovieWidget(
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
              urlImage!,
              width: 110,
            ),
          ),
          Text(
            title!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
        ],
     ),
    );
  }
}
