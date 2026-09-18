import 'package:dartz/dartz.dart';
import 'package:happytech_clean_architecture/core/errors/failure.dart';
import 'package:happytech_clean_architecture/core/params/params.dart';
import 'package:happytech_clean_architecture/features/movies/domain/entities/movies_entitiy.dart';
import 'package:happytech_clean_architecture/features/movies/domain/repositories/movies_repository.dart';

class Getmovies {
  final moviesRepository repository;

  Getmovies({required this.repository});

  Future<Either<Failure, moviesEntity>> call({required moviesParams params}) {
    return repository.getmovies(params: params);
  }
}
