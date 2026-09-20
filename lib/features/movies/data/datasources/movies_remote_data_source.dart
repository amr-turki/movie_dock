import 'package:movie_dock_application/features/movies/data/models/movie_credits_model.dart';
import 'package:movie_dock_application/features/movies/data/models/movie_details_model.dart';
import 'package:movie_dock_application/features/movies/data/models/movie_recommendation_model.dart';
import 'package:movie_dock_application/features/movies/data/models/movies_model.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/params/params.dart';

class MoviesRemoteDataSource {
  final ApiConsumer api;

  MoviesRemoteDataSource({required this.api});

  Future<List<MoviesModel>> getMoviesNowPlaying(MoviesParams params) async {
    final response = await api.get(
      EndPoints.nowPlaying,
      queryParameters: {'page': params.page},
    );

    List<MoviesModel> moviesList = [];

    if (response != null && response[ApiKey.results] != null) {
      for (var item in response[ApiKey.results]) {
        moviesList.add(MoviesModel.fromJson(item));
      }
    }
    return moviesList;
  }

  Future<List<MoviesModel>> getMoviesPopularList(MoviesParams params) async {
    final response = await api.get(
      EndPoints.popular,
      queryParameters: {'page': params.page},
    );

    List<MoviesModel> moviesList = [];

    if (response != null && response[ApiKey.results] != null) {
      for (var item in response[ApiKey.results]) {
        moviesList.add(MoviesModel.fromJson(item));
      }
    }
    return moviesList;
  }

  Future<List<MoviesModel>> getMoviesTopRated(MoviesParams params) async {
    final response = await api.get(
      EndPoints.TopRated,
      queryParameters: {'page': params.page},
    );

    List<MoviesModel> moviesList = [];

    if (response != null && response[ApiKey.results] != null) {
      for (var item in response[ApiKey.results]) {
        moviesList.add(MoviesModel.fromJson(item));
      }
    }
    return moviesList;
  }

  Future<List<MoviesModel>> getMoviesUpcomingList(MoviesParams params) async {
    final response = await api.get(
      EndPoints.upcoming,
      queryParameters: {'page': params.page},
    );

    List<MoviesModel> moviesList = [];

    if (response != null && response[ApiKey.results] != null) {
      for (var item in response[ApiKey.results]) {
        moviesList.add(MoviesModel.fromJson(item));
      }
    }

    return moviesList;
  }

  Future<MovieDetailsModel> getMovieDetails({
    required MovieParams params,
  }) async {
    final response = await api.get(
      "${EndPoints.MovieDetails(params.movieId.toString())}",
    );
    return MovieDetailsModel.fromJson(response);
  }

  Future<List<MovieRecommendationModel>> getMoviesRecommendations({
    required MovieParams params,
  }) async {
    final response = await api.get(
      "${EndPoints.MoviesRecommendation(params.movieId.toString())}",
    );
    List<MovieRecommendationModel> movies = [];
    if (response[ApiKey.results] != null && response != null) {
      for (var serie in response[ApiKey.results]) {
        movies.add(MovieRecommendationModel.fromJson(serie));
      }
    }
    return movies;
  }

  Future<List<MovieCreditsModel>> getMoviecredits({
    required MovieParams params,
  }) async {
    final response = await api.get(
      "${EndPoints.MoviesCredits(params.movieId.toString())}",
    );
    List<MovieCreditsModel> movies = [];
    if (response[ApiKey.cast] != null && response != null) {
      for (var serie in response[ApiKey.cast]) {
        movies.add(MovieCreditsModel.fromJson(serie));
      }
    }
    return movies;
  }
}
