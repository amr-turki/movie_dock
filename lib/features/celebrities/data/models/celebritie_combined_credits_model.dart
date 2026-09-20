import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_combined_credits.dart';

class CelebritieCombinedCreditsModel extends CelebritieCombinedCredits {
  final bool adult;
  final String backdropPath;
  final String title;
  final String originaLanguage;
  final String originalTitle;
  final String overView;
  final double popularity;

  final bool video;
  final double voteAverage;
  final int voteCount;

  CelebritieCombinedCreditsModel({
    required this.voteAverage,
    required this.voteCount,
    required this.adult,
    required this.backdropPath,
    required super.mediaType,
    required this.originaLanguage,
    required this.originalTitle,
    required this.overView,
    required this.popularity,
    required this.title,
    required this.video,
    required super.id,
    required super.posterPath,
  });

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
