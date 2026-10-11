class MovieDetailsEntity {
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final double voteAverage;
  final String posterPath;
  final String releaseDate;
  final int runtime;
  final String overview;
  MovieDetailsEntity({
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.voteAverage,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.overview,
  });
}
