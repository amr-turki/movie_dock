import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_combined_credits.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/celebrities_repository.dart';

class GetCelebritieCombinedCreditssUseCase {
  final CelebritiesRepository repository;

  GetCelebritieCombinedCreditssUseCase({required this.repository});

  Future<Either<Failure, List<CelebritieCombinedCredits>>> call({
    required CelebritieDetailsParams params,
  }) {
    return repository.getCelebritieCombinedCredits(params: params);
  }
}
