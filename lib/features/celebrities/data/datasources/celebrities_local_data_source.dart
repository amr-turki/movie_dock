import 'package:movie_dock_application/core/databases/cache/hive_service.dart';
import 'package:movie_dock_application/features/celebrities/data/models/celebritie_combined_credits_model.dart';
import 'package:movie_dock_application/features/celebrities/data/models/celebritie_details_model.dart';
import 'package:movie_dock_application/features/celebrities/data/models/popular_celebrities_model.dart';
import 'package:movie_dock_application/features/celebrities/data/models/trending_celebrities_model.dart';

abstract class CelebritiesLocalDataSource {
  Future<void> cachePopularCelebrities(List<PopularCelebritiesModel> list);
  List<PopularCelebritiesModel> getCachedPopularCelebrities();

  Future<void> cacheTrendingCelebrities(List<TrendingCelebritiesModel> list);
  List<TrendingCelebritiesModel> getCachedTrendingCelebrities();

  Future<void> cacheCelebritieDetails(CelebritieDetailsModel details);
  CelebritieDetailsModel? getCachedCelebritieDetails(int id);

  Future<void> cacheCelebritieCombinedCredits(
    List<CelebritieCombinedCreditsModel> list,
  );
  List<CelebritieCombinedCreditsModel> getCachedCelebritieCombinedCredits();
}

class CelebritiesLocalDataSourceImpl implements CelebritiesLocalDataSource {
  @override
  Future<void> cachePopularCelebrities(
    List<PopularCelebritiesModel> list,
  ) async {
    await HiveService.cachePopularCelebrities(list);
  }

  @override
  List<PopularCelebritiesModel> getCachedPopularCelebrities() {
    return HiveService.getCachedPopularCelebrities();
  }

  @override
  Future<void> cacheTrendingCelebrities(
    List<TrendingCelebritiesModel> list,
  ) async {
    await HiveService.cacheTrendingCelebrities(list);
  }

  @override
  List<TrendingCelebritiesModel> getCachedTrendingCelebrities() {
    return HiveService.getCachedTrendingCelebrities();
  }

  @override
  Future<void> cacheCelebritieDetails(CelebritieDetailsModel details) async {
    await HiveService.cacheCelebritieDetails(details);
  }

  @override
  CelebritieDetailsModel? getCachedCelebritieDetails(int id) {
    return HiveService.getCachedCelebritieDetails(id);
  }

  @override
  Future<void> cacheCelebritieCombinedCredits(
    List<CelebritieCombinedCreditsModel> list,
  ) async {
    await HiveService.cacheCelebritieCombinedCredits(list);
  }

  @override
  List<CelebritieCombinedCreditsModel> getCachedCelebritieCombinedCredits() {
    return HiveService.getCachedCelebritieCombinedCredits();
  }
}
