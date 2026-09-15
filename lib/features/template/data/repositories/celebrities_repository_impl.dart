import 'package:dartz/dartz.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/expentions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../domain/entities/celebrities_entitiy.dart';
import '../../domain/repositories/celebrities_repository.dart';
import '../datasources/celebrities_local_data_source.dart';
import '../datasources/celebrities_remote_data_source.dart';

class CelebritiesRepositoryImpl extends CelebritiesRepository {
  final NetworkInfo networkInfo;
  final CelebritiesRemoteDataSource remoteDataSource;
  final CelebritiesLocalDataSource localDataSource;
  CelebritiesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, CelebritiesEntity>> getCelebrities({
    required CelebritiesParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteCelebrities = await remoteDataSource.getCelebrities(params);
        localDataSource.cacheCelebrities(remoteCelebrities);
        return Right(remoteCelebrities);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localCelebrities = await localDataSource.getLastCelebrities();
        return Right(localCelebrities);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
