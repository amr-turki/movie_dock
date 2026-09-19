import 'package:flutter/widgets.dart';
import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/series/domain/entities/tvs_series_entity.dart';

class SeriesModel extends TvsSeriesEntity {
  final String backDropPath;
  final String firstAirDate;
  final String name;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  SeriesModel({
    required this.backDropPath,
    required this.firstAirDate,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required super.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required super.id,
  });
  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      backDropPath: json[ApiKey.backdropPath] ?? '',
      firstAirDate: json[ApiKey.firstAirDate] ?? '',
      id: (json[ApiKey.id] as num?)?.toInt() ?? 0,
      name: json[ApiKey.name] ?? '',
      originalLanguage: json[ApiKey.originalLanguage] ?? '',
      originalName: json[ApiKey.originalName] ?? '',
      overview: json[ApiKey.overview] ?? '',
      popularity: (json[ApiKey.popularity] as num?)?.toDouble() ?? 0.0,
      posterPath: json[ApiKey.posterPath] ?? '',
      voteAverage: (json[ApiKey.voteAverage] as num?)?.toDouble() ?? 0.0,
      voteCount: (json[ApiKey.voteCount] as num?)?.toInt() ?? 0,
    );
  }
}
