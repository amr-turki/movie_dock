import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_credit_entity.dart';

class MovieCreditsModel extends MovieCreditEntity {
  final bool adult;
  final int gender;
  final String knownForDepartment;
  final String originalName;
  final double popularity;
  final String character;
  final String creditId;
  final int order;
  MovieCreditsModel({
    required super.id,
    required super.profilePath,
    required this.adult,
    required this.gender,
    required this.knownForDepartment,
    required super.name,
    required this.originalName,
    required this.popularity,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory MovieCreditsModel.fromJson(Map<String, dynamic> json) {
    return MovieCreditsModel(
      id: (json[ApiKey.id] as num?)?.toInt() ?? 0,
      profilePath: json[ApiKey.profilePath] ?? '',
      adult: json[ApiKey.adult] ?? false,
      gender: (json[ApiKey.gender] as num?)?.toInt() ?? 0,
      knownForDepartment: json[ApiKey.knownForDepartment] ?? '',
      name: json[ApiKey.name] ?? '',
      originalName: json[ApiKey.originalName] ?? '',
      popularity: (json[ApiKey.popularity] as num?)?.toDouble() ?? 0.0,
      character: json[ApiKey.character] ?? '',
      creditId: json[ApiKey.creditId] ?? '',
      order: (json[ApiKey.order] as num?)?.toInt() ?? 0,
    );
  }
}
