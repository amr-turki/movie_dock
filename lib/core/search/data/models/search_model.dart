class SearchResultModel {
  final int id;
  final String mediaType;
  final String nameOrTitle;
  final String originalNameOrTitle;
  final String overview;
  final String posterOrProfilePath;
  final String backdropPath;
  final String mediaLanguage;
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final String releaseOrFirstAirDate;
  SearchResultModel({
    required this.id,
    required this.mediaType,
    required this.nameOrTitle,
    required this.originalNameOrTitle,
    required this.overview,
    required this.posterOrProfilePath,
    required this.backdropPath,
    required this.mediaLanguage,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.releaseOrFirstAirDate,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    String titleName = json['title'] ?? json['name'] ?? '';
    String originalTitleName =
        json['original_title'] ?? json['original_name'] ?? '';
    String imagePath = json['poster_path'] ?? json['profile_path'] ?? '';
    String date = json['release_date'] ?? json['first_air_date'] ?? '';

    return SearchResultModel(
      id: json['id'] ?? 0,
      mediaType: json['media_type'] ?? '',
      nameOrTitle: titleName,
      originalNameOrTitle: originalTitleName,
      overview: json['overview'] ?? '',
      posterOrProfilePath: imagePath,
      backdropPath: json['backdrop_path'] ?? '',
      mediaLanguage: json['original_language'] ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      releaseOrFirstAirDate: date,
    );
  }
}
