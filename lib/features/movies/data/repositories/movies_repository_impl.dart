import 'package:dartz/dartz.dart';
import 'package:happytech_clean_architecture/core/connection/network_info.dart';
import 'package:happytech_clean_architecture/core/errors/expentions.dart';
import 'package:happytech_clean_architecture/core/errors/failure.dart';
import 'package:happytech_clean_architecture/core/params/params.dart';
import 'package:happytech_clean_architecture/features/movies/data/datasources/movies_local_data_source.dart';
import 'package:happytech_clean_architecture/features/movies/data/datasources/movies_remote_data_source.dart';
import 'package:happytech_clean_architecture/features/movies/domain/entities/movies_entitiy.dart';
import 'package:happytech_clean_architecture/features/movies/domain/repositories/movies_repository.dart';

class moviesRepositoryImpl extends moviesRepository {
  final NetworkInfo networkInfo;
  final moviesRemoteDataSource remoteDataSource;
  final moviesLocalDataSource localDataSource;
  moviesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, moviesEntity>> getmovies({
    required moviesParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remotemovies = await remoteDataSource.getmovies(params);
        localDataSource.cachemovies(remotemovies);
        return Right(remotemovies);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localmovies = await localDataSource.getLastmovies();
        return Right(localmovies);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
