import 'package:flutter/material.dart';
import 'package:moviesapp/models/Movie.dart' as models;

import '../models/MovieInfo.dart';
import '../services/MovieService.dart';

class MovieItem extends StatelessWidget {
  final models.Movie movie;

  // Use the required keyword for non-nullable fields
  const MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieInfo>(
      future: getMovie(movie.imdbID), // No need for `this.movie`
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
            height: 0,
          );
        }
        double imdbRating = double.tryParse(snapshot.data!.imdbRating) ?? 0;
        return Container(
          padding: const EdgeInsets.all(10.0),
          width: 200.0,
          height: MediaQuery.of(context).size.height * 0.23,
          child: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 33.0, bottom: 10, right: 10),
                padding: const EdgeInsets.only(
                    top: 10.0, left: 10, right: 10, bottom: 15),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.22,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54.withOpacity(0.15),
                      offset: const Offset(5.0, 4.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 26,
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              movie.title, // Access directly without `this`
                              style: const TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            // Use null-aware operator ?. and fallback
                            child: Text(
                              snapshot.data!.genre?.replaceAll(",", " |") ??
                                  "Unknown Genre",
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          height: 20,
                          width: 70,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: imdbRating < 7
                                  ? Color(0xFF1C7EEB)
                                  : Color(0xFF5EC570),
                              padding: const EdgeInsets.all(1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: imdbRating < 7
                                      ? Color(
                                          0xFF1C7EEB) // Blue border for ratings below 7
                                      : Color(
                                          0xFF5EC570), // Green border for ratings 7 and above
                                ),
                              ),
                            ),
                            onPressed: () => {},
                            child: Text(
                              // Display IMDb rating with conditional color
                              '${snapshot.data!.imdbRating}  IMDB',
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w600,
                                color:
                                    Colors.white, // Keep text color consistent
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (movie.poster != "N/A")
                Positioned(
                  bottom: 17,
                  left: 2.0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.21,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: NetworkImage(movie.poster),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
