import 'package:flutter/material.dart';
import 'package:movie/providers/movie_provider.dart';
import 'package:movie/widgets/movie_favorite_search_widget.dart';
import 'package:provider/provider.dart';
// buscador
class PageSearch extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Consumer<MovieProvider>(
        builder: (context, snapshot, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:  Image.asset('assets/images/logo.jpg',height: 80),
            backgroundColor: Colors.black,
          ),
          body: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.send,
                      textCapitalization: TextCapitalization.sentences,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                      controller: _controller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Provider.of<MovieProvider>(context, listen: false)
                                  .obtainMovieSearch(this._controller.text);
                            }),
                        labelText: 'Buscar',
                        labelStyle:
                            TextStyle(fontSize: 18, color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onSubmitted: (text) {
                        Provider.of<MovieProvider>(context, listen: false)
                            .obtainMovieSearch(this._controller.text);
                      }),
                ),
                Provider.of<MovieProvider>(context, listen: true)
                            .listaMovieSearch !=
                        []
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.listaMovieSearch.length,
                          itemBuilder: (context, index) => MovieWidgetSearchFavorite(
                              title: snapshot.listaMovieSearch[index].title,
                              urlImage: snapshot
                                          .listaMovieSearch[index].posterPath !=
                                      null
                                  ? "https://image.tmdb.org/t/p/w500${snapshot.listaMovieSearch[index].posterPath}"
                                  : "https://www.themoviedb.org/assets/2/apple-touch-icon-cfba7699efe7a742de25c28e08c38525f19381d31087c69e89d6bcb8e3c0ddfa.png",
                              movie: snapshot.listaMovieSearch[index],
                              dateTime: snapshot
                                  .listaMovieSearch[index].releaseDate!.year
                                  .toString() == null ? '' : snapshot
                                  .listaMovieSearch[index].releaseDate!.year
                                  .toString(),
                              voteAverage: snapshot
                                  .listaMovieSearch[index].voteAverage
                                  .toString()),
                        ),
                      )
                    : Center(
                        child: Text(
                        'Busca una pelicula',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
              ],
            ),
          ),
        ),
      );
}
