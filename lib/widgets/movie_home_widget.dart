import 'package:flutter/material.dart';
import 'package:movie/class/movie.dart';
import 'package:movie/pages/page_movie_overview.dart';

// Widget de la pantalla principal
class MovieWidgetHome extends StatelessWidget {
  final Movie movie;
  MovieWidgetHome({required this.movie});

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
            child: movie.posterPath == null
                ? Image.asset(
                    'assets/images/icono.jpg',
                    width: 120,
                  )
                : Image.network(
                    "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                    width: 125,
                  ),
          ),
          Expanded(
            child: Text(
              movie.title!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
