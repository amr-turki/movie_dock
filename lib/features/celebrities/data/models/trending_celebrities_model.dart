import 'package:hive/hive.dart';
import 'package:movie_dock_application/core/databases/api/end_points.dart';

import '../../domain/entities/celebrities_entitiy.dart';
part 'trending_celebrities_model.g.dart';

@HiveType(typeId: 3)
class TrendingCelebritiesModel extends CelebritiesEntity {
  @HiveField(0)
  final bool adult;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String mediaType;

  @HiveField(3)
  @override
  final String? profilePath;

  @HiveField(4)
  @override
  final String originalName;

  @HiveField(5)
  @override
  final int id;
  TrendingCelebritiesModel({
    required this.adult,
    required this.name,
    required this.profilePath,
    required this.originalName,
    required this.id,
    required this.mediaType,
  }) : super(profilePath: profilePath, originalName: originalName, id: id);

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
