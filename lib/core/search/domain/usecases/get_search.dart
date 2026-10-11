import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/search/domain/repositories/search_repository.dart';

import 'package:movie_dock_application/core/errors/failure.dart';
import 'package:movie_dock_application/core/search/domain/entities/search_entity.dart';

class SearchUseCase {
  final SearchRepository repository;

  SearchUseCase({required this.repository});

  Future<Either<Failure, List<SearchEntity>>> call({required String query}) {
    return repository.search(query: query);
  }
}
