import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/errors/failure.dart';
import 'package:movie_dock_application/core/search/domain/entities/search_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchEntity>>> search({required String query});
}
