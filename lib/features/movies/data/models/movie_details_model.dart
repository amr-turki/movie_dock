import 'package:hive/hive.dart';
import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_details_entity.dart';
part 'movie_details_model.g.dart';

@HiveType(typeId: 9)
class MovieDetailsModel extends MovieDetailsEntity {
  @HiveField(0)
  @override
  final int id;

  @HiveField(1)
  @override
  final String originalLanguage;

  @HiveField(2)
  @override
  final String overview;

  @HiveField(3)
  @override
  final String posterPath;

  @HiveField(4)
  @override
  final String originalTitle;

  @HiveField(5)
  @override
  final double voteAverage;

  @HiveField(6)
  @override
  final String releaseDate;

  @HiveField(7)
  @override
  final int runtime;

  @HiveField(8)
  final bool adult;

  @HiveField(9)
  final String? homepage;

  @HiveField(10)
  final double popularity;

  @HiveField(11)
  final String status;

  @HiveField(12)
  final String tagline;

  @HiveField(13)
  final String type;

  @HiveField(14)
  final double voteCount;

  @HiveField(15)
  final bool video;

  @HiveField(16)
  final int buget;

  MovieDetailsModel({
    required this.id,
    required this.originalLanguage,
    required this.overview,
    required this.posterPath,
    required this.originalTitle,
    required this.voteAverage,
    required this.releaseDate,
    required this.runtime,
    required this.adult,
    required this.homepage,
    required this.popularity,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteCount,
    required this.video,
    required this.buget,
  }) : super(
         id: id,
         originalLanguage: originalLanguage,
         overview: overview,
         posterPath: posterPath,
         originalTitle: originalTitle,
         voteAverage: voteAverage,
         releaseDate: releaseDate,
         runtime: runtime,
       );

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
