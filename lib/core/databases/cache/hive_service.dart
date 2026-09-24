import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_dock_application/features/celebrities/data/models/celebritie_combined_credits_model.dart';
import 'package:movie_dock_application/features/celebrities/data/models/celebritie_details_model.dart';
import 'package:movie_dock_application/features/celebrities/data/models/popular_celebrities_model.dart';
import 'package:movie_dock_application/features/celebrities/data/models/trending_celebrities_model.dart';

class HiveService {
  static const String popularCelebritiesBox = 'popular_celebrities_box';
  static const String trendingCelebritiesBox = 'trending_celebrities_box';
  static const String celebritieDetailsBox = 'celebritie_details_box';
  static const String celebritieCombinedCreditsBox =
      'celebritie_combined_credits_box';

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PopularCelebritiesModelAdapter());
    Hive.registerAdapter(TrendingCelebritiesModelAdapter());
    Hive.registerAdapter(CelebritieDetailsModelAdapter());
    Hive.registerAdapter(CelebritieCombinedCreditsModelAdapter());

    await Hive.openBox<PopularCelebritiesModel>(popularCelebritiesBox);
    await Hive.openBox<TrendingCelebritiesModel>(trendingCelebritiesBox);
    await Hive.openBox<CelebritieDetailsModel>(celebritieDetailsBox);
    await Hive.openBox<CelebritieCombinedCreditsModel>(
      celebritieCombinedCreditsBox,
    );
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
}
