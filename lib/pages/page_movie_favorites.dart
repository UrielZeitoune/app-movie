import 'package:flutter/material.dart';
import 'package:movie/pages/page_movie_search.dart';
import 'package:movie/providers/movie_favorites_provider.dart';
import 'package:movie/widgets/movie_favorite_search_widget.dart';
import 'package:provider/provider.dart';

// pagina favoritos
class PageFavorites extends StatelessWidget {
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
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: ListView(children: [
          Text(
            '    Favoritos',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Consumer<ListFavorites>(
              builder: (context, snapshot, child) =>
                  snapshot.getMovieFavorites() != []
                      ? ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.getMovieFavorites().length,
                          itemBuilder: (context, index) =>
                              MovieWidgetSearchFavorite(
                            movie: snapshot.getMovieFavorites()[index],
                          ),
                        )
                      : Center(
                          child: Text('Añade una Pelicula',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15)))),
        ]),
      ),
    );
  }
}
