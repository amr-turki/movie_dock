import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/celebrities_entitiy.dart';
import '../repositories/celebrities_repository.dart';

class GetPopularCelebritiesUseCase {
  final CelebritiesRepository repository;

  GetPopularCelebritiesUseCase({required this.repository});

  Future<Either<Failure, List<CelebritiesEntity>>> call({
    required CelebritiesParams params,
  }) {
    return repository.getPopularCelebrities(params: params);
  }
}
