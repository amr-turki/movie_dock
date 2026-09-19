import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_recommendation.dart';

class TvSeriesRecommendationModel extends TvSeriesRecommendation {
  final bool adult;
  final String backDropPath;
  final String name;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final String mediaType;
  final double popularity;
  final String firstAirDate;
  final double voteAverage;
  final double voteCount;
  TvSeriesRecommendationModel({
    required super.id,
    required this.adult,
    required this.backDropPath,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.mediaType,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required super.posterPath,
  });

  factory TvSeriesRecommendationModel.fromJson(Map<String, dynamic> json) {
    return TvSeriesRecommendationModel(
      id: (json[ApiKey.id] as num?)?.toInt() ?? 0,
      adult: json[ApiKey.adult] ?? false,
      backDropPath: json[ApiKey.backdropPath] ?? '',
      name: json[ApiKey.name] ?? '',
      originalLanguage: json[ApiKey.originalLanguage] ?? '',
      originalName: json[ApiKey.originalName] ?? '',
      overview: json[ApiKey.overview] ?? '',
      posterPath: json[ApiKey.posterPath] ?? '',
      mediaType: json[ApiKey.mediaType] ?? '',
      popularity: (json[ApiKey.popularity] as num?)?.toDouble() ?? 0.0,
      firstAirDate: json[ApiKey.firstAirDate] ?? '',
      voteAverage: (json[ApiKey.voteAverage] as num?)?.toDouble() ?? 0.0,
      voteCount: (json[ApiKey.voteCount] as num?)?.toDouble() ?? 0.0,
    );
  }
}
