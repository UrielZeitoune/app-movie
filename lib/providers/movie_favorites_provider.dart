import 'package:flutter/material.dart';
import 'package:movie/class/movie.dart';

// favoritos
class ListFavorites extends ChangeNotifier {
  List<Movie> _listFavorites = [];

  List<Movie> getMovieFavorites() => _listFavorites;

  void addFavorites(Movie movie) {
    _listFavorites.add(movie);

    notifyListeners();
  }

  void removeFavorites(Movie movie) {
    _listFavorites.removeWhere((element) => element == movie);
    notifyListeners();
  }
}
