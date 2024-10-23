import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviesapp/models/Movie.dart';
import 'package:moviesapp/models/MovieInfo.dart';

const API_KEY = "ec41a8ab";
const API_URL = "http://www.omdbapi.com/?apikey=";

// Get list of Movies containing the search keyword
Future<List<Movie>> searchMovies(String keyword) async {
  final uri = Uri.parse('$API_URL$API_KEY&s=$keyword');
  final response = await http.get(uri);
  print(uri);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);

    if (data['Response'] == "True") {
      var list =
          (data['Search'] as List).map((item) => Movie.fromJson(item)).toList();
      return list;
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong!');
  }
}

// Get the information of a particular Movie using IMDB ID
Future<MovieInfo> getMovie(String movieId) async {
  final uri = Uri.parse('$API_URL$API_KEY&i=$movieId');
  final response = await http.get(uri);
  print(uri);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);

    if (data['Response'] == "True") {
      return MovieInfo.fromJSON(data);
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong!');
  }
}
