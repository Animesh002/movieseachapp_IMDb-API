import 'package:flutter/material.dart';
import 'package:moviesapp/screens/MoviesAppHome.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMDB Movies List',
      theme: ThemeData(
        // Set the Montserrat font for the entire app
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 20.0),
          displaySmall: TextStyle(fontSize: 16.0),
          bodyLarge: TextStyle(fontSize: 16.0),
          bodyMedium: TextStyle(fontSize: 14.0),
          bodySmall: TextStyle(fontSize: 12.0),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MoviesAppHome(),
    );
  }
}
