import 'package:movie_dock_application/features/celebrities/domain/entities/celebrities_entitiy.dart';

class PopularCelebritiesState {}

final class PopularCelebritiesInitial extends PopularCelebritiesState {}

final class PopularCelebritiesSuccessfully extends PopularCelebritiesState {
  final List<CelebritiesEntity> PopularCelebrities;

  PopularCelebritiesSuccessfully({required this.PopularCelebrities});
}

final class PopularCelebritiesLoading extends PopularCelebritiesState {}

final class PopularCelebritiesFailure extends PopularCelebritiesState {
  final String errMessage;

  PopularCelebritiesFailure({required this.errMessage});
}
