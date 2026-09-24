import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_dock_application/features/celebrities/data/models/celebritie_combined_credits_model.dart';
import 'package:movie_dock_application/features/celebrities/data/models/celebritie_details_model.dart';
import 'package:movie_dock_application/features/celebrities/data/models/popular_celebrities_model.dart';
import 'package:movie_dock_application/features/celebrities/data/models/trending_celebrities_model.dart';
import 'package:movie_dock_application/features/movies/data/models/movie_credits_model.dart';
import 'package:movie_dock_application/features/movies/data/models/movie_details_model.dart';
import 'package:movie_dock_application/features/movies/data/models/movie_recommendation_model.dart';
import 'package:movie_dock_application/features/movies/data/models/movies_model.dart';

class HiveService {
  static const String popularCelebritiesBox = 'popular_celebrities_box';
  static const String trendingCelebritiesBox = 'trending_celebrities_box';
  static const String celebritieDetailsBox = 'celebritie_details_box';
  static const String celebritieCombinedCreditsBox =
      'celebritie_combined_credits_box';

  static const String nowPlayingMoviesBox = 'now_playing_movies_box';
  static const String popularMoviesBox = 'popular_movies_box';
  static const String topRatedMoviesBox = 'top_rated_movies_box';
  static const String upcomingMoviesBox = 'upcoming_movies_box';
  static const String movieDetailsBox = 'movie_details_box';
  static const String movieRecommendationsBox = 'movie_recommendations_box';
  static const String movieCreditsBox = 'movie_credits_box';

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PopularCelebritiesModelAdapter());
    Hive.registerAdapter(TrendingCelebritiesModelAdapter());
    Hive.registerAdapter(CelebritieDetailsModelAdapter());
    Hive.registerAdapter(CelebritieCombinedCreditsModelAdapter());

    Hive.registerAdapter(MovieCreditsModelAdapter());
    Hive.registerAdapter(MovieDetailsModelAdapter());
    Hive.registerAdapter(MovieRecommendationModelAdapter());
    Hive.registerAdapter(MoviesModelAdapter());

    await Hive.openBox<PopularCelebritiesModel>(popularCelebritiesBox);
    await Hive.openBox<TrendingCelebritiesModel>(trendingCelebritiesBox);
    await Hive.openBox<CelebritieDetailsModel>(celebritieDetailsBox);
    await Hive.openBox<CelebritieCombinedCreditsModel>(
      celebritieCombinedCreditsBox,
    );

    await Hive.openBox<MoviesModel>(nowPlayingMoviesBox);
    await Hive.openBox<MoviesModel>(popularMoviesBox);
    await Hive.openBox<MoviesModel>(topRatedMoviesBox);
    await Hive.openBox<MoviesModel>(upcomingMoviesBox);
    await Hive.openBox<MovieDetailsModel>(movieDetailsBox);
    await Hive.openBox<MovieRecommendationModel>(movieRecommendationsBox);
    await Hive.openBox<MovieCreditsModel>(movieCreditsBox);
  }

  static Future<void> cachePopularCelebrities(
    List<PopularCelebritiesModel> list,
  ) async {
    final box = Hive.box<PopularCelebritiesModel>(popularCelebritiesBox);
    await box.clear();
    await box.addAll(list);
  }

  static List<PopularCelebritiesModel> getCachedPopularCelebrities() {
    final box = Hive.box<PopularCelebritiesModel>(popularCelebritiesBox);
    return box.values.toList();
  }

  static Future<void> cacheTrendingCelebrities(
    List<TrendingCelebritiesModel> list,
  ) async {
    final box = Hive.box<TrendingCelebritiesModel>(trendingCelebritiesBox);
    await box.clear();
    await box.addAll(list);
  }

  static List<TrendingCelebritiesModel> getCachedTrendingCelebrities() {
    final box = Hive.box<TrendingCelebritiesModel>(trendingCelebritiesBox);
    return box.values.toList();
  }

  static Future<void> cacheCelebritieDetails(
    CelebritieDetailsModel details,
  ) async {
    final box = Hive.box<CelebritieDetailsModel>(celebritieDetailsBox);
    await box.put(details.id, details);
  }

  static CelebritieDetailsModel? getCachedCelebritieDetails(int id) {
    final box = Hive.box<CelebritieDetailsModel>(celebritieDetailsBox);
    return box.get(id);
  }

  static Future<void> cacheCelebritieCombinedCredits(
    List<CelebritieCombinedCreditsModel> list,
  ) async {
    final box = Hive.box<CelebritieCombinedCreditsModel>(
      celebritieCombinedCreditsBox,
    );
    await box.clear();
    await box.addAll(list);
  }

  static List<CelebritieCombinedCreditsModel>
  getCachedCelebritieCombinedCredits() {
    final box = Hive.box<CelebritieCombinedCreditsModel>(
      celebritieCombinedCreditsBox,
    );
    return box.values.toList();
  }

  static Future<void> cacheNowPlayingMovies(List<MoviesModel> list) async {
    final box = Hive.box<MoviesModel>(nowPlayingMoviesBox);
    await box.clear();
    await box.addAll(list);
  }

  static List<MoviesModel> getCachedNowPlayingMovies() {
    final box = Hive.box<MoviesModel>(nowPlayingMoviesBox);
    return box.values.toList();
  }

  static Future<void> cachePopularMovies(List<MoviesModel> list) async {
    final box = Hive.box<MoviesModel>(popularMoviesBox);
    await box.clear();
    await box.addAll(list);
  }

  static List<MoviesModel> getCachedPopularMovies() {
    final box = Hive.box<MoviesModel>(popularMoviesBox);
    return box.values.toList();
  }

  static Future<void> cacheTopRatedMovies(List<MoviesModel> list) async {
    final box = Hive.box<MoviesModel>(topRatedMoviesBox);
    await box.clear();
    await box.addAll(list);
  }

  static List<MoviesModel> getCachedTopRatedMovies() {
    final box = Hive.box<MoviesModel>(topRatedMoviesBox);
    return box.values.toList();
  }

  static Future<void> cacheUpcomingMovies(List<MoviesModel> list) async {
    final box = Hive.box<MoviesModel>(upcomingMoviesBox);
    await box.clear();
    await box.addAll(list);
  }

  static List<MoviesModel> getCachedUpcomingMovies() {
    final box = Hive.box<MoviesModel>(upcomingMoviesBox);
    return box.values.toList();
  }

  static Future<void> cacheMovieDetails(MovieDetailsModel details) async {
    final box = Hive.box<MovieDetailsModel>(movieDetailsBox);
    await box.put(details.id, details);
  }

  static MovieDetailsModel? getCachedMovieDetails(int id) {
    final box = Hive.box<MovieDetailsModel>(movieDetailsBox);
    return box.get(id);
  }

  static Future<void> cacheMovieRecommendations(
    int movieId,
    List<MovieRecommendationModel> list,
  ) async {
    final box = Hive.box<MovieRecommendationModel>(movieRecommendationsBox);
    await box.putAll({for (var item in list) item.id: item});
  }

  static List<MovieRecommendationModel> getCachedMovieRecommendations() {
    final box = Hive.box<MovieRecommendationModel>(movieRecommendationsBox);
    return box.values.toList();
  }

  static Future<void> cacheMovieCredits(List<MovieCreditsModel> list) async {
    final box = Hive.box<MovieCreditsModel>(movieCreditsBox);
    await box.clear();
    await box.addAll(list);
  }

  static List<MovieCreditsModel> getCachedMovieCredits() {
    final box = Hive.box<MovieCreditsModel>(movieCreditsBox);
    return box.values.toList();
  }
}
