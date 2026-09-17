import 'package:movie_dock_application/core/databases/api/end_points.dart';

import '../../domain/entities/celebrities_entitiy.dart';

class TrendingCelebritiesModel extends CelebritiesEntity {
  final bool adult;
  final String name;
  final String mediaType;

  TrendingCelebritiesModel({
    required this.adult,
    required this.name,
    required super.profilePath,
    required super.originalName,
    required super.id,
    required this.mediaType,
  });

  factory TrendingCelebritiesModel.fromJson(Map<String, dynamic> json) {
    return TrendingCelebritiesModel(
      adult: json[ApiKey.adult] ?? false,
      name: json[ApiKey.name] ?? json['title'] ?? '',
      profilePath: json[ApiKey.profilePath] ?? '',
      originalName: json[ApiKey.originalName] ?? json['name'] ?? '',
      id: (json[ApiKey.id] as num?)?.toInt() ?? 0,
      mediaType: json[ApiKey.mediaType] ?? 'person',
    );
  }
}
