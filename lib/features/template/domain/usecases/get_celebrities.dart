import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/celebrities_entitiy.dart';
import '../repositories/celebrities_repository.dart';

class GetCelebrities {
  final CelebritiesRepository repository;

  GetCelebrities({required this.repository});

  Future<Either<Failure, CelebritiesEntity>> call({
    required CelebritiesParams params,
  }) {
    return repository.getCelebrities(params: params);
  }
}
