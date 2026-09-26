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

  static const String nowPlaying = "movie/now_playing";
  static const String popular = 'movie/popular';
  static const String TopRated = 'movie/top_rated';
  static const String upcoming = 'movie/upcoming';

  static const String airiingToday = "tv/airing_today";
  static const String onTheAir = "tv/on_the_air";
  static const String topRated = "tv/top_rated";
  static const String seriesPopular = "tv/popular";

  static String SeriesDetails(String id) {
    String path = "tv/" + id;
    return path;
  }

  static String SeriesCredits(String id) {
    String path = "tv/" + id + "/credits";
    return path;
  }

  static String SeriesRecommendations(String id) {
    String path = "tv/" + id + "/recommendations";
    return path;
  }

  static String MoviesRecommendation(String id) {
    return "movie/" + id + "/recommendations";
  }

  static String MoviesCredits(String id) {
    return "movie/" + id + "/credits";
  }

  static String MovieDetails(String id) {
    return "movie/" + id;
  }

  static const String search = "search/multi";
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

  static const String runtime = 'runtime';
  static const String status = 'status';
  static const String budget = 'budget';
  static const String revenue = 'revenue';
  static const String tagline = 'tagline';
  static const String genres = 'genres';
  static const String belongsToCollection = 'belongs_to_collection';
  static const String productionCompanies = 'production_companies';
  static const String productionCountries = 'production_countries';
  static const String spokenLanguages = 'spoken_languages';
  static const String logoPath = 'logo_path';
  static const String iso31661 = 'iso_3166_1';
  static const String iso6391 = 'iso_639_1';
  static const String englishName = 'english_name';

  static const String type = "type";
  static const String inProduction = "in_production";

  static const String stillPath = "still_path";

  static const String lastAirDate = "last_air_date";
  static const String airDate = "air_date";

  static const String languages = "languages";

  static const String createdBy = "created_by";

  static const String episodeRunTime = "episode_run_time";
  static const String numberOfEpisodes = "number_of_episodes";
  static const String numberOfSeasons = "number_of_seasons";
  static const String episodeNumber = "episode_number";
  static const String seasonNumber = "season_number";
  static const String seasons = "seasons";
  static const String lastEpisodeToAir = "last_episode_to_air";
  static const String nextEpisodeToAir = "next_episode_to_air";
  static const String productionCode = "production_code";
  static const String showId = "show_id";

  static const String networks = "networks";

  static const String query = 'query';
}
