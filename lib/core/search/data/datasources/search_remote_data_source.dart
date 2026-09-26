import 'package:movie_dock_application/core/databases/api/api_consumer.dart';
import 'package:movie_dock_application/core/databases/api/end_points.dart';
import 'package:movie_dock_application/core/search/domain/entities/search_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchEntity>> search({required String query});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiConsumer api;

  SearchRemoteDataSourceImpl({required this.api});

  @override
  Future<List<SearchEntity>> search({required String query}) async {
    final response = await api.get(
      EndPoints.search,
      queryParameters: {ApiKey.query: query},
    );

    List<SearchEntity> searchResults = [];
    if (response[ApiKey.results] != null) {
      for (var item in response[ApiKey.results]) {
        String imagePath =
            item[ApiKey.posterPath] ?? item[ApiKey.profilePath] ?? '';
        String titleName = item[ApiKey.title] ?? item[ApiKey.name] ?? '';

        searchResults.add(
          SearchEntity(
            id: item[ApiKey.id] ?? 0,
            image: imagePath,
            name: titleName,
            mediaType: item[ApiKey.mediaType] ?? '',
          ),
        );
      }
    }
    return searchResults;
  }
}
