import 'package:dartz/dartz.dart';
import 'package:happytech_clean_architecture/core/errors/failure.dart';
import 'package:happytech_clean_architecture/core/params/params.dart';
import 'package:happytech_clean_architecture/features/movies/domain/entities/movies_entitiy.dart';

abstract class moviesRepository {
  Future<Either<Failure, moviesEntity>> getmovies({
    required moviesParams params,
  });
}
