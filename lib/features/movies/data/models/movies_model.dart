import 'package:hive/hive.dart';
import 'package:movie_dock_application/core/databases/api/end_points.dart';

import '../../domain/entities/movies_entitiy.dart';

part 'movies_model.g.dart';

@HiveType(typeId: 6)
class MoviesModel extends MoviesEntity {
  @HiveField(0)
  @override
  final int id;

  @HiveField(1)
  @override
  final String posterPath;

  @HiveField(2)
  final bool adult;

  @HiveField(3)
  final String backdropPath;

  @HiveField(4)
  final String originalLanguage;

  @HiveField(5)
  final String originalTitle;

  @HiveField(6)
  final String overview;

  @HiveField(7)
  final double popularity;

  @HiveField(8)
  final String releaseDate;

  @HiveField(9)
  final String title;

  @HiveField(10)
  final bool video;

  @HiveField(11)
  final double voteAverage;

  @HiveField(12)
  final int voteCount;

  MoviesModel({
    required this.id,
    required this.posterPath,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }) : super(id: id, posterPath: posterPath);

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
