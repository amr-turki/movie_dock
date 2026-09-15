import 'package:movie_dock_application/features/template/domain/entities/celebrities_entitiy.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/params/params.dart';
import '../models/celebrities_model.dart';

class CelebritiesRemoteDataSource {
  final ApiConsumer api;

  CelebritiesRemoteDataSource({required this.api});
  Future<List<PopularCelebritiesModel>> getPopularCelebrities(
    CelebritiesParams params,
  ) async {
    final response = await api.get(
      EndPoints.popularCelebrities,
      queryParameters: {ApiKey.page: params.page},
    );

    List<PopularCelebritiesModel> celebrities = [];
    if (response[ApiKey.results] != null) {
      for (var celebritie in response[ApiKey.results]) {
        celebrities.add(PopularCelebritiesModel.fromJson(celebritie));
      }
    }
    return celebrities;
  }
}
