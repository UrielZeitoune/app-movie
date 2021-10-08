import 'package:flutter/material.dart';
import 'package:movie/class/movie.dart';
import 'package:movie/pages/page_movie_overview.dart';

// Widget de las pantallas Mas populares, Mas valoradas y Proximamente.
class MovieWidget extends StatelessWidget {
  final Movie movie;
  MovieWidget({required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageOverview(
            movie: movie,
          ),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:  movie.posterPath == null
                ? Image.asset(
                    'assets/images/icono.jpg',
                    width: 110,
                  )
                : Image.network(
                    "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                    width: 110)
                    ),       Text(
            movie.title!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
