import 'package:hive/hive.dart';
import 'package:movie_dock_application/core/databases/api/end_points.dart';

import '../../domain/entities/celebrities_entitiy.dart';
part 'popular_celebrities_model.g.dart';

@HiveType(typeId: 2)
class PopularCelebritiesModel extends CelebritiesEntity {
  @HiveField(0)
  final bool adult;

  @HiveField(1)
  final int gender;

  @HiveField(2)
  final String knownForDepartment;

  @HiveField(3)
  final String name;

  @HiveField(4)
  final double popularity;

  @HiveField(5)
  final List<dynamic> knownFor;

  @HiveField(6)
  @override
  final String? profilePath;

  @HiveField(7)
  @override
  final String originalName;

  @HiveField(8)
  @override
  final int id;

  PopularCelebritiesModel({
    required this.adult,
    required this.gender,
    required this.knownFor,
    required this.knownForDepartment,
    required this.name,
    required this.popularity,
    required this.profilePath,
    required this.originalName,
    required this.id,
  }) : super(profilePath: profilePath, originalName: originalName, id: id);

  factory PopularCelebritiesModel.fromJson(Map<String, dynamic> json) {
    return PopularCelebritiesModel(
      adult: json[ApiKey.adult] ?? false,
      gender: json[ApiKey.gender] ?? 0,
      knownFor: json[ApiKey.knownFor] ?? [],
      knownForDepartment: json[ApiKey.knownForDepartment] ?? '',
      name: json[ApiKey.name] ?? '',
      popularity: (json[ApiKey.popularity] as num?)?.toDouble() ?? 0.0,
      profilePath: json[ApiKey.profilePath],
      originalName: json[ApiKey.originalName] ?? '',
      id: json[ApiKey.id] ?? 0,
    );
  }
}
