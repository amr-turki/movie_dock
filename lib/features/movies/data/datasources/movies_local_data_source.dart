import 'package:movie_dock_application/core/databases/cache/hive_service.dart';
import 'package:movie_dock_application/features/movies/data/models/movie_credits_model.dart';
import 'package:movie_dock_application/features/movies/data/models/movie_details_model.dart';
import 'package:movie_dock_application/features/movies/data/models/movie_recommendation_model.dart';
import 'package:movie_dock_application/features/movies/data/models/movies_model.dart';

abstract class MoviesLocalDataSource {
  Future<void> cacheNowPlayingMovies(List<MoviesModel> list);
  List<MoviesModel> getCachedNowPlayingMovies();

  Future<void> cachePopularMovies(List<MoviesModel> list);
  List<MoviesModel> getCachedPopularMovies();

  Future<void> cacheTopRatedMovies(List<MoviesModel> list);
  List<MoviesModel> getCachedTopRatedMovies();

  Future<void> cacheUpcomingMovies(List<MoviesModel> list);
  List<MoviesModel> getCachedUpcomingMovies();

  Future<void> cacheMovieDetails(MovieDetailsModel details);
  MovieDetailsModel? getCachedMovieDetails(int id);

  Future<void> cacheMovieRecommendations(
    int movieId,
    List<MovieRecommendationModel> list,
  );
  List<MovieRecommendationModel> getCachedMovieRecommendations();

  Future<void> cacheMovieCredits(List<MovieCreditsModel> list);
  List<MovieCreditsModel> getCachedMovieCredits();
}

class MoviesLocalDataSourceImpl implements MoviesLocalDataSource {
  @override
  Future<void> cacheNowPlayingMovies(List<MoviesModel> list) async {
    await HiveService.cacheNowPlayingMovies(list);
  }

  @override
  List<MoviesModel> getCachedNowPlayingMovies() {
    return HiveService.getCachedNowPlayingMovies();
  }

  @override
  Future<void> cachePopularMovies(List<MoviesModel> list) async {
    await HiveService.cachePopularMovies(list);
  }

  @override
  List<MoviesModel> getCachedPopularMovies() {
    return HiveService.getCachedPopularMovies();
  }

  @override
  Future<void> cacheTopRatedMovies(List<MoviesModel> list) async {
    await HiveService.cacheTopRatedMovies(list);
  }

  @override
  List<MoviesModel> getCachedTopRatedMovies() {
    return HiveService.getCachedTopRatedMovies();
  }

  @override
  Future<void> cacheUpcomingMovies(List<MoviesModel> list) async {
    await HiveService.cacheUpcomingMovies(list);
  }

  @override
  List<MoviesModel> getCachedUpcomingMovies() {
    return HiveService.getCachedUpcomingMovies();
  }

  @override
  Future<void> cacheMovieDetails(MovieDetailsModel details) async {
    await HiveService.cacheMovieDetails(details);
  }

  @override
  MovieDetailsModel? getCachedMovieDetails(int id) {
    return HiveService.getCachedMovieDetails(id);
  }

  @override
  Future<void> cacheMovieRecommendations(
    int movieId,
    List<MovieRecommendationModel> list,
  ) async {
    await HiveService.cacheMovieRecommendations(movieId, list);
  }

  @override
  List<MovieRecommendationModel> getCachedMovieRecommendations() {
    return HiveService.getCachedMovieRecommendations();
  }

  @override
  Future<void> cacheMovieCredits(List<MovieCreditsModel> list) async {
    await HiveService.cacheMovieCredits(list);
  }

  @override
  List<MovieCreditsModel> getCachedMovieCredits() {
    return HiveService.getCachedMovieCredits();
  }
}
