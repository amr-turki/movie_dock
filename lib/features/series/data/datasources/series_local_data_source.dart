import 'package:movie_dock_application/core/databases/cache/hive_service.dart';
import 'package:movie_dock_application/features/series/data/models/serie_details_model.dart';
import 'package:movie_dock_application/features/series/data/models/series_model.dart';
import 'package:movie_dock_application/features/series/data/models/tv_series_credits_model.dart';
import 'package:movie_dock_application/features/series/data/models/tv_series_recommendation_model.dart';

abstract class SeriesLocalDataSource {
  Future<void> cacheAiringTodaySeries(List<SeriesModel> list);
  List<SeriesModel> getCachedAiringTodaySeries();

  Future<void> cacheOnTheAirSeries(List<SeriesModel> list);
  List<SeriesModel> getCachedOnTheAirSeries();

  Future<void> cachePopularSeries(List<SeriesModel> list);
  List<SeriesModel> getCachedPopularSeries();

  Future<void> cacheTopRatedSeries(List<SeriesModel> list);
  List<SeriesModel> getCachedTopRatedSeries();

  Future<void> cacheSerieDetails(SerieDetailsModel details);
  SerieDetailsModel? getCachedSerieDetails(int id);

  Future<void> cacheSerieRecommendations(
    List<TvSeriesRecommendationModel> list,
  );
  List<TvSeriesRecommendationModel> getCachedSerieRecommendations();

  Future<void> cacheSerieCredits(List<TvSeriesCreditsModel> list);
  List<TvSeriesCreditsModel> getCachedSerieCredits();
}

class SeriesLocalDataSourceImpl implements SeriesLocalDataSource {
  @override
  Future<void> cacheAiringTodaySeries(List<SeriesModel> list) async {
    await HiveService.cacheAiringTodaySeries(list);
  }

  @override
  List<SeriesModel> getCachedAiringTodaySeries() {
    return HiveService.getCachedAiringTodaySeries();
  }

  @override
  Future<void> cacheOnTheAirSeries(List<SeriesModel> list) async {
    await HiveService.cacheOnTheAirSeries(list);
  }

  @override
  List<SeriesModel> getCachedOnTheAirSeries() {
    return HiveService.getCachedOnTheAirSeries();
  }

  @override
  Future<void> cachePopularSeries(List<SeriesModel> list) async {
    await HiveService.cachePopularSeries(list);
  }

  @override
  List<SeriesModel> getCachedPopularSeries() {
    return HiveService.getCachedPopularSeries();
  }

  @override
  Future<void> cacheTopRatedSeries(List<SeriesModel> list) async {
    await HiveService.cacheTopRatedSeries(list);
  }

  @override
  List<SeriesModel> getCachedTopRatedSeries() {
    return HiveService.getCachedTopRatedSeries();
  }

  @override
  Future<void> cacheSerieDetails(SerieDetailsModel details) async {
    await HiveService.cacheSerieDetails(details);
  }

  @override
  SerieDetailsModel? getCachedSerieDetails(int id) {
    return HiveService.getCachedSerieDetails(id);
  }

  @override
  Future<void> cacheSerieRecommendations(
    List<TvSeriesRecommendationModel> list,
  ) async {
    await HiveService.cacheSerieRecommendations(list);
  }

  @override
  List<TvSeriesRecommendationModel> getCachedSerieRecommendations() {
    return HiveService.getCachedSerieRecommendations();
  }

  @override
  Future<void> cacheSerieCredits(List<TvSeriesCreditsModel> list) async {
    await HiveService.cacheSerieCredits(list);
  }

  @override
  List<TvSeriesCreditsModel> getCachedSerieCredits() {
    return HiveService.getCachedSerieCredits();
  }
}
