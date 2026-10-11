import 'package:dartz/dartz.dart';
import 'package:movie_dock_application/core/params/params.dart';
import 'package:movie_dock_application/features/celebrities/domain/entities/celebritie_details.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/celebrities_repository.dart';

class GetCelebritieDetailsUseCase {
  final CelebritiesRepository repository;

  GetCelebritieDetailsUseCase({required this.repository});

  Future<Either<Failure, CelebritieDetail>> call({
    required CelebritieDetailsParams params,
  }) {
    return repository.getCelebritieDetails(params: params);
  }
}
