import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_combined_credits.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_details.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/celebrities_entitiy.dart';

abstract class CelebritiesRepository {
  Future<Either<Failure, List<CelebritiesEntity>>> getPopularCelebrities({
    required CelebritiesParams params,
  });

  Future<Either<Failure, List<CelebritiesEntity>>> getTrendingCelebrities();

  Future<Either<Failure, CelebritieDetail>> getCelebritieDetails({
    required CelebritieDetailsParams params,
  });

  Future<Either<Failure, List<CelebritieCombinedCredits>>>
  getCelebritieCombinedCredits({required CelebritieDetailsParams params});
}
