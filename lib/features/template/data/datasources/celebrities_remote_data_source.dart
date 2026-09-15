import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/params/params.dart';
import '../models/celebrities_model.dart';

class CelebritiesRemoteDataSource {
  final ApiConsumer api;

  CelebritiesRemoteDataSource({required this.api});
  Future<CelebritiesModel> getCelebrities(CelebritiesParams params) async {
    final response = await api.get("${EndPoints.celebrities}/${params.id}");
    return CelebritiesModel.fromJson(response);
  }
}
