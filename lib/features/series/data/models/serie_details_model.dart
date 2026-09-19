import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_details_entity.dart';

class SerieDetailsModel extends TvSeriesDetailsEntity {
  final bool adult;
  final String? homepage;
  final bool in_production;
  final double popularity;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final double voteCount;
  SerieDetailsModel({
    required this.adult,
    required this.homepage,
    required this.in_production,
    required this.popularity,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
    required super.backDropPath,
    required super.firstAirRunTime,
    required super.id,
    required super.name,
    required super.numberOfEpisodes,
    required super.numberOfSeasons,
    required super.originalLanguage,
    required super.overview,
    required super.posterPath,
  });

  factory SerieDetailsModel.fromJson(Map<String, dynamic> json) {
    return SerieDetailsModel(
      adult: json[ApiKey.adult] ?? false,
      homepage: json[ApiKey.homepage] ?? '',
      in_production: json[ApiKey.inProduction] ?? false,
      popularity: (json[ApiKey.popularity] as num?)?.toDouble() ?? 0.0,
      status: json[ApiKey.status] ?? '',
      tagline: json[ApiKey.tagline] ?? '',
      type: json[ApiKey.type] ?? '',
      voteAverage: (json[ApiKey.voteAverage] as num?)?.toDouble() ?? 0.0,
      voteCount: (json[ApiKey.voteCount] as num?)?.toDouble() ?? 0.0,
      backDropPath: json[ApiKey.backdropPath] ?? '',
      firstAirRunTime: json[ApiKey.firstAirDate] ?? '',
      id: (json[ApiKey.id] as num?)?.toInt() ?? 0,
      name: json[ApiKey.name] ?? '',
      numberOfEpisodes: (json[ApiKey.numberOfEpisodes] as num?)?.toInt() ?? 0,
      numberOfSeasons: (json[ApiKey.numberOfSeasons] as num?)?.toInt() ?? 0,
      originalLanguage: json[ApiKey.originalLanguage] ?? '',
      overview: json[ApiKey.overview] ?? '',
      posterPath: json[ApiKey.posterPath] ?? '',
    );
  }
}
