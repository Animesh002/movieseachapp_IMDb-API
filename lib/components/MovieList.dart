import 'package:flutter/material.dart';
import 'package:moviesapp/components/MovieItem.dart';
import 'package:moviesapp/models/Movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList({required this.movies});

  @override
  Widget build(context) {
    return new Container(
      //decoration: BoxDecoration(color: Colors.grey),
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        addAutomaticKeepAlives: true,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieItem(movie: movies[index]);
        },
      ),
    );
  }
}
