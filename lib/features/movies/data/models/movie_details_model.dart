import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  final bool adult;
  final String? homepage;
  final double popularity;
  final String status;
  final String tagline;
  final String type;
  final double voteCount;
  final bool video;
  final int buget;

  MovieDetailsModel({
    required this.adult,
    required this.homepage,
    required this.popularity,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteCount,
    required super.id,
    required super.originalLanguage,
    required super.overview,
    required super.posterPath,
    required super.originalTitle,
    required super.voteAverage,
    required super.releaseDate,
    required super.runtime,
    required this.video,
    required this.buget,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      adult: json[ApiKey.adult] ?? false,
      homepage: json[ApiKey.homepage] ?? '',
      popularity: (json[ApiKey.popularity] as num?)?.toDouble() ?? 0.0,
      status: json[ApiKey.status] ?? '',
      tagline: json[ApiKey.tagline] ?? '',
      type: json[ApiKey.type] ?? '',
      voteAverage: (json[ApiKey.voteAverage] as num?)?.toDouble() ?? 0.0,
      voteCount: (json[ApiKey.voteCount] as num?)?.toDouble() ?? 0.0,
      id: (json[ApiKey.id] as num?)?.toInt() ?? 0,
      originalLanguage: json[ApiKey.originalLanguage] ?? '',
      overview: json[ApiKey.overview] ?? '',
      posterPath: json[ApiKey.posterPath] ?? '',
      originalTitle: json[ApiKey.originalTitle] ?? '',
      releaseDate: json[ApiKey.releaseDate] ?? '',
      runtime: (json[ApiKey.runtime] as num?)?.toInt() ?? 0,
      video: json[ApiKey.video] ?? false,
      buget: (json[ApiKey.budget] as num?)?.toInt() ?? 0,
    );
  }
}
