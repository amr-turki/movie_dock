import 'package:hive/hive.dart';
import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_details_entity.dart';
part 'serie_details_model.g.dart';

@HiveType(typeId: 20)
class SerieDetailsModel extends TvSeriesDetailsEntity {
  @HiveField(0)
  @override
  final int id;

  @HiveField(1)
  @override
  final String backDropPath;

  @HiveField(2)
  @override
  final String firstAirRunTime;

  @HiveField(3)
  @override
  final String name;

  @HiveField(4)
  @override
  final int numberOfEpisodes;

  @HiveField(5)
  @override
  final int numberOfSeasons;

  @HiveField(6)
  @override
  final String originalLanguage;

  @HiveField(7)
  @override
  final String overview;

  @HiveField(8)
  @override
  final String posterPath;

  @HiveField(9)
  final bool adult;

  @HiveField(10)
  final String? homepage;

  @HiveField(11)
  final bool in_production;

  @HiveField(12)
  final double popularity;

  @HiveField(13)
  final String status;

  @HiveField(14)
  final String tagline;

  @HiveField(15)
  final String type;

  @HiveField(16)
  final double voteAverage;

  @HiveField(17)
  final double voteCount;

  SerieDetailsModel({
    required this.id,
    required this.backDropPath,
    required this.firstAirRunTime,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originalLanguage,
    required this.overview,
    required this.posterPath,
    required this.adult,
    required this.homepage,
    required this.in_production,
    required this.popularity,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
         backDropPath: backDropPath,
         firstAirRunTime: firstAirRunTime,
         id: id,
         name: name,
         numberOfEpisodes: numberOfEpisodes,
         numberOfSeasons: numberOfSeasons,
         originalLanguage: originalLanguage,
         overview: overview,
         posterPath: posterPath,
       );

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
