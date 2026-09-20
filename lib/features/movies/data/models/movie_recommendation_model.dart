import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_recommendation_entity.dart';

class MovieRecommendationModel extends MovieRecommendationEntity {
  final bool adult;
  final String backDropPath;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String mediaType;
  final double popularity;
  final double voteAverage;
  final double voteCount;
  MovieRecommendationModel({
    required super.id,
    required this.adult,
    required this.backDropPath,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.mediaType,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required super.posterPath,
  });

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) {
    return MovieRecommendationModel(
      id: (json[ApiKey.id] as num?)?.toInt() ?? 0,
      adult: json[ApiKey.adult] ?? false,
      backDropPath: json[ApiKey.backdropPath] ?? '',
      title: json[ApiKey.title] ?? '',
      originalLanguage: json[ApiKey.originalLanguage] ?? '',
      originalTitle: json[ApiKey.originalName] ?? '',
      overview: json[ApiKey.overview] ?? '',
      posterPath: json[ApiKey.posterPath] ?? '',
      mediaType: json[ApiKey.mediaType] ?? '',
      popularity: (json[ApiKey.popularity] as num?)?.toDouble() ?? 0.0,
      voteAverage: (json[ApiKey.voteAverage] as num?)?.toDouble() ?? 0.0,
      voteCount: (json[ApiKey.voteCount] as num?)?.toDouble() ?? 0.0,
    );
  }
}
