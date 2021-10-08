import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/class/genres.dart';
import 'package:movie/class/movie.dart';
import 'package:movie/pages/page_movie_search.dart';
import 'package:movie/providers/genres_provider.dart';
import 'package:movie/providers/movie_favorites_provider.dart';
import 'package:provider/provider.dart';

// pagina descripcion
class PageOverview extends StatefulWidget {
  PageOverview({required this.movie});
  final Movie movie;

  @override
  _PageOverviewState createState() => _PageOverviewState();
}

class _PageOverviewState extends State<PageOverview> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // asigna a cada numero de genero su nombre
    List<Genres> listGenres = Provider.of<GenresProvider>(context).listGenres;
    List<String> genresNames = [];
    for (var i = 0; i < widget.movie.genreIds!.length; i++) {
      for (var item in listGenres) {
        if (item.id == widget.movie.genreIds![i]) {
          genresNames += [item.name!];
        }
      }
    }
    // se fija si esta pelicula ya estaba marcada como favoritos
    List<Movie> favorites =
        Provider.of<ListFavorites>(context).getMovieFavorites();
    for (var i = 0; i < favorites.length; i++) {
      if (widget.movie == favorites[i]) {
        _active = true;
      } else {
        _active = false;
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.movie.title!),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageSearch(),
                    ),
                  ),
              icon: Icon(Icons.search)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              widget.movie.backdropPath != null
                  ? "https://image.tmdb.org/t/p/w500${widget.movie.backdropPath}"
                  : "https://www.themoviedb.org/assets/2/apple-touch-icon-cfba7699efe7a742de25c28e08c38525f19381d31087c69e89d6bcb8e3c0ddfa.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(children: [
          SizedBox(
            height: 170,
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(27)),
            child: Container(
              color: Colors.black,
              child: ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 17,
                  ),
                  Row(children: [
                    SizedBox(
                      width: 15,
                    ),
                   
        widget.movie.posterPath == null
                ? Image.asset(
                    'assets/images/icono.jpg',
                    width: 180,
                  )
                : Image.network(
                    "https://image.tmdb.org/t/p/w500${widget.movie.posterPath}",
                    height: 180,
                  ),
                    
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.movie.title!,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  // boton de favoritos
                                  IconButton(
                                    onPressed: () {
                                      _handleTap();
                                      if (_active) {
                                        Provider.of<ListFavorites>(context,
                                                listen: false)
                                            .addFavorites(widget.movie);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            'Agregado a favoritos',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          backgroundColor: Colors.grey[900],
                                        ));
                                      } else {
                                        Provider.of<ListFavorites>(context,
                                                listen: false)
                                            .removeFavorites(widget.movie);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text('Quitado de favoritos',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          backgroundColor: Colors.grey[900],
                                        ));
                                      }
                                    },
                                    color:
                                        _active ? Colors.red : Colors.grey[600],
                                    iconSize: 35,
                                    icon: Icon(_active
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined),
                                  ),
                                  Text(
                                    _active
                                        ? 'Quitar de favoritos'
                                        : 'Agregar a favoritos',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        ' Descripcion',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                      Text(
                        ' Año: ${widget.movie.releaseDate?.year.toString() == null ? '' : widget.movie.releaseDate?.year.toString()}',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Text(widget.movie.overview!)),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Generos',
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        ConstrainedBox(
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
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Calificacion:',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(width: 13),
                            Container(
                              color: Colors.grey[800],
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text(widget.movie.voteAverage.toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 150,
                        ),
                      ])
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
