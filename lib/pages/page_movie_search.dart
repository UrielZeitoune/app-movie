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
            title: Image.asset('assets/images/logo.jpg', height: 80),
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
                            itemBuilder: (context, index) =>
                                MovieWidgetSearchFavorite(
                                  movie: snapshot.listaMovieSearch[index],
                                )),
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
