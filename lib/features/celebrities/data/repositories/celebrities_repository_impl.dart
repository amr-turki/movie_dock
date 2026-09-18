import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_combined_credits.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_details.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/expentions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../domain/entities/celebrities_entitiy.dart';
import '../../domain/repositories/celebrities_repository.dart';
import '../datasources/celebrities_remote_data_source.dart';

class CelebritiesRepositoryImpl extends CelebritiesRepository {
  final NetworkInfo networkInfo;
  final CelebritiesRemoteDataSource remoteDataSource;
  CelebritiesRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<CelebritiesEntity>>> getPopularCelebrities({
    required CelebritiesParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteCelebrities = await remoteDataSource.getPopularCelebrities(
          params,
        );
        return Right(remoteCelebrities);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      }
    } else {
      return Left(Failure(errMessage: "No Internet Connection"));
    }
  }

  Future<Either<Failure, List<CelebritiesEntity>>>
  getTrendingCelebrities() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteCelebrities = await remoteDataSource
            .getTrendingCelebrities();
        return Right(remoteCelebrities);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      }
    } else {
      return Left(Failure(errMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, List<CelebritieCombinedCredits>>>
  getCelebritieCombinedCredits({
    required CelebritieDetailsParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteCelebrities =
            await remoteDataSource.GetCelebritieCombinedCredits(id: params.id);
        return Right(remoteCelebrities);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      }
    } else {
      return Left(Failure(errMessage: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, CelebritieDetail>> getCelebritieDetails({
    required CelebritieDetailsParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteCelebrities = await remoteDataSource.GetCelebritieDetails(
          id: params.id,
        );
        return Right(remoteCelebrities);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.statusMessage));
      }
    } else {
      return Left(Failure(errMessage: "No Internet Connection"));
    }
  }
}
