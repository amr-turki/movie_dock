import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/series/data/models/serie_details_model.dart';
import 'package:movie_dock_application/features/series/data/models/series_model.dart';
import 'package:movie_dock_application/features/series/data/models/tv_series_credits_model.dart';
import 'package:movie_dock_application/features/series/data/models/tv_series_recommendation_model.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_credits.dart';
import 'package:movie_dock_application/features/series/domain/entities/tv_series_details_entity.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';

class SeriesRemoteDataSource {
  final ApiConsumer api;

  SeriesRemoteDataSource({required this.api});
  Future<List<SeriesModel>> getSeriesOnTheAir() async {
    final response = await api.get("${EndPoints.onTheAir}");

    List<SeriesModel> series = [];

    if (response[ApiKey.results] != null && response != null) {
      for (var serie in response[ApiKey.results]) {
        series.add(SeriesModel.fromJson(serie));
      }
    }
    return series;
  }

  Future<List<SeriesModel>> getSeriesTopRated() async {
    final response = await api.get("${EndPoints.topRated}");
    List<SeriesModel> series = [];
    if (response[ApiKey.results] != null && response != null) {
      for (var serie in response[ApiKey.results]) {
        series.add(SeriesModel.fromJson(serie));
      }
    }
    return series;
  }

  Future<List<SeriesModel>> getSeriesPopular() async {
    final response = await api.get("${EndPoints.popular}");

    List<SeriesModel> series = [];
    if (response[ApiKey.results] != null && response != null) {
      for (var serie in response[ApiKey.results]) {
        series.add(SeriesModel.fromJson(serie));
      }
    }
    return series;
  }

  Future<List<SeriesModel>> getSeriesAiringToday() async {
    final response = await api.get("${EndPoints.airiingToday}");
    List<SeriesModel> series = [];
    if (response[ApiKey.results] != null && response != null) {
      for (var serie in response[ApiKey.results]) {
        series.add(SeriesModel.fromJson(serie));
      }
    }
    return series;
  }

  Future<SerieDetailsModel> getSerieDetails({
    required SeriesParams params,
  }) async {
    final response = await api.get(
      "${EndPoints.SeriesDetails(params.seriesId.toString())}",
    );
    return SerieDetailsModel.fromJson(response);
  }

  Future<List<TvSeriesRecommendationModel>> getSeriesRecommendations({
    required SeriesParams params,
  }) async {
    final response = await api.get(
      "${EndPoints.SeriesRecommendations(params.seriesId.toString())}",
    );
    List<TvSeriesRecommendationModel> series = [];
    if (response[ApiKey.results] != null && response != null) {
      for (var serie in response[ApiKey.results]) {
        series.add(TvSeriesRecommendationModel.fromJson(serie));
      }
    }
    return series;
  }

  Future<List<TvSeriesCreditsModel>> getSeriecredits({
    required SeriesParams params,
  }) async {
    final response = await api.get(
      "${EndPoints.SeriesCredits(params.seriesId.toString())}",
    );
    List<TvSeriesCreditsModel> series = [];
    if (response[ApiKey.cast] != null && response != null) {
      for (var serie in response[ApiKey.cast]) {
        series.add(TvSeriesCreditsModel.fromJson(serie));
      }
    }
    return series;
  }
}
