import 'package:hive/hive.dart';
import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_combined_credits.dart';

part 'celebritie_combined_credits_model.g.dart';

@HiveType(typeId: 0)
class CelebritieCombinedCreditsModel extends CelebritieCombinedCredits {
  @HiveField(0)
  final bool adult;
  @HiveField(1)
  final String backdropPath;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String originaLanguage;
  @HiveField(4)
  final String originalTitle;
  @HiveField(5)
  final String overView;
  @HiveField(6)
  final double popularity;
  @HiveField(7)
  final bool video;
  @HiveField(8)
  final double voteAverage;
  @HiveField(9)
  final int voteCount;

  @HiveField(10)
  @override
  final int id;

  @HiveField(11)
  @override
  final String mediaType;

  @HiveField(12)
  @override
  final String posterPath;

  CelebritieCombinedCreditsModel({
    required this.voteAverage,
    required this.voteCount,
    required this.adult,
    required this.backdropPath,
    required this.mediaType,
    required this.originaLanguage,
    required this.originalTitle,
    required this.overView,
    required this.popularity,
    required this.title,
    required this.video,
    required this.id,
    required this.posterPath,
  }) : super(id: id, mediaType: mediaType, posterPath: posterPath);

  factory CelebritieCombinedCreditsModel.fromJson(Map<String, dynamic> json) {
    return CelebritieCombinedCreditsModel(
      voteAverage: (json[ApiKey.voteAverage] as num?)?.toDouble() ?? 0.0,
      voteCount: (json[ApiKey.voteCount] as num?)?.toInt() ?? 0,
      adult: (json[ApiKey.adult]) ?? false,
      backdropPath: json[ApiKey.backdropPath] ?? '',
      mediaType: json[ApiKey.mediaType] ?? '',
      originaLanguage: json[ApiKey.originalLanguage] ?? '',
      originalTitle: json[ApiKey.originalTitle] ?? '',
      overView: json[ApiKey.overview] ?? '',
      popularity: (json[ApiKey.popularity] as num?)?.toDouble() ?? 0.0,
      title: json[ApiKey.title] ?? '',
      video: json[ApiKey.video] ?? false,
      id: (json[ApiKey.id] as num?)?.toInt() ?? 0,
      posterPath: json[ApiKey.posterPath] ?? '',
    );
  }
}
