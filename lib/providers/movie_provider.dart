import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie/class/movie.dart';

// trae las peliculas
class MovieProvider extends ChangeNotifier {
  List<Movie> _listMoviePopular = [];
  MovieProvider() {
    obtainMoviePopular();
    obtainMovieTopRated();
    obtainUpcoming();
  }
  get listMoviePopular => _listMoviePopular;

  void obtainMoviePopular() async {
    try {
      final response = await Dio().get(
          'https://api.themoviedb.org/3/movie/popular?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es-ES');
      final json = response.data['results'];
      final movie = json.map((movieJson) => Movie.fromJson(movieJson)).toList();
      _listMoviePopular = List<Movie>.from(movie);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  List<Movie> _listMovieTopRated = [];
  get listMovieTopRated => _listMovieTopRated;

  void obtainMovieTopRated() async {
    try {
      final response = await Dio().get(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es-ES');
      final json = response.data['results'];
      final movie = json.map((movieJson) => Movie.fromJson(movieJson)).toList();
      _listMovieTopRated = List<Movie>.from(movie);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  List<Movie> _listUpcoming = [];
  get listUpcoming => _listUpcoming;

  void obtainUpcoming() async {
    try {
      final response = await Dio().get(
          'https://api.themoviedb.org/3/movie/upcoming?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es-ES');
      final json = response.data['results'];
      final movie = json.map((movieJson) => Movie.fromJson(movieJson)).toList();
      _listUpcoming = List<Movie>.from(movie);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  List<Movie> _listMovieSearch = [];

  get listMovieSearch => _listMovieSearch;

  void obtainMovieSearch(String search) async {
    try {
      final response = await Dio().get(
          'https://api.themoviedb.org/3/search/movie?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=es-ES&query=$search');
      final json = response.data['results'];
      final movie = json.map((movieJson) => Movie.fromJson(movieJson)).toList();
      _listMovieSearch = List<Movie>.from(movie);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
