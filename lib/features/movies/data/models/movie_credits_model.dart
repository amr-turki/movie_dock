import 'package:hive/hive.dart';
import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/movies/domain/entities/movie_credit_entity.dart';
part 'movie_credits_model.g.dart';

@HiveType(typeId: 4)
class MovieCreditsModel extends MovieCreditEntity {
  @HiveField(0)
  @override
  final int id;

  @HiveField(1)
  @override
  final String profilePath;

  @HiveField(2)
  @override
  final String name;

  @HiveField(3)
  final bool adult;

  @HiveField(4)
  final int gender;

  @HiveField(5)
  final String knownForDepartment;

  @HiveField(6)
  final String originalName;

  @HiveField(7)
  final double popularity;

  @HiveField(8)
  final String character;

  @HiveField(9)
  final String creditId;

  @HiveField(10)
  final int order;

  MovieCreditsModel({
    required this.id,
    required this.profilePath,
    required this.adult,
    required this.gender,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.character,
    required this.creditId,
    required this.order,
  }) : super(id: id, profilePath: profilePath, name: name);

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
