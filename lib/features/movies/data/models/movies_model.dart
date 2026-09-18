import 'package:movie_dock_application/core/databases/api/end_points.dart';

import '../../domain/entities/movies_entitiy.dart';

class MoviesModel extends MoviesEntity {
  final bool adult;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MoviesModel({
    required this.adult,
    required this.backdropPath,
    required super.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required super.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      id: (json[ApiKey.id] as num?)?.toInt() ?? 0,
      posterPath: json[ApiKey.posterPath] as String? ?? '',
      backdropPath: json[ApiKey.backdropPath] as String? ?? '',
      adult: json[ApiKey.adult] as bool? ?? false,
      originalLanguage: json[ApiKey.originalLanguage] as String? ?? '',
      originalTitle: json[ApiKey.originalTitle] as String? ?? '',
      overview: json[ApiKey.overview] as String? ?? '',
      popularity: (json[ApiKey.popularity] as num?)?.toDouble() ?? 0.0,
      releaseDate: json[ApiKey.releaseDate] as String? ?? '',
      title: json[ApiKey.title] as String? ?? '',
      video: json[ApiKey.video] as bool? ?? false,
      voteAverage: (json[ApiKey.voteAverage] as num?)?.toDouble() ?? 0.0,
      voteCount: (json[ApiKey.voteCount] as num?)?.toInt() ?? 0,
    );
  }
}
