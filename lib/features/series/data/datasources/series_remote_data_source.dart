import 'package:movie_dock_application/features/series/data/models/series_model.dart';

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
}
