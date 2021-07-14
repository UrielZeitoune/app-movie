import 'package:flutter/material.dart';
import 'package:movie/widgets/bottom_navigation_bar.dart';
import 'package:movie/providers/genres_provider.dart';
import 'package:movie/providers/movie_favorites_provider.dart';
import 'package:movie/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [   ChangeNotifierProvider<MovieProvider>(
            create: (context) => MovieProvider()),
              ChangeNotifierProvider<GenresProvider>(
            create: (context) => GenresProvider()),
         ChangeNotifierProvider<ListFavorites>(
            create: (context) => ListFavorites()),
      ],
      child: MaterialApp(
        title: 'Movie',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: BottomNavigationBarHome(),
      ),
    );
  }
}
