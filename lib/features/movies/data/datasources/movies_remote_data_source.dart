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
}
