import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/celebrities_entitiy.dart';
import '../repositories/celebrities_repository.dart';

class GetTrendingCelebritiesUseCase {
  final CelebritiesRepository repository;

  GetTrendingCelebritiesUseCase({required this.repository});

  Future<Either<Failure, List<CelebritiesEntity>>> call() {
    return repository.getTrendingCelebrities();
  }
}
