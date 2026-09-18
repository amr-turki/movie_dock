import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_details.dart';

class CelebritieDetailsModel extends CelebritieDetail {
  final bool adult;
  final String imdbId;
  final int gender;
  final double popularity;
  CelebritieDetailsModel({
    required this.gender,
    required this.adult,
    required this.imdbId,
    required this.popularity,
    required super.biography,
    required super.birthday,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.placeOfBirth,
    required super.profilePath,
  });

  factory CelebritieDetailsModel.fromJson(Map<String, dynamic> json) {
    return CelebritieDetailsModel(
      gender: (json[ApiKey.gender] as num?)?.toInt() ?? 0,
      adult: json[ApiKey.adult] ?? 0,
      imdbId: json[ApiKey.imdbId] ?? '',
      popularity: (json[ApiKey.popularity] as num?)?.toDouble() ?? 0.0,
      biography: json[ApiKey.biography] ?? '',
      birthday: json[ApiKey.birthday] ?? '',
      id: (json[ApiKey.id] as num?)?.toInt() ?? 0,
      knownForDepartment: json[ApiKey.knownForDepartment] ?? '',
      name: json[ApiKey.name] ?? '',
      placeOfBirth: json[ApiKey.placeOfBirth] ?? '',
      profilePath: json[ApiKey.profilePath] ?? '',
    );
  }
}
