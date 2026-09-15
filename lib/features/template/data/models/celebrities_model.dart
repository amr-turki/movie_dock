import 'package:movie_dock_application/core/databases/api/end_points.dart';

import '../../domain/entities/celebrities_entitiy.dart';

class PopularCelebritiesModel extends CelebritiesEntity {
  final bool adult;
  final int gender;
  final String knownForDepartment;
  final String name;
  final double popularity;
  final List<dynamic> knownFor;

  PopularCelebritiesModel({
    required this.adult,
    required this.gender,
    required this.knownFor,
    required this.knownForDepartment,
    required this.name,
    required this.popularity,
    required super.profilePath,
    required super.originalName,
    required super.id,
  });

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
