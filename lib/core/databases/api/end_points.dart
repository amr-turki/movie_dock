abstract class EndPoints {
  static const String token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZTFkNmYyN2QzODZkZmNhZmM4YzgzOTQ3ZjY1YjBjMiIsIm5iZiI6MTc4ODgwODYxNi4xNDgsInN1YiI6IjZhOWYwZGE4OTVhNjVjZTUxYmM3NTIxZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mPM_EZYzwAa1N6AVOQXTwnIqaRBOz_be5kX29uY6eXM";
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String popularCelebrities = "person/popular";
  static const String trendingCelebrities = "trending/person/day";
  static String combinedCredits(String id) {
    String path = "person/" + id + "/combined_credits";
    return path;
  }

  static String CeleritieDetails(String id) {
    String path = "person/" + id;
    return path;
  }
}

abstract class ApiKey {
  static const String page = 'page';
  static const String results = 'results';
  static const String totalPages = 'total_pages';
  static const String totalResults = 'total_results';

  static const String id = 'id';
  static const String name = 'name';
  static const String originalName = 'original_name';
  static const String adult = 'adult';
  static const String gender = 'gender';
  static const String knownForDepartment = 'known_for_department';
  static const String popularity = 'popularity';
  static const String profilePath = 'profile_path';
  static const String knownFor = 'known_for';

  static const String video = "video";
  static const String title = 'title';
  static const String originalTitle = 'original_title';
  static const String overview = 'overview';
  static const String posterPath = 'poster_path';
  static const String backdropPath = 'backdrop_path';
  static const String mediaType = 'media_type';
  static const String originalLanguage = 'original_language';
  static const String genreIds = 'genre_ids';
  static const String releaseDate = 'release_date';
  static const String firstAirDate = 'first_air_date';
  static const String voteAverage = 'vote_average';
  static const String voteCount = 'vote_count';
  static const String originCountry = 'origin_country';

  static const String alsoKnownAs = 'also_known_as';
  static const String biography = 'biography';
  static const String birthday = 'birthday';
  static const String deathday = 'deathday';
  static const String homepage = 'homepage';
  static const String imdbId = 'imdb_id';
  static const String placeOfBirth = 'place_of_birth';

  static const String cast = 'cast';
  static const String crew = 'crew';
  static const String character = 'character';
  static const String creditId = 'credit_id';
  static const String order = 'order';
  static const String department = 'department';
  static const String job = 'job';
  static const String episodeCount = 'episode_count';
  static const String firstCreditAirDate = 'first_credit_air_date';
}
