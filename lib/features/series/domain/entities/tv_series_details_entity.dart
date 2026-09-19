class TvSeriesDetailsEntity {
  final int id;

  final String backDropPath;
  final String posterPath;
  final String name;
  final String overview;
  final String firstAirRunTime;
  final String originalLanguage;
  final int numberOfEpisodes;
  final int numberOfSeasons;

  TvSeriesDetailsEntity({
    required this.backDropPath,
    required this.firstAirRunTime,
    required this.id,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originalLanguage,
    required this.overview,
    required this.posterPath,
  });
}
