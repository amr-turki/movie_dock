import 'package:hive/hive.dart';
import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/series/domain/entities/tvs_series_entity.dart';
part 'series_model.g.dart';

@HiveType(typeId: 21)
class SeriesModel extends TvsSeriesEntity {
  @HiveField(0)
  @override
  final int id;

  @HiveField(1)
  @override
  final String posterPath;

  @HiveField(2)
  final String backDropPath;

  @HiveField(3)
  final String firstAirDate;

  @HiveField(4)
  final String name;

  @HiveField(5)
  final String originalLanguage;

  @HiveField(6)
  final String originalName;

  @HiveField(7)
  final String overview;

  @HiveField(8)
  final double popularity;

  @HiveField(9)
  final double voteAverage;

  @HiveField(10)
  final int voteCount;

  SeriesModel({
    required this.id,
    required this.posterPath,
    required this.backDropPath,
    required this.firstAirDate,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  }) : super(id: id, posterPath: posterPath);
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
