import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/celebrities_entitiy.dart';

abstract class CelebritiesRepository {
  Future<Either<Failure, CelebritiesEntity>> getCelebrities({
    required CelebritiesParams params,
  });
}
