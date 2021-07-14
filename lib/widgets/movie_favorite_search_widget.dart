import 'package:flutter/material.dart';
import 'package:movie/class/genres.dart';
import 'package:movie/class/movie.dart';
import 'package:movie/pages/page_movie_overview.dart';
import 'package:movie/providers/genres_provider.dart';
import 'package:provider/provider.dart';
// Widget de el buscador y favoritos
class MovieWidgetSearchFavorite extends StatelessWidget {
  final String? title;
  final String? urlImage;
  final String? dateTime;
  final String? voteAverage;
  final Movie movie;
  MovieWidgetSearchFavorite(
      {required this.title,
      required this.urlImage,
      required this.movie,
      required this.dateTime,
      required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    List<Genres> listGenres = Provider.of<GenresProvider>(context).listGenres;

    List<String> genresNames = [];
    for (var i = 0; i < movie.genreIds!.length; i++) {
      for (var item in listGenres) {
        if (item.id == movie.genreIds![i]) {
          genresNames += ["  " + item.name!];
        }
      }
    }
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageOverview(
            movie: movie,
          ),
        ),
      ),
      child: Card(
          margin: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                urlImage!,
                width: 120,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Text(
                            title!,
                            maxLines: 3,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Chip(
                              label: Text(dateTime!),
                              backgroundColor: Colors.grey[800],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              color: Colors.grey[800],
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text(voteAverage!),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 40),
                            child: ListView(
                              shrinkWrap: true,
                              itemExtent: 90,
                              scrollDirection: Axis.horizontal,
                              children: [
                                for (var genre in genresNames)
                                  Chip(
                                    label: Text(genre),
                                    backgroundColor: Colors.grey[900],
                                  )
                              ],
                            ),
                          ),
                        ),
                      ])),
            ),
          ])),
    );
  }
}
