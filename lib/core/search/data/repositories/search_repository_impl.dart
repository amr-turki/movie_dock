import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/errors/failure.dart';
import 'package:movie_dock_application/core/search/data/datasources/search_remote_data_source.dart';
import 'package:movie_dock_application/core/search/domain/entities/search_entity.dart';
import 'package:movie_dock_application/core/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<SearchEntity>>> search({
    required String query,
  }) async {
    try {
      final results = await remoteDataSource.search(query: query);
      return Right(results);
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
