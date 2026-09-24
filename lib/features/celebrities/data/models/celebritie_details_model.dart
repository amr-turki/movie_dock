import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_details.dart';
import 'package:hive/hive.dart';
part 'celebritie_details_model.g.dart';

@HiveType(typeId: 1)
class CelebritieDetailsModel extends CelebritieDetail {
  @HiveField(0)
  final bool adult;

  @HiveField(1)
  final String imdbId;

  @HiveField(2)
  final int gender;

  @HiveField(3)
  final double popularity;

  @HiveField(4)
  @override
  final String biography;

  @HiveField(5)
  @override
  final String birthday;

  @HiveField(6)
  @override
  final int id;

  @HiveField(7)
  @override
  final String knownForDepartment;

  @HiveField(8)
  @override
  final String name;

  @HiveField(9)
  @override
  final String placeOfBirth;

  @HiveField(10)
  @override
  final String profilePath;
  CelebritieDetailsModel({
    required this.gender,
    required this.adult,
    required this.imdbId,
    required this.popularity,
    required this.biography,
    required this.birthday,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.profilePath,
  }) : super(
         biography: biography,
         birthday: birthday,
         id: id,
         knownForDepartment: knownForDepartment,
         name: name,
         placeOfBirth: placeOfBirth,
         profilePath: profilePath,
       );

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
