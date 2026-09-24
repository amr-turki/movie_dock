import 'package:hive/hive.dart';
import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_recommendation_entity.dart';

part 'movie_recommendation_model.g.dart';

@HiveType(typeId: 5)
class MovieRecommendationModel extends MovieRecommendationEntity {
  @HiveField(0)
  @override
  final int id;

  @HiveField(1)
  @override
  final String posterPath;

  @HiveField(2)
  final bool adult;

  @HiveField(3)
  final String backDropPath;

  @HiveField(4)
  final String title;

  @HiveField(5)
  final String originalLanguage;

  @HiveField(6)
  final String originalTitle;

  @HiveField(7)
  final String overview;

  @HiveField(8)
  final String mediaType;

  @HiveField(9)
  final double popularity;

  @HiveField(10)
  final double voteAverage;

  @HiveField(11)
  final double voteCount;

  MovieRecommendationModel({
    required this.id,
    required this.posterPath,
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
  }) : super(id: id, posterPath: posterPath);

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) {
    return MovieRecommendationModel(
      id: (json[ApiKey.id] as num?)?.toInt() ?? 0,
      adult: json[ApiKey.adult] ?? false,
      backDropPath: json[ApiKey.backdropPath] ?? '',
      title: json[ApiKey.title] ?? '',
      originalLanguage: json[ApiKey.originalLanguage] ?? '',
      originalTitle: json[ApiKey.originalTitle] ?? '',
      overview: json[ApiKey.overview] ?? '',
      posterPath: json[ApiKey.posterPath] ?? '',
      mediaType: json[ApiKey.mediaType] ?? '',
      popularity: (json[ApiKey.popularity] as num?)?.toDouble() ?? 0.0,
      voteAverage: (json[ApiKey.voteAverage] as num?)?.toDouble() ?? 0.0,
      voteCount: (json[ApiKey.voteCount] as num?)?.toDouble() ?? 0.0,
    );
  }
}
