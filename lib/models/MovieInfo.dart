class MovieInfo {
  final String title;
  final String year;
  final String rating;
  final String runtime;
  final String genre;
  final String director;
  final String plot;
  final String poster;
  final String imdbRating;
  final String metaScore;

  MovieInfo({
    required this.title,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.plot,
    required this.poster,
    required this.imdbRating,
    required this.metaScore,
  });

  factory MovieInfo.fromJSON(Map<String, dynamic> json) {
    return MovieInfo(
      title: json['Title'] ?? 'Unknown Title',
      year: json['Year'] ?? 'Unknown Year',
      rating: (json['Ratings'] != null && json['Ratings'].isNotEmpty)
          ? json['Ratings'][0]["Value"]
          : 'No Rating',
      runtime: json['Runtime'] ?? 'Unknown Runtime',
      genre: json['Genre'] ?? 'Unknown Genre',
      director: json['Director'] ?? 'Unknown Director',
      plot: json['Plot'] ?? 'No Plot Available',
      poster: json['Poster'] ?? '',
      imdbRating: json['imdbRating'] ?? 'N/A',
      metaScore: json['Metascore'] ?? 'N/A',
    );
  }
}
