import 'package:hive/hive.dart';
import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_recommendation.dart';

part 'tv_series_recommendation_model.g.dart';

@HiveType(typeId: 23)
class TvSeriesRecommendationModel extends TvSeriesRecommendation {
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
  final String name;

  @HiveField(5)
  final String originalLanguage;

  @HiveField(6)
  final String originalName;

  @HiveField(7)
  final String overview;

  @HiveField(8)
  final String mediaType;

  @HiveField(9)
  final double popularity;

  @HiveField(10)
  final String firstAirDate;

  @HiveField(11)
  final double voteAverage;

  @HiveField(12)
  final double voteCount;

  TvSeriesRecommendationModel({
    required this.id,
    required this.posterPath,
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
  }) : super(id: id, posterPath: posterPath);

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
