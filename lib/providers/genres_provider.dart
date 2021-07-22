import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie/class/genres.dart';

// trae los nombres de los generos
class GenresProvider extends ChangeNotifier {
  GenresProvider() {
    obtainMovieGenres();
  }
  List<Genres> _listGenres = [];

  get listGenres => _listGenres;

  void obtainMovieGenres() async {
    try {
      final response = await Dio().get(
          'https://api.themoviedb.org/3/genre/movie/list?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es-ES');
      final json = response.data['genres'];
      final genres =
          json.map((genresJson) => Genres.fromJson(genresJson)).toList();
      _listGenres = List<Genres>.from(genres);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
