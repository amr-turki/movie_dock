import 'package:movie_dock_application/core/databases/api/api_consumer.dart';
import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/features/movies/data/models/movies_model.dart';

class moviesRemoteDataSource {
  final ApiConsumer api;

  moviesRemoteDataSource({required this.api});
  Future<moviesModel> getmovies(moviesParams params) async {
    final response = await api.get("${EndPoints.movies}/${params.id}");
    return moviesModel.fromJson(response);
  }
}
